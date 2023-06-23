import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:meteo_okester/INFRASTRUCTURE/core/firestore_helpers.dart';
import 'package:meteo_okester/DOMAIN/weatherdata/weatherdata.dart';
import 'package:meteo_okester/DOMAIN/weatherdata/weatherdata_failure.dart';
import 'package:meteo_okester/DOMAIN/core/value_objects.dart';
import 'weatherdata_dtos.dart';

abstract class IWeatherDataRepository {
  Stream<Either<WeatherDataFailure, List<WeatherData>>> watch();
  Future<Either<WeatherDataFailure, WeatherData>> watchWithId(UniqueId id);
  Future<Either<WeatherDataFailure, Unit>> create(WeatherData weatherData);
  Future<Either<WeatherDataFailure, Unit>> update(WeatherData weatherData);
  Future<Either<WeatherDataFailure, Unit>> delete(UniqueId id);
}

@LazySingleton(as: IWeatherDataRepository)
class WeatherDataRepository implements IWeatherDataRepository {
  final FirebaseFirestore _firestore;

  WeatherDataRepository(
    this._firestore,
  );

  @override
  Future<Either<WeatherDataFailure, Unit>> create(WeatherData weatherData) async {
    try {
      /* final user = (await getIt<AuthRepository>().getUserData())
          .fold(() => null, (user) => user);

      //UID de la tâche
      final uid = user?.id;
      if (uid != null)
        weatherData = weatherData.copyWith(uid: uid);
      else
        return left(const WeatherDataFailure.unexpected()); */

      //On crée la méchante tâche
      final weatherDataDTO = WeatherDataDTO.fromDomain(weatherData);
      await _firestore.weatherDataCollection.doc(weatherDataDTO.id).set(weatherDataDTO.toJson());

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message!.contains('permission-denied')) {
        return left(const WeatherDataFailure.insufficientPermission());
      } else if (e.message!
          .contains('The caller does not have permission to execute the specified operation')) {
        return left(const WeatherDataFailure.insufficientPermission());
      } else {
        return left(const WeatherDataFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<WeatherDataFailure, Unit>> delete(UniqueId id) async {
    try {
      await _firestore.weatherDataCollection.doc(id.getOrCrash()).delete();

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message!.contains('permission-denied')) {
        return left(const WeatherDataFailure.insufficientPermission());
      } else if (e.message!.contains('not-found')) {
        return left(const WeatherDataFailure.unableToUpdate());
      } else {
        return left(const WeatherDataFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<WeatherDataFailure, Unit>> update(WeatherData weatherData) async {
    try {
      final weatherDataDTO = WeatherDataDTO.fromDomain(weatherData);
      await _firestore.weatherDataCollection.doc(weatherDataDTO.id).update(weatherDataDTO.toJson());

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message!.contains('permission-denied')) {
        return left(const WeatherDataFailure.insufficientPermission());
      } else if (e.message!.contains('not-found')) {
        return left(const WeatherDataFailure.unableToUpdate());
      } else {
        return left(const WeatherDataFailure.unexpected());
      }
    }
  }

  @override
  Stream<Either<WeatherDataFailure, List<WeatherData>>> watch() async* {
    final collection = _firestore.weatherDataCollection;

    yield* collection
        .snapshots()
        .map(
          (snapshot) => right<WeatherDataFailure, List<WeatherData>>(
            snapshot.docs.map((doc) {
              try {
                return WeatherDataDTO.fromFirestore(doc).toDomain();
              } catch (e) {}
              return WeatherData.empty();
            }).toList(),
          ),
        )
        .handleError((e) {
      if (e is FirebaseException && e.message!.contains('permission-denied')) {
        return left(const WeatherDataFailure.insufficientPermission());
      } else {
        return left(const WeatherDataFailure.unexpected());
      }
    });
  }

  @override
  Future<Either<WeatherDataFailure, WeatherData>> watchWithId(UniqueId id) async {
    final collection = _firestore.weatherDataCollection.doc(id.getOrCrash());

    return collection.get().then((doc) => right(WeatherDataDTO.fromFirestore(doc)
        .toDomain())) /* .onError((e, stackTrace) => left(const WeatherDataFailure.unexpected())) */;
  }
}

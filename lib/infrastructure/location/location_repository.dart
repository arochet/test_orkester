import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:meteo_okester/INFRASTRUCTURE/core/firestore_helpers.dart';
import 'package:meteo_okester/DOMAIN/location/location.dart';
import 'package:meteo_okester/DOMAIN/location/location_failure.dart';
import 'package:meteo_okester/DOMAIN/core/value_objects.dart';
import 'location_dtos.dart';

abstract class ILocationRepository {
  Stream<Either<LocationFailure, List<Location>>> watch();
  Future<Either<LocationFailure, Location>> watchWithId(UniqueId id);
  Future<Either<LocationFailure, Unit>> create(Location location);
  Future<Either<LocationFailure, Unit>> update(Location location);
  Future<Either<LocationFailure, Unit>> delete(UniqueId id);
}

@LazySingleton(as: ILocationRepository)
class LocationRepository implements ILocationRepository {
  final FirebaseFirestore _firestore;

  LocationRepository(
    this._firestore,
  );

  @override
  Future<Either<LocationFailure, Unit>> create(Location location) async {
    try {
      /* final user = (await getIt<AuthRepository>().getUserData())
          .fold(() => null, (user) => user);

      //UID de la tâche
      final uid = user?.id;
      if (uid != null)
        location = location.copyWith(uid: uid);
      else
        return left(const LocationFailure.unexpected()); */

      //On crée la méchante tâche
      final locationDTO = LocationDTO.fromDomain(location);
      await _firestore.locationCollection.doc(locationDTO.id).set(locationDTO.toJson());

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message!.contains('permission-denied')) {
        return left(const LocationFailure.insufficientPermission());
      } else if (e.message!
          .contains('The caller does not have permission to execute the specified operation')) {
        return left(const LocationFailure.insufficientPermission());
      } else {
        return left(const LocationFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<LocationFailure, Unit>> delete(UniqueId id) async {
    try {
      await _firestore.locationCollection.doc(id.getOrCrash()).delete();

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message!.contains('permission-denied')) {
        return left(const LocationFailure.insufficientPermission());
      } else if (e.message!.contains('not-found')) {
        return left(const LocationFailure.unableToUpdate());
      } else {
        return left(const LocationFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<LocationFailure, Unit>> update(Location location) async {
    try {
      final locationDTO = LocationDTO.fromDomain(location);
      await _firestore.locationCollection.doc(locationDTO.id).update(locationDTO.toJson());

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message!.contains('permission-denied')) {
        return left(const LocationFailure.insufficientPermission());
      } else if (e.message!.contains('not-found')) {
        return left(const LocationFailure.unableToUpdate());
      } else {
        return left(const LocationFailure.unexpected());
      }
    }
  }

  @override
  Stream<Either<LocationFailure, List<Location>>> watch() async* {
    final collection = _firestore.locationCollection;

    yield* collection
        .snapshots()
        .map(
          (snapshot) => right<LocationFailure, List<Location>>(
            snapshot.docs.map((doc) {
              try {
                return LocationDTO.fromFirestore(doc).toDomain();
              } catch (e) {}
              return Location.empty();
            }).toList(),
          ),
        )
        .handleError((e) {
      if (e is FirebaseException && e.message!.contains('permission-denied')) {
        return left(const LocationFailure.insufficientPermission());
      } else {
        return left(const LocationFailure.unexpected());
      }
    });
  }

  @override
  Future<Either<LocationFailure, Location>> watchWithId(UniqueId id) async {
    final collection = _firestore.locationCollection.doc(id.getOrCrash());

    return collection.get().then((doc) => right(LocationDTO.fromFirestore(doc)
        .toDomain())) /* .onError((e, stackTrace) => left(const LocationFailure.unexpected())) */;
  }
}

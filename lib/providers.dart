import 'package:dartz/dartz.dart';
import 'package:meteo_okester/APPLICATION/account/modify_form_notifier.dart';
import 'package:meteo_okester/APPLICATION/auth/auth_notifier.dart';
import 'package:meteo_okester/APPLICATION/account/new_password_form_notifier.dart';
import 'package:meteo_okester/APPLICATION/account/reauthenticate_form_notifier.dart';
import 'package:meteo_okester/APPLICATION/auth/register_form_notifier.dart';
import 'package:meteo_okester/APPLICATION/auth/reset_password_notifier.dart';
import 'package:meteo_okester/APPLICATION/auth/sign_in_form_notifier.dart';
import 'package:meteo_okester/APPLICATION/location/add_location_form_notifier.dart';
import 'package:meteo_okester/APPLICATION/weatherdata/add_weatherdata_form_notifier.dart';
import 'package:meteo_okester/DOMAIN/auth/user_auth.dart';
import 'package:meteo_okester/DOMAIN/auth/user_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:meteo_okester/INFRASTRUCTURE/location/location_repository.dart';
import 'package:meteo_okester/INFRASTRUCTURE/weatherdata/weatherdata_repository.dart';

import 'DOMAIN/core/errors.dart';
import 'DOMAIN/core/value_objects.dart';
import 'DOMAIN/location/location.dart';
import 'DOMAIN/location/location_failure.dart';
import 'DOMAIN/weatherdata/weatherdata.dart';
import 'DOMAIN/weatherdata/weatherdata_failure.dart';
import 'INFRASTRUCTURE/auth/auth_repository.dart';
import 'injection.dart';

//ENVIRONNEMENT
final environment = StateProvider<Environment>((ref) => Environment(Environment.dev));
final showFilePath = StateProvider<bool>((ref) => false);

//AUTHENTIFICATION
/// Repository pour l'authentification
/// (Gère les appels à Firebase pour ajout / modification / Suppression de comptes)
final authRepositoryProvider = Provider<AuthRepository>((ref) => getIt<AuthRepository>());

/// Vérfie si l'utilisateur est connecté
final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(ref.watch(authRepositoryProvider))..authCheckRequested(),
);

/// FORM - Formulaire de connexion
final signInFormNotifierProvider = StateNotifierProvider.autoDispose<SignInFormNotifier, SignInFormData>(
  (ref) => SignInFormNotifier(ref.watch(authRepositoryProvider)),
);

/// FORM - Formulaire d'inscription
final registerFormNotifierProvider =
    StateNotifierProvider.autoDispose<RegisterFormNotifier, RegisterFormData>(
  (ref) => RegisterFormNotifier(ref.watch(authRepositoryProvider)),
);

/// FORM - Formulaire de modification des données utilisateurs
final modifyFormNotifierProvider = StateNotifierProvider.autoDispose<ModifyFormNotifier, ModifyFormData>(
  (ref) => ModifyFormNotifier(ref.watch(authRepositoryProvider)),
);

/// FORM - Formulaire de réauthentification
/// (Demande le mot de passe pour effectuer une action sensible)
final reauthenticateFormNotifierProvider =
    StateNotifierProvider.autoDispose<ReauthenticateFormNotifier, ReauthenticateFormData>(
  (ref) => ReauthenticateFormNotifier(ref.watch(authRepositoryProvider)),
);

/// FORM - Formulaire de demande de nouveau mot de passe
final newPasswordFormNotifierProvider =
    StateNotifierProvider.autoDispose<NewPasswordFormNotifier, NewPasswordFormData>(
  (ref) => NewPasswordFormNotifier(ref.watch(authRepositoryProvider)),
);

/// FORM - Formulaire pour réinitialiser le mot de passe
final resetPasswordFormNotifierProvider =
    StateNotifierProvider.autoDispose<ResetPasswordFormNotifier, ResetPasswordFormData>(
  (ref) => ResetPasswordFormNotifier(ref.watch(authRepositoryProvider)),
);

//HOME PAGE
/// Index de la page courante sur la barre de navigation du menu principal
final currentPageNavProvider = StateProvider<int?>((ref) => null);

//USER
/// Utilisateur courant (comprend son identifiant FirebaseAuth)
final currentUser = FutureProvider.autoDispose<UserAuth>((ref) async {
  final userOption = await getIt<AuthRepository>().getSignedUser();
  return userOption.getOrElse(() => throw NotAuthenticatedError);
});

/// Utilisateur courant (comprend ses données FireStore)
final currentUserData = FutureProvider.autoDispose<UserData?>((ref) async {
  ref.watch(currentUser);
  final userOption = await getIt<AuthRepository>().getUserData();
  final user = userOption.getOrElse(() => UserData.empty());

  if (user == UserData.empty() || userOption.isNone())
    return null;
  else
    return user;
});

//LOCATION

final locationRepositoryProvider = Provider<ILocationRepository>((ref) => getIt<ILocationRepository>());

final locationFormNotifierProvider =
    StateNotifierProvider.autoDispose<LocationFormNotifier, AddLocationFormData>(
  (ref) => LocationFormNotifier(ref.watch(locationRepositoryProvider)),
);

final allLocationProvider = StreamProvider.autoDispose<Either<LocationFailure, List<Location>>>(
    (ref) => ref.watch(locationRepositoryProvider).watch());

final oneLocationProvider = FutureProvider.autoDispose.family<Either<LocationFailure, Location>, UniqueId>(
    (ref, id) => ref.watch(locationRepositoryProvider).watchWithId(id));

//WEATHER DATA
final weatherDataRepositoryProvider =
    Provider<IWeatherDataRepository>((ref) => getIt<IWeatherDataRepository>());

final weatherDataFormNotifierProvider =
    StateNotifierProvider.autoDispose<WeatherDataFormNotifier, AddWeatherDataFormData>(
  (ref) => WeatherDataFormNotifier(ref.watch(weatherDataRepositoryProvider)),
);

final allWeatherDataProvider = StreamProvider.autoDispose<Either<WeatherDataFailure, List<WeatherData>>>(
    (ref) => ref.watch(weatherDataRepositoryProvider).watch());

final oneWeatherDataProvider = FutureProvider.autoDispose
    .family<Either<WeatherDataFailure, WeatherData>, UniqueId>(
        (ref, id) => ref.watch(weatherDataRepositoryProvider).watchWithId(id));

//insert-provider
//Ne pas supprimer la balise ci-dessus

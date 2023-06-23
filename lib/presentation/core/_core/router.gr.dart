// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    MainNavigationRoute.name: (routeData) {
      final args = routeData.argsAs<MainNavigationRouteArgs>(
          orElse: () => const MainNavigationRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MainNavigationPage(key: args.key),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
    AuthInitRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthInitPage(),
      );
    },
    AuthResetPasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthResetPasswordPage(),
      );
    },
    AuthRegisterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthRegisterPage(),
      );
    },
    AuthCheckEmailRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthCheckEmailPage(),
      );
    },
    AuthConnexionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthConnexionPage(),
      );
    },
    SearchRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SearchPage(),
      );
    },
    NewPasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NewPasswordPage(),
      );
    },
    ReauthenticateRoute.name: (routeData) {
      final args = routeData.argsAs<ReauthenticateRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ReauthenticatePage(
          key: args.key,
          route: args.route,
        ),
      );
    },
    DeleteAccountRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DeleteAccountPage(),
      );
    },
    ModifyAccountRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ModifyAccountPage(),
      );
    },
    ButtonsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ButtonsPage(),
      );
    },
    UtilsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UtilsPage(),
      );
    },
    AccountRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AccountPage(),
      );
    },
    TextStyleRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TextStylePage(),
      );
    },
    ComponentsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ComponentsPage(),
      );
    },
    ColorsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ColorsPage(),
      );
    },
    LocationListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LocationListPage(),
      );
    },
    LocationViewRoute.name: (routeData) {
      final args = routeData.argsAs<LocationViewRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LocationViewPage(
          id: args.id,
          key: args.key,
        ),
      );
    },
    LocationAddRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LocationAddPage(),
      );
    },
    WeatherDataListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WeatherDataListPage(),
      );
    },
    WeatherDataViewRoute.name: (routeData) {
      final args = routeData.argsAs<WeatherDataViewRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WeatherDataViewPage(
          id: args.id,
          key: args.key,
        ),
      );
    },
    WeatherDataAddRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WeatherDataAddPage(),
      );
    },
  };
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainNavigationPage]
class MainNavigationRoute extends PageRouteInfo<MainNavigationRouteArgs> {
  MainNavigationRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          MainNavigationRoute.name,
          args: MainNavigationRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'MainNavigationRoute';

  static const PageInfo<MainNavigationRouteArgs> page =
      PageInfo<MainNavigationRouteArgs>(name);
}

class MainNavigationRouteArgs {
  const MainNavigationRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'MainNavigationRouteArgs{key: $key}';
  }
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AuthInitPage]
class AuthInitRoute extends PageRouteInfo<void> {
  const AuthInitRoute({List<PageRouteInfo>? children})
      : super(
          AuthInitRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthInitRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AuthResetPasswordPage]
class AuthResetPasswordRoute extends PageRouteInfo<void> {
  const AuthResetPasswordRoute({List<PageRouteInfo>? children})
      : super(
          AuthResetPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthResetPasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AuthRegisterPage]
class AuthRegisterRoute extends PageRouteInfo<void> {
  const AuthRegisterRoute({List<PageRouteInfo>? children})
      : super(
          AuthRegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRegisterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AuthCheckEmailPage]
class AuthCheckEmailRoute extends PageRouteInfo<void> {
  const AuthCheckEmailRoute({List<PageRouteInfo>? children})
      : super(
          AuthCheckEmailRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthCheckEmailRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AuthConnexionPage]
class AuthConnexionRoute extends PageRouteInfo<void> {
  const AuthConnexionRoute({List<PageRouteInfo>? children})
      : super(
          AuthConnexionRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthConnexionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SearchPage]
class SearchRoute extends PageRouteInfo<void> {
  const SearchRoute({List<PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NewPasswordPage]
class NewPasswordRoute extends PageRouteInfo<void> {
  const NewPasswordRoute({List<PageRouteInfo>? children})
      : super(
          NewPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewPasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ReauthenticatePage]
class ReauthenticateRoute extends PageRouteInfo<ReauthenticateRouteArgs> {
  ReauthenticateRoute({
    Key? key,
    required PageRouteInfo<dynamic> route,
    List<PageRouteInfo>? children,
  }) : super(
          ReauthenticateRoute.name,
          args: ReauthenticateRouteArgs(
            key: key,
            route: route,
          ),
          initialChildren: children,
        );

  static const String name = 'ReauthenticateRoute';

  static const PageInfo<ReauthenticateRouteArgs> page =
      PageInfo<ReauthenticateRouteArgs>(name);
}

class ReauthenticateRouteArgs {
  const ReauthenticateRouteArgs({
    this.key,
    required this.route,
  });

  final Key? key;

  final PageRouteInfo<dynamic> route;

  @override
  String toString() {
    return 'ReauthenticateRouteArgs{key: $key, route: $route}';
  }
}

/// generated route for
/// [DeleteAccountPage]
class DeleteAccountRoute extends PageRouteInfo<void> {
  const DeleteAccountRoute({List<PageRouteInfo>? children})
      : super(
          DeleteAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'DeleteAccountRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ModifyAccountPage]
class ModifyAccountRoute extends PageRouteInfo<void> {
  const ModifyAccountRoute({List<PageRouteInfo>? children})
      : super(
          ModifyAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'ModifyAccountRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ButtonsPage]
class ButtonsRoute extends PageRouteInfo<void> {
  const ButtonsRoute({List<PageRouteInfo>? children})
      : super(
          ButtonsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ButtonsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UtilsPage]
class UtilsRoute extends PageRouteInfo<void> {
  const UtilsRoute({List<PageRouteInfo>? children})
      : super(
          UtilsRoute.name,
          initialChildren: children,
        );

  static const String name = 'UtilsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AccountPage]
class AccountRoute extends PageRouteInfo<void> {
  const AccountRoute({List<PageRouteInfo>? children})
      : super(
          AccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TextStylePage]
class TextStyleRoute extends PageRouteInfo<void> {
  const TextStyleRoute({List<PageRouteInfo>? children})
      : super(
          TextStyleRoute.name,
          initialChildren: children,
        );

  static const String name = 'TextStyleRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ComponentsPage]
class ComponentsRoute extends PageRouteInfo<void> {
  const ComponentsRoute({List<PageRouteInfo>? children})
      : super(
          ComponentsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ComponentsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ColorsPage]
class ColorsRoute extends PageRouteInfo<void> {
  const ColorsRoute({List<PageRouteInfo>? children})
      : super(
          ColorsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ColorsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LocationListPage]
class LocationListRoute extends PageRouteInfo<void> {
  const LocationListRoute({List<PageRouteInfo>? children})
      : super(
          LocationListRoute.name,
          initialChildren: children,
        );

  static const String name = 'LocationListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LocationViewPage]
class LocationViewRoute extends PageRouteInfo<LocationViewRouteArgs> {
  LocationViewRoute({
    required UniqueId id,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          LocationViewRoute.name,
          args: LocationViewRouteArgs(
            id: id,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'LocationViewRoute';

  static const PageInfo<LocationViewRouteArgs> page =
      PageInfo<LocationViewRouteArgs>(name);
}

class LocationViewRouteArgs {
  const LocationViewRouteArgs({
    required this.id,
    this.key,
  });

  final UniqueId id;

  final Key? key;

  @override
  String toString() {
    return 'LocationViewRouteArgs{id: $id, key: $key}';
  }
}

/// generated route for
/// [LocationAddPage]
class LocationAddRoute extends PageRouteInfo<void> {
  const LocationAddRoute({List<PageRouteInfo>? children})
      : super(
          LocationAddRoute.name,
          initialChildren: children,
        );

  static const String name = 'LocationAddRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WeatherDataListPage]
class WeatherDataListRoute extends PageRouteInfo<void> {
  const WeatherDataListRoute({List<PageRouteInfo>? children})
      : super(
          WeatherDataListRoute.name,
          initialChildren: children,
        );

  static const String name = 'WeatherDataListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WeatherDataViewPage]
class WeatherDataViewRoute extends PageRouteInfo<WeatherDataViewRouteArgs> {
  WeatherDataViewRoute({
    required UniqueId id,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          WeatherDataViewRoute.name,
          args: WeatherDataViewRouteArgs(
            id: id,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'WeatherDataViewRoute';

  static const PageInfo<WeatherDataViewRouteArgs> page =
      PageInfo<WeatherDataViewRouteArgs>(name);
}

class WeatherDataViewRouteArgs {
  const WeatherDataViewRouteArgs({
    required this.id,
    this.key,
  });

  final UniqueId id;

  final Key? key;

  @override
  String toString() {
    return 'WeatherDataViewRouteArgs{id: $id, key: $key}';
  }
}

/// generated route for
/// [WeatherDataAddPage]
class WeatherDataAddRoute extends PageRouteInfo<void> {
  const WeatherDataAddRoute({List<PageRouteInfo>? children})
      : super(
          WeatherDataAddRoute.name,
          initialChildren: children,
        );

  static const String name = 'WeatherDataAddRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

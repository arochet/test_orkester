import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meteo_okester/PRESENTATION/core/_components/spacing.dart';
import 'package:location/location.dart';

class MainPanel extends ConsumerStatefulWidget {
  const MainPanel({Key? key}) : super(key: key);

  @override
  _MainPanelState createState() => _MainPanelState();
}

class _MainPanelState extends ConsumerState<MainPanel> {
  LocationData? locationData;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      Location location = new Location();

      bool _serviceEnabled;
      PermissionStatus _permissionGranted;

      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          return;
        }
      }

      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          return;
        }
      }
      print('object');

      try {
        final locationData2 = await location.getLocation();
        print('lcoation 2 $locationData2');
      } catch (e) {
        print('e $e');
      }
      setState(() {
        print('object ${locationData?.latitude}');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /* AppAsync(
                ref.watch(currentUserData),
                builder: (UserData? p0) => Text(p0?.email?.getOrCrash() ?? 'no user'),
                loading: Text('...'),
              ), */
        Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              child: Card(
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Localisation : '),
                    Text('${locationData?.latitude}'),
                    SpaceH20(),
                    Text('Température : '),
                  ],
                )),
              ),
            )),
        Expanded(child: Card(child: Center(child: Text('Home')))),
      ],
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:meteo_okester/PRESENTATION/core/_core/router.dart';
import 'package:meteo_okester/PRESENTATION/core/_utils/dev_utils.dart';
import 'package:flutter/material.dart';
import 'panel_list.dart';

class PanelAdmin extends StatelessWidget {
  const PanelAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PanelList(
      title: 'PanelAdmin',
      list: [
        ItemPanelList(
          title: 'Localisation',
          icon: Icons.view_day,
          onTap: () {
            printDev();
            context.router.push(LocationListRoute());
          },
        ),
        ItemPanelList(
          title: 'Donnée météo',
          icon: Icons.view_day,
          onTap: () {
            printDev();
            context.router.push(WeatherDataListRoute());
          },
        ),
      ],
    );
  }
}

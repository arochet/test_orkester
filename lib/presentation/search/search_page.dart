import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:meteo_okester/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:meteo_okester/PRESENTATION/core/_components/show_component_file.dart';

@RoutePage()
class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShowComponentFile(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text('insert-code'),
      ),
    );
  }
}

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meteo_okester/PRESENTATION/core/_components/app_async.dart';
import 'package:meteo_okester/PRESENTATION/core/_components/app_error.dart';
import 'package:meteo_okester/PRESENTATION/core/_utils/date_utils.dart';
import 'package:meteo_okester/providers.dart';

import '../../../DOMAIN/location/app_location.dart';
import '../../../DOMAIN/location/location_failure.dart';
import 'result_list_location.dart';

class PanelSearch extends ConsumerStatefulWidget {
  const PanelSearch({Key? key}) : super(key: key);

  @override
  _PanelSearchState createState() => _PanelSearchState();
}

class _PanelSearchState extends ConsumerState<PanelSearch> {
  DateTime? date;
  String? place;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //FORMULAIRE DE RECHERCHE
        Container(
          height: 170,
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            child: ListView(padding: const EdgeInsets.all(18), shrinkWrap: true, children: [
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Place', suffixIcon: Icon(Icons.search)),
                autocorrect: false,
                textInputAction: TextInputAction.next,
                onChanged: (value) {
                  setState(() {
                    place = value;
                  });
                },
                validator: (_) {
                  return null;
                },
              ),
              const SizedBox(height: 15), //insert-field-complete
              InkWell(
                onTap: () async {
                  final DateTime? date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2071));
                  if (date != null) {
                    setState(() {
                      this.date = date;
                    });
                  }
                },
                child: Card(
                  margin: EdgeInsets.zero,
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                              "${date != null ? AppDateUtils.formatDate(date, 'dd-mm-yy hh:mm') : 'Définir un date'}",
                              style: Theme.of(context).textTheme.bodyLarge),
                        ),
                        InkWell(
                            onTap: () {
                              setState(() {
                                date = null;
                              });
                            },
                            child: Icon(Icons.delete, color: Colors.white)),
                      ],
                    ),
                  )),
                ),
              ),
            ]),
          ),
        ),
        // RESULTATS
        Expanded(
          child: ResultListLocation(
            dateSearch: date,
            placeSearch: place,
          ),
        ),
      ],
    );
  }
}

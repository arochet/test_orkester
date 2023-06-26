import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meteo_okester/PRESENTATION/core/_utils/date_utils.dart';

class PanelSearch extends ConsumerStatefulWidget {
  const PanelSearch({Key? key}) : super(key: key);

  @override
  _PanelSearchState createState() => _PanelSearchState();
}

class _PanelSearchState extends ConsumerState<PanelSearch> {
  DateTime? date;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                onChanged: (value) {},
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
                    child: Text(
                        "${date != null ? AppDateUtils.formatDate(date, 'dd-mm-yy hh:mm') : 'Définir un date'}",
                        style: Theme.of(context).textTheme.headlineSmall),
                  )),
                ),
              ),
            ]),
          ),
        ),
        // Les résultats
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView(
              children: [
                Text("Résultats", style: Theme.of(context).textTheme.headlineSmall),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
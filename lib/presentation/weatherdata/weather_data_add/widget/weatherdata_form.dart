import 'package:another_flushbar/flushbar.dart';
import 'package:meteo_okester/APPLICATION/auth/register_form_notifier.dart';
import 'package:meteo_okester/PRESENTATION/auth/widget/flushbar_auth_failure.dart';
import 'package:meteo_okester/APPLICATION/weatherdata/add_weatherdata_form_notifier.dart';
import 'package:meteo_okester/PRESENTATION/core/_core/router.dart';
import 'package:meteo_okester/PRESENTATION/core/_utils/dev_utils.dart';

import 'package:meteo_okester/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/src/router/auto_router_x.dart';

class WeatherDataFormProvider extends ConsumerWidget {
  const WeatherDataFormProvider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AddWeatherDataFormData>(
        weatherDataFormNotifierProvider as ProviderListenable<AddWeatherDataFormData>,
        (prev, myRegisterState) {
      myRegisterState.authFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold((failure) {
                //Message d'erreur
                Flushbar(
                  duration: const Duration(seconds: 3),
                  icon: const Icon(Icons.warning),
                  messageColor: Colors.red,
                  message: failure.map(
                      insufficientPermission: (_) => AppLocalizations.of(context)!.permissioninsuffisante,
                      unableToUpdate: (_) => "Unable to update",
                      unexpected: (_) => "Unexpected"),
                ).show(context);
              }, (_) {
                //Création réussie !
                Future.delayed(Duration.zero, () async {
                  context.router.pop();
                });
              }));
    });
    return WeatherDataForm();
  }
}

class WeatherDataForm extends ConsumerWidget {
  const WeatherDataForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addWeatherDataFormData = ref.watch(weatherDataFormNotifierProvider);
    return Form(
      autovalidateMode: AutovalidateMode.always,
      child: ListView(padding: const EdgeInsets.all(18), shrinkWrap: true, children: [
        const SizedBox(height: 8),
        //insert-field-complete
        TextFormField(
          decoration: const InputDecoration(labelText: 'idLocalisation'),
          autocorrect: false,
          textInputAction: TextInputAction.next,
          onChanged: (value) {
            ref.read(weatherDataFormNotifierProvider.notifier).idLocationChanged(value);
          },
          validator: (_) {
            final notifier = ref.read(weatherDataFormNotifierProvider);
            if (notifier.showErrorMessages) {
              return notifier.weatherData.idLocation.value.fold(
                (f) => f.maybeMap(
                  empty: (_) => 'idLocalisation vide',
                  orElse: () => null,
                ),
                (_) => null,
              );
            } else
              return null;
          },
        ),
        InkWell(
          onTap: () async {
            final DateTime? date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2020),
                lastDate: DateTime(2071));
            if (date != null) {
              ref.read(weatherDataFormNotifierProvider.notifier).dateChanged(date);
            }
          },
          child: Card(
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("${addWeatherDataFormData.weatherData.date}",
                  style: Theme.of(context).textTheme.headlineSmall),
            )),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(labelText: 'Type'),
          autocorrect: false,
          textInputAction: TextInputAction.next,
          onChanged: (value) {
            ref.read(weatherDataFormNotifierProvider.notifier).typeChanged(value);
          },
          validator: (_) {
            final notifier = ref.read(weatherDataFormNotifierProvider);
            if (notifier.showErrorMessages) {
              return notifier.weatherData.idLocation.value.fold(
                (f) => f.maybeMap(
                  exceedingLenghtOrNull: (_) => 'type invalide',
                  orElse: () => null,
                ),
                (_) => null,
              );
            } else
              return null;
          },
        ),
        const SizedBox(height: 14),
        Align(
          child: Container(
            width: 200,
            child: ElevatedButton(
              onPressed: () {
                printDev();
                ref.read(weatherDataFormNotifierProvider.notifier).addWeatherDataPressed();
              },
              child: const Text("Ajout"),
            ),
          ),
        ),
        const SizedBox(height: 12),
        if (ref.read(weatherDataFormNotifierProvider).isSubmitting) ...[
          const SizedBox(height: 8),
          const LinearProgressIndicator(value: null)
        ]
      ]),
    );
  }
}

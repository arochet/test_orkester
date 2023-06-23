import 'package:another_flushbar/flushbar.dart';
import 'package:meteo_okester/APPLICATION/auth/register_form_notifier.dart';
import 'package:meteo_okester/PRESENTATION/auth/widget/flushbar_auth_failure.dart';
import 'package:meteo_okester/APPLICATION/location/add_location_form_notifier.dart';
import 'package:meteo_okester/PRESENTATION/core/_core/router.dart';

import 'package:meteo_okester/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/src/router/auto_router_x.dart';

class LocationFormProvider extends ConsumerWidget {
  const LocationFormProvider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AddLocationFormData>(locationFormNotifierProvider, (prev, myRegisterState) {
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
                      unexpected: (_) => "Unexpected",
                      invalidCoordinate: (_) => "Invalid coordinate"),
                ).show(context);
              }, (_) {
                //Création réussie !
                Future.delayed(Duration.zero, () async {
                  context.router.pop();
                });
              }));
    });
    return LocationForm();
  }
}

class LocationForm extends ConsumerWidget {
  const LocationForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(locationFormNotifierProvider);
    return Form(
      autovalidateMode: AutovalidateMode.always,
      child: ListView(padding: const EdgeInsets.all(18), shrinkWrap: true, children: [
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(labelText: 'place'),
          autocorrect: false,
          textInputAction: TextInputAction.next,
          onChanged: (value) {
            ref.read(locationFormNotifierProvider.notifier).placeChanged(value);
          },
          validator: (_) {
            final notifier = ref.read(locationFormNotifierProvider);
            if (notifier.showErrorMessages) {
              return notifier.location.place.value.fold(
                (f) => f.maybeMap(
                  exceedingLenghtOrNull: (_) => 'place invalide',
                  orElse: () => null,
                ),
                (_) => null,
              );
            } else
              return null;
          },
        ),
        const SizedBox(height: 8), //insert-field-complete
        const SizedBox(height: 14),
        Align(
          child: Container(
            width: 200,
            child: ElevatedButton(
              onPressed: () {
                ref.read(locationFormNotifierProvider.notifier).addLocationPressed();
              },
              child: const Text("Ajout"),
            ),
          ),
        ),
        const SizedBox(height: 12),
        if (ref.read(locationFormNotifierProvider).isSubmitting) ...[
          const SizedBox(height: 8),
          const LinearProgressIndicator(value: null)
        ]
      ]),
    );
  }
}

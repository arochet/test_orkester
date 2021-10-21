import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ButtonGoogle extends StatelessWidget {
  const ButtonGoogle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Container(
        width: 350,
        child: SignInButton(
          Buttons.Google,
          text: AppLocalizations.of(context)!.connexionavecgoogle,
          onPressed: () {
            context
                .read(signInFormNotifierProvider.notifier)
                .signInWithGooglePressed();
          },
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(40.0))),
        ),
      ),
    );
  }
}

import 'package:base_de_projet/domain/auth/user_data.dart';
import 'package:base_de_projet/presentation/account/account/card_show_info.dart';
import 'package:base_de_projet/presentation/account/reauthenticate/reauthenticate_page.dart';
import 'package:base_de_projet/presentation/components/spacing.dart';
import 'package:base_de_projet/presentation/core/router.dart';
import 'package:base_de_projet/presentation/core/theme.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  void initState() {
    super.initState();
    //Rafraichit les données utilisateur lors de l'initialisation
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => context.refresh(currentUserData));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      AsyncValue<UserData?> user = watch(currentUserData);
      //Récupère les données utilisateurs (Informations personnelles)
      String nameUser = "";
      String email = "";
      user.when(
        data: (data) {
          if (data != null) {
            nameUser = data.userName.getOrCrash();
            email = data.email.getOrCrash();
          }
        },
        loading: () {
          nameUser = "...";
          email = "...";
        },
        error: (err, stack) {
          nameUser = "Error";
          email = "Erro";
        },
      );

      //Container Informations personnelles
      return ListView(
        children: <Widget>[
          SpaceH20(),
          //TEXTE COMPTE
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
            child: Text(AppLocalizations.of(context)!.compte,
                style: Theme.of(context).textTheme.headline3),
          ),
          //PANEL
          PanelList(
            list: [
              ItemPanelList(
                title: nameUser,
                icon: Icons.account_circle_rounded,
                onTap: () {},
              ),
              ItemPanelList(
                title: email,
                icon: Icons.mail_rounded,
                onTap: () {},
              ),
            ],
            //Bouton modifier
            button: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRouter.modifyAccount);
              },
              style: buttonPrimaryHide,
              child: Text(AppLocalizations.of(context)!.modifier),
            ),
          ),
          //PANEL
          PanelList(list: [
            //Modifier le mot de passe
            ItemPanelList(
              title: AppLocalizations.of(context)!.modifiermotdepasse,
              icon: Icons.lock,
              onTap: () {
                Navigator.pushNamed(context, AppRouter.reauthenticate,
                    arguments:
                        ReauthentificationArguments(AppRouter.newPassword));
              },
            ),
            //Supprimer le compte
            ItemPanelList(
              title: AppLocalizations.of(context)!.supprimerlecompte,
              icon: Icons.cancel,
              onTap: deleteAccount,
            ),
          ]),
          SpaceH10(),
          //BOUTON SE DECONNECTER
          Align(
            child: ElevatedButton(
              onPressed: () {
                context.read(authNotifierProvider.notifier).signOut();
              },
              style: buttonPrimaryNormal,
              child: Text(AppLocalizations.of(context)!.sedeconnecter),
            ),
          ),
        ],
      );
    });
  }

  deleteAccount() {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Annuler", style: Theme.of(context).textTheme.button),
      onPressed: () => Navigator.of(context).pop(),
    );
    Widget continueButton = TextButton(
      child: Text("Supprimer",
          style:
              Theme.of(context).textTheme.button?.copyWith(color: Colors.red)),
      onPressed: () {
        Navigator.popAndPushNamed(context, AppRouter.reauthenticate,
            arguments: ReauthentificationArguments(AppRouter.deleteAccount));
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Attention !"),
      content: Text("Etes-vous sur de vouloir supprimer votre compte ?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

class ItemPanelList {
  final IconData icon;
  final String title;
  final Function() onTap;

  ItemPanelList({required this.title, required this.icon, required this.onTap});
}

class PanelList extends StatelessWidget {
  final List<ItemPanelList> list;
  final ElevatedButton? button;
  const PanelList({Key? key, required this.list, this.button})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
        child: Column(children: [
          ...list
              .map((item) => GestureDetector(
                    onTap: item.onTap,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Icon(item.icon),
                          SizedBox(width: 10),
                          Text(item.title),
                        ],
                      ),
                    ),
                  ))
              .toList(),
          //if (button != null) SpaceH10(),
          button ?? Container(),
        ]),
      ),
    );
  }
}
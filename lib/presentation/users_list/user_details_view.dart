import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/domain/User.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const userDetailsRoute = '/user_details';

class UserDetailsView extends StatelessWidget {
  const UserDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)?.settings.arguments as User;
    return Scaffold(
        appBar: AppBar(title: const Text('Users Details')),
        body: Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(user.avatar, height: 300, fit: BoxFit.fill),
                  ],
                ),
                Container(
                    margin: const EdgeInsets.only(top: 12),
                    child: Text(
                      AppLocalizations.of(context)!.user_name + user.firstName,
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.left,
                    )),
                Container(
                    margin: const EdgeInsets.only(top: 12),
                    child: Text(
                      AppLocalizations.of(context)!.user_surname +
                          user.lastName,
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.left,
                    )),
                Container(
                    margin: const EdgeInsets.only(top: 12),
                    child: Text(
                      AppLocalizations.of(context)!.user_email + user.email,
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.left,
                    )),
              ],
            )));
  }
}

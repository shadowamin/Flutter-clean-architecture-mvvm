import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/presentation/theme/theme.dart';
import 'package:flutter_clean_architecture/presentation/users_list/user_details_view.dart';
import 'package:flutter_clean_architecture/presentation/users_list/users_list_view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: defaultTheme,
      routes: {
        listUsersRoute: (_) => const UsersListView(),
        userDetailsRoute: (_) => const UserDetailsView()
      },
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('fr', ''),
        Locale('ar', ''),
      ],
    );
  }
}

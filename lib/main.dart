import 'package:dateandtime/KhaltiPayment.dart';
import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return KhaltiScope(
        publicKey: 'test_public_key_dc006e10a4204acd8cad6e95f1f26edf',
        enabledDebugging: true,
        builder: (context, navKey) {
          return MaterialApp(
            home: HomePage(),
            navigatorKey: navKey,
            localizationsDelegates: const [KhaltiLocalizations.delegate],
          );
        });
  }
}

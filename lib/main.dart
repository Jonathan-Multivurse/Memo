import 'package:flutter/material.dart';
import 'package:ppm/routes/routes.dart';
import 'package:ppm/screens/authentication.dart';
import 'package:ppm/state/state.dart';
import 'package:ppm/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    stateProvider(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthScreen(),
        theme: theme,
        onGenerateRoute: Routes.generateRoute,
      ),
    ),
  );
}

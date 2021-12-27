import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:ppm/app.dart';
import 'package:ppm/screens/authentication.dart';
import 'package:ppm/screens/notifications.dart';
import 'package:ppm/screens/registration.dart';

const String AuthenticationRoute = '/authentication';
const String RegistrationRoute = '/registration';
const String ResetpasswordRoute = '/reset-password';
const String HomeRoute = '/home';
const String NotificationsRoute = '/notifications';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RegistrationRoute:
        return PageTransition(
          child: RegScreen(),
          type: PageTransitionType.rightToLeftWithFade,
          settings: settings,
          duration: const Duration(milliseconds: 200),
        );
      case AuthenticationRoute:
        return PageTransition(
          child: AuthScreen(),
          type: PageTransitionType.leftToRightWithFade,
          settings: settings,
          duration: const Duration(milliseconds: 200),
        );
      case HomeRoute:
        return PageTransition(
          child: App(),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 200),
        );
      case NotificationsRoute:
        return PageTransition(
          child: NotificationScreen(),
          type: PageTransitionType.rightToLeftWithFade,
          settings: settings,
          duration: const Duration(milliseconds: 200),
        );
      default:
        return PageTransition(
          child: Container(),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 200),
        );
    }
  }
}

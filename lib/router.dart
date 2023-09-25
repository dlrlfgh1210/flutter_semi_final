import 'package:flutter_semi_final/home_screen.dart';
import 'package:flutter_semi_final/log_in_screen.dart';
import 'package:flutter_semi_final/sign_up_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod/riverpod.dart';

final routerProvider = Provider(
  (ref) {
    return GoRouter(
      initialLocation: SignUpScreen.routeURL,
      routes: [
        GoRoute(
          path: LogInScreen.routeURL,
          name: LogInScreen.routeName,
          builder: (context, state) => const LogInScreen(),
        ),
        GoRoute(
          path: SignUpScreen.routeURL,
          name: SignUpScreen.routeName,
          builder: (context, state) => const SignUpScreen(),
        ),
        GoRoute(
          path: HomeScreen.routeURL,
          name: HomeScreen.routeName,
          builder: (context, state) => const HomeScreen(),
        ),
      ],
    );
  },
);

import 'package:flutter_semi_final/first_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod/riverpod.dart';

final routerProvider = Provider(
  (ref) {
    return GoRouter(
      initialLocation: FirstScreen.routeURL,
      routes: [
        GoRoute(
          path: FirstScreen.routeURL,
          name: FirstScreen.routeName,
          builder: (context, state) => const FirstScreen(),
        ),
      ],
    );
  },
);

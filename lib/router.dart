import 'package:flutter_semi_final/home_screen.dart';
import 'package:flutter_semi_final/log_in_screen.dart';
import 'package:flutter_semi_final/navigation/main_navigation_screen.dart';
import 'package:flutter_semi_final/post_screen.dart';
import 'package:flutter_semi_final/sign_up_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod/riverpod.dart';

final routerProvider = Provider(
  (ref) {
    return GoRouter(
      initialLocation: "/post",
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
          path: "/:tab(home|post)",
          name: MainNavigationScreen.routeName,
          builder: (context, state) {
            final tab = state.pathParameters["tab"]!;
            return MainNavigationScreen(tab: tab);
          },
        ),
        GoRoute(
          path: HomeScreen.routeURL,
          name: HomeScreen.routeName,
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: PostScreen.routeURL,
          name: PostScreen.routeName,
          builder: (context, state) => const PostScreen(),
        ),
      ],
    );
  },
);

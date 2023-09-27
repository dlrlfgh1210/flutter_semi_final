import 'package:flutter_semi_final/authentication/repos/authentication_repo.dart';
import 'package:flutter_semi_final/authentication/views/sign_up_screen.dart';
import 'package:flutter_semi_final/home/views/home_screen.dart';
import 'package:flutter_semi_final/authentication/views/log_in_screen.dart';
import 'package:flutter_semi_final/navigation/main_navigation_screen.dart';
import 'package:flutter_semi_final/post/views/post_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod/riverpod.dart';

final routerProvider = Provider(
  (ref) {
    return GoRouter(
      initialLocation: "/home",
      redirect: (context, state) {
        final isLoggedIn = ref.read(authRepo).isLoggedIn;
        if (!isLoggedIn) {
          if (state.matchedLocation != SignUpScreen.routeURL &&
              state.matchedLocation != LogInScreen.routeURL) {
            return LogInScreen.routeURL;
          }
        }
        return null;
      },
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

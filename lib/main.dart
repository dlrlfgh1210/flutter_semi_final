import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_semi_final/firebase_options.dart';
import 'package:flutter_semi_final/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  GoRouter.optionURLReflectsImperativeAPIs = true;

  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.watch(routerProvider),
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          background: Colors.amber.shade100,
        ),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.amber.shade100,
          titleTextStyle: const TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottomAppBarTheme: BottomAppBarTheme(
          padding: const EdgeInsets.only(
            top: 10,
          ),
          color: Colors.amber.shade100,
          elevation: 0,
        ),
        useMaterial3: true,
      ),
    );
  }
}

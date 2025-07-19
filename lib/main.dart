import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/routes/routes.dart';
import 'package:flutter_application_1/injector/injector.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  setupInjector();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(debugShowCheckedModeBanner: false, routerConfig: router, title: 'Flutter Demo');
  }
}

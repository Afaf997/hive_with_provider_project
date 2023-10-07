// import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:hive_provider/controller/mainprovider.dart';
import 'package:hive_provider/view/bottomnav.dart';
// import 'package:hive_provider/view/list.dart';
// import 'package:hive_provider/view/todo.dart';
import 'package:provider/provider.dart';
import 'package:hive_provider/controller/theme.dart';
import 'package:lottie/lottie.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeModel = Provider.of<ThemeModel>(context);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: themeModel.ifDark ? ThemeData.dark() : ThemeData.light(),
      routerConfig: _router,
    );
  }

  final GoRouter _router = GoRouter(initialLocation: '/', routes: [
    GoRoute(path: "/", builder: ((context, state) => const HomePage())),
    GoRoute(path: "/second", builder: ((context, state) => const SecondPage())),
  ]);
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: 450,
        child: Lottie.asset('assets/first.json'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
        GoRouter.of(context).go("/second");
      
      
      }),
    );
  }
}

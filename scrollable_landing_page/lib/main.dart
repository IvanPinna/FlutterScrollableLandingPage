import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_landing_page/providers/page_provider.dart';
import 'package:scrollable_landing_page/router/router.dart';

void main() {
  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => PageProvider())
      ],
      child: MainApp(),
    );
  }
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    Flurorouter.configureRoutes();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Landing Page',
      initialRoute: '/home',
      onGenerateRoute: Flurorouter.router.generator,
      );
  }
}

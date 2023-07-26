import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kbook/screens/login_page.dart';
import 'package:postgres/postgres.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}

var connection = PostgreSQLConnection("localhost", 5432, "bd_kbook",
    queryTimeoutInSeconds: 3600,
    timeoutInSeconds: 3600,
    allowClearTextPassword: false,
    username: "postgres",
    password: "Jupiter2020",
    useSSL: true);

class PostgresConnection {
  Future connect() async {
    try {
      await connection.open();
      if (kDebugMode) {
        print("Connectado a PostgreSQL");
      }
    } catch (e) {
      if (kDebugMode) {
        print('error');
        print(e.toString());
      }
    }
  }

  Future disconnect() async {
    try {
      await connection.close();
      if (kDebugMode) {
        print("Desconectando de la base de datos.");
      }
    } catch (e) {
      if (kDebugMode) {
        print('error');
        print(e.toString());
      }
    }
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Image.asset('assets/gif/foco_idea.gif'),
          const Text(
            'kbook',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          )
        ],
      ),
      backgroundColor: Colors.orange,
      nextScreen: const LoginPage(),
      splashIconSize: 500,
      centered: true,
      duration: 4000,
      splashTransition: SplashTransition.scaleTransition,
      pageTransitionType: PageTransitionType.leftToRightWithFade,
      animationDuration: const Duration(seconds: 1),
    );
  }
}

import 'package:flutter/material.dart';
import 'views/login/login_screen.dart';
import 'views/home/home_screen.dart';
import 'views/register/register_screen.dart';

void main() {
  runApp(const AcademiaApp());
}

class AcademiaApp extends StatelessWidget {
  const AcademiaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Academia MVP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/register': (context) => const RegisterScreen(),
      },


      debugShowCheckedModeBanner: false,
    );
  }
}

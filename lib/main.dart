import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const DiceRollApp());
}

class DiceRollApp extends StatelessWidget {
  const DiceRollApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice Roll App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1F5F8A),
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF10151C),
        fontFamily: 'Montserrat', 
        useMaterial3: true,
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 38,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.5,
          ),
          bodyMedium: TextStyle(
            fontSize: 20,
            color: Colors.white70,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Color(0xFF198D61),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
            elevation: 10,
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),
          ),
        ),
      ),
      home: const HomePage(),
 
      onGenerateRoute: (settings) {
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const HomePage(),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
    );
  }
}
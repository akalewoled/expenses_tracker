import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import '/pages/auth_page.dart';
import '/onBoardingScreen/onboarding_screen.dart'; // Import your onboarding screen
import '/pages/login_or_register.dart'; // Import your login/signup page

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyD1Eef7125An8yqLOHPeJuW91tugRq8XUM',
      appId: '1:196861775474:android:cb5ca920bba671e4effceb',
      messagingSenderId: '196861775474',
      projectId: 'loginauth-63b23',
    ),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Set the initial route to your onboarding screen
      routes: {
        '/': (context) => OnBoardingScreen(), // Define route for onboarding screen
        '/login': (context) => AuthPage(), // Define route for login/signup page
      },
    );
  }
}

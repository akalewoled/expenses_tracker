import 'package:bloc/bloc.dart';
import 'package:expenses_tracker/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'simple_bloc_observer.dart';
import 'package:expenses_tracker/pages/auth_page.dart';

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  
    print('Connecting...'); // Print initial connecting message
    print('Connecting...');
    print('Connecting...');
    print('Connecting...');
    print('Connecting...');
    try {
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey:'AIzaSyDzwrqWP3mBChwHWrq7DPfwAnKWgeAHQTo',
    appId:'1:896326714689:android:437ba45cd07a5ba8880dc0',
    messagingSenderId:'896326714689',
    projectId:'finicial-tracker')
    );
  Bloc.observer = SimpleBlocObserver();
  print('Firebase connected successfully!');
  runApp(const MyApp1());
    } catch (e) {
    print('Firebase connection error: $e');
  }
}

class MyApp1 extends StatelessWidget {
  const MyApp1({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
    );
  }
}


import 'package:expenses_tracker/app.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_page.dart';
import 'login_or_register.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting && snapshot.connectionState != ConnectionState.done) {
            // If connection state is waiting, return a loading indicator
            print("trying to connect");
            return Center(child: CircularProgressIndicator());
          } else {
            // If user is logged in
            if (snapshot.hasData && snapshot.data != null ) {
              print("hasnt logged ");
              return  const MyApp();
            } else {
              print("user havent logged in");
              // If user is not logged in
              return LoginOrRegisterPage();
            }
          }
        },
      ),
    );
  }
}

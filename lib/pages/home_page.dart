import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;

    void signUserOut() {
      FirebaseAuth.instance.signOut();
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Text(user != null ? 'Logged in' : 'Not logged in'),
      ),
    );
  }
}

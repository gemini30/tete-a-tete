import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './screens/auth_screen.dart';
import './screens/chat_screen.dart';
import './models/palette.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'tête-à-tête',
      theme: ThemeData(
          primarySwatch: createMaterialColor(const Color(0xFF015095)),
          backgroundColor: createMaterialColor(const Color(0xFF015095)),
          accentColor: createMaterialColor(Color.fromARGB(255, 86, 221, 37)),
          buttonTheme: ButtonTheme.of(context).copyWith(
              buttonColor: createMaterialColor(const Color(0xFF015095)),
              textTheme: ButtonTextTheme.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)))),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (ctx, userSnapShot) {
          if (userSnapShot.hasData) {
            return ChatScreen();
          }
          return AuthScreen();
        },
      ),
    );
  }
}

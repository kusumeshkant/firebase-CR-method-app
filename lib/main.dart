import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/firebase.dart/googeSignIn.dart';
import 'package:provider/provider.dart';

import 'Ui/Auth_screen/logIn_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInp(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LogInScreen(),
      ),
    );
  }
}

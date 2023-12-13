import 'package:expense_app/Scplash_screen.dart';
import 'package:expense_app/add_expense.dart';
import 'package:expense_app/login_page.dart';
import 'package:expense_app/screens/all_expenses_page.dart';
import 'package:expense_app/screens/edit_profile.dart';
import 'package:expense_app/sing_up_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  SplashScreen()
    );
  }
}

import 'dart:async';

import 'package:expense_app/login_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
   SplashScreen({super.key});
   @override

  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>LoginPage()),);
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage("https://cdn.airalo.com/images/560421aa-2178-497d-9e4c-e2cc6109989d.jpg",),fit: BoxFit.cover),
          border: Border.all(color: Colors.white30)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Hii'Wellcome to Expenso",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w400,color: Colors.white),),
            ],
          ),
        ),
      ),
    );
  }
}

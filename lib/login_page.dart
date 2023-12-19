import 'package:expense_app/sing_up_page.dart';
import 'package:flutter/material.dart';
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(scrollDirection: Axis.vertical,
        child: Center(
          child: Container(width: 350,
            child: Column(
              children: [SingleChildScrollView(scrollDirection: Axis.vertical,),
                SizedBox(
                height: 100,
              ),
                Center(child: Text("Login",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),)),
                SizedBox(
                  height: 80,
                ),
               TextField(decoration: InputDecoration(
                 labelText: "Email",
                 border: OutlineInputBorder(

                 ),
                hintText: "Email"
               ),),
                SizedBox(
                  height: 40,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: "password",
                    border: OutlineInputBorder(
                    ),
                    hintText: "password"
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [SizedBox(
                    width: 230,
                  ),
                    InkWell(onTap: (){},
                        child: Text("Forgate Password?",style: TextStyle(fontSize: 13),)),
                  ],
                ),
                SizedBox(
                  height: 100,
                ),
                InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>SingUpPage()));},
                  child: Container(
                    height: 55,width: 300,
                    decoration: BoxDecoration(color: Colors.red,
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: Center(child: Text("login",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),)),
                  ),
                )
              ],

            ),
          ),
        ),
      ),
    );
  }
}

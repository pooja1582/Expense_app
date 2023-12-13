import 'package:expense_app/screens/all_expenses_page.dart';
import 'package:flutter/material.dart';
class SingUpPage extends StatelessWidget {
  const SingUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Container(width: 350,
          child: SingleChildScrollView(scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                height: 100,
              ),
                Center(child: Text("Sing Up",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),)),
                SizedBox(
                  height: 80,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                    ),
                     hintText: "Fullname"

                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                TextField(decoration: InputDecoration(
                    border: OutlineInputBorder(

                    ),
                    hintText: "Email"
                ),),
                SizedBox(
                  height: 40,
                ),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                      ),
                      hintText: "password"
                  ),
                ),

                SizedBox(
                  height: 100,
                ),
                InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>AllExpensesPage()));},
                  child: Container(
                    height: 55,width: 300,
                    decoration: BoxDecoration(color: Colors.red,
                        borderRadius: BorderRadius.circular(21)
                    ),
                    child: Center(child: Text("Sing Up",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),)),
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

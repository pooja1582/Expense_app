import 'package:expense_app/screens/all_expenses_page.dart';
import 'package:flutter/material.dart';
class SingUpPage extends StatelessWidget {
  const SingUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Container(height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage("https://dm0qx8t0i9gc9.cloudfront.net/thumbnails/image/rDtN98Qoishumwih/summer-background-abstract-background-wallpaper-use-for-presentation_HDDYoJOhMg_thumb.jpg"),fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                height: 60,
              ),
                Center(child: Text("Sing Up",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),)),
                SizedBox(
                  height: 60,
                ),
                TextField(
                  decoration: InputDecoration(  labelText:" FullName",
                    border: OutlineInputBorder(
                    ),
                     hintText: "Fullname"

                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                TextField(decoration: InputDecoration(  labelText:" Email",
                   border: OutlineInputBorder(),
                    hintText: "Email"
                ),),
                SizedBox(
                  height: 40,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText:" Password",
                      border: OutlineInputBorder(
                      ),
                      hintText: "password"
                  ),
                ),

                SizedBox(
                  height: 70,
                ),
                InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>Allexpense()));},
                  child: Container(
                    height: 55,width: 300,
                    decoration: BoxDecoration(color: Colors.red,
                        borderRadius: BorderRadius.circular(30)
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

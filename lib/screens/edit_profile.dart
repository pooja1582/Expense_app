import 'package:flutter/material.dart';
class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: InkWell(onTap: (){Navigator.pop(context);},
            child: Icon(Icons.arrow_back,color: Colors.white,)),
        title: Center(child: Text("Edit Profile",style: TextStyle(fontSize: 20,color: Colors.white),)),
      ),
      body: SingleChildScrollView(scrollDirection: Axis.vertical,
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.center,
          children: [SingleChildScrollView(scrollDirection:Axis.vertical,),
            SizedBox(
            height: 20,
          ),
           Center(
             child: CircleAvatar(radius: 70,
               backgroundImage: NetworkImage("https://images.unsplash.com/photo-1621012430307-b4774b78d3cb?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
             ),
           ),
            SizedBox(
              height: 50,
            ),
            TextField(decoration: InputDecoration(hintText: "Email Address"),),SizedBox(
              height: 20,
            ),
TextField(decoration: InputDecoration(hintText: "Name"),),SizedBox(
              height: 20,
            ),
            TextField(

              decoration: InputDecoration(

                hintText: "Context",
                suffixIcon: Icon(Icons.call,)

              ),

            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: (){}, child: Text("UPDATE PROFILE"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white
              ),

            )

          ],
        ),
      ),
    );
  }
}

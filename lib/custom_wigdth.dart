import 'package:flutter/material.dart';
class  Uihelper{
  static CustomTextField(TextEditingController controller,String text,) {
    return Padding(padding: EdgeInsets.symmetric(
        horizontal: 13,
        vertical: 15
    ), child: TextField(
      controller: controller,

      decoration: InputDecoration(
          hintText: text,
          border: OutlineInputBorder(


          )
      ),
    ));
  }
  static CustomButton(VoidCallback voidCallback,String text){
    return SizedBox(height: 45,width: 300,child: ElevatedButton(onPressed: (){
      voidCallback();
    },style: ElevatedButton.styleFrom(backgroundColor: Colors.black87,shape:
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
        child: Text(text,style: TextStyle(fontSize: 20,color: Colors.white),
        )),);
  }


}

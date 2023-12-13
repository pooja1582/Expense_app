import 'package:flutter/material.dart';
class AddExpense extends StatefulWidget {
   AddExpense({super.key});
List listItem = [
  "Debit"
];
  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(onTap: (){Navigator.pop(context);},
            child: const Icon(Icons.arrow_back,color: Colors.white,)),
        backgroundColor: Colors.red,
      ),
      body:
      SingleChildScrollView(scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              SizedBox(
              height: 50,
            ),
              TextField(decoration: InputDecoration(
               labelText: "Title",
                border: OutlineInputBorder()
              ),
              ),
              SizedBox(
                height: 12,
              ),
              TextField(decoration: InputDecoration(
                labelText: "Desc",
                border: OutlineInputBorder()
              ),),
              SizedBox(
                height: 12,
              ),
              TextField(decoration: InputDecoration(
                  labelText: "Enter Amount here...",
                  border: OutlineInputBorder()
              ),),
              SizedBox(
                height: 12,
              ),
              ElevatedButton(
                  onPressed: (){
                    bottomsheets(context);
                  }, child: Text("Choose Categary"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 50)
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Debit",style: TextStyle(fontSize: 20),),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(height: 30,width: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black54)
                    ),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("12",style: TextStyle(fontSize: 18),),
                        Icon(Icons.keyboard_arrow_down)
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(height: 30,width: 75,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black54)
                    ),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Desc",style: TextStyle(fontSize: 18),),
                        Icon(Icons.keyboard_arrow_down)
                      ],
                    ),
                  ), SizedBox(
                    width: 10,
                  ),
                  Container(height: 30,width: 75,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black54)
                    ),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("2023",style: TextStyle(fontSize: 18),),
                        Icon(Icons.keyboard_arrow_down)
                      ],
                    ),
                  ),

                ],
              ),
              SizedBox(
                height: 12,
              ),
              ElevatedButton(onPressed: (){}, child: Text("Add Expense"),style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,

              ),)
            ],
          ),
        ),
      ),
    );
  }
}
void bottomsheets(context){
  showModalBottomSheet(context: context,
      backgroundColor: Colors.transparent,
      builder: (context)=>Container(
    decoration: BoxDecoration(
      color: Colors.white30,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(21),
        topRight: Radius.circular(21),
      )
    ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            itemCount: 25,

              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
                (crossAxisCount: 4,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10),
              itemBuilder: (_,index){
            return Container(height: 70,width: 60,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(21)
              ),
            );
          }),
        ),
  ));
}
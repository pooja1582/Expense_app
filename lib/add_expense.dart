import 'package:expense_app/app_static.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'bloc/expense_bloc.dart';
import 'custom_wigdth.dart';
import 'models/expense_model.dart';
class AddExpense extends StatefulWidget {
   AddExpense({super.key, required double mBalance});

  get mBalance => null;

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
String selectedTransactionType = 'Credit';

DateTime selectedDate = DateTime.now();
var selectedCatIndex = -1;
var format = DateFormat.yMMMMd();
TextEditingController tcontroller = TextEditingController();
TextEditingController Desccontroller = TextEditingController();
TextEditingController amtcontroller = TextEditingController();

  get dateFromPicker => null;

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
              SizedBox(height: 20),
              Uihelper.CustomTextField(
                  tcontroller, "Name your Expense",),
              SizedBox(height: 10),
              Uihelper.CustomTextField(
                  Desccontroller, "Add Desc"),
              SizedBox(height: 10),
              Uihelper.CustomTextField(
                  amtcontroller, "Enter amount"),
              SizedBox(height: 10),
              ElevatedButton(
                  onPressed: (){
                    bottomsheets(context);
                  }, child:  selectedCatIndex == -1 ?Text("Choose Categary"):Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(AppStatic.categories[selectedCatIndex]["img"],width: 20,height: 20,),
                Text("- ${AppStatic.categories[selectedCatIndex]["name"]}")
              ],
              ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 50)
                ),
              ),
              SizedBox(
                height: 12,
              ),
              DropdownButton(
                value: selectedTransactionType,
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() {
                      selectedTransactionType = newValue;
                    });
                  }
                },
                items: ['Credit', 'Debit'].map<DropdownMenuItem<String>>((
                    String value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),SizedBox(
                height: 12,
              ),
          ElevatedButton(onPressed: ()async{
              var selectedDate =await showDatePicker(
                context: context,
                initialDate:DateTime.now(),
                firstDate: DateTime(2000,9,01),
                lastDate: DateTime.now());
              selectedDate = dateFromPicker!;
              setState(() {

              });
          },
            child: Text("Choose date"),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red,
              foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 50)
            )
            ),

              SizedBox(
                height: 12,
              ),

              ElevatedButton(onPressed: (){
                var title = tcontroller.text.toString();
                var desc = Desccontroller.text.toString();
                var amt = amtcontroller.text.toString();

                var balance = widget.mBalance;
                if(selectedTransactionType=="Credit"){
                  balance += double.parse(amt);
                } else {
                  balance -= double.parse(amt);
                }

                var newExpense = ExpenseModel(
                    catId: selectedCatIndex,
                    eType: selectedTransactionType=="Credit" ? 0 : 1,
                    amt: double.parse(amt),
                    balance: balance,
                    title: title,
                    desc: desc,
                    timeStamp: selectedDate.millisecondsSinceEpoch.toString());

                BlocProvider.of<ExpenseBloc>(context).add(AddExpenseEvent(newExpense: newExpense));

                Navigator.pop(context);


              }, child: Text("Add Expense"),style: ElevatedButton.styleFrom(
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
  var widget;
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
            itemCount: AppStatic.categories.length,

              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
                (crossAxisCount: 4,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10),
              itemBuilder: (_,index){
                var eachCat = AppStatic.categories[index];
                return InkWell(onTap: ()
                {
                  var selectedCatIndex = index;
                  setState(() {

                  }); Navigator.pop(context);},
                  child:
                Container(height: 70, width: 60,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      image: DecorationImage(
                          image: NetworkImage(eachCat["img"],),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(21)
                  ),

  )

            );
          }),
        ),
  ));
}

void setState(Null Function() param0) {
}

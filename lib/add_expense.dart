import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';


import 'app_static.dart';
import 'bloc/expense_bloc.dart';
import 'custom_wigdth.dart';
import 'models/expense_model.dart';

class AddExpense extends StatefulWidget {
  double mBalance;
  AddExpense({required this.mBalance});

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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        title: Text('Add Expense'),
        backgroundColor: Colors.red,
      ),
      // Set the background color
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              Uihelper.CustomTextField(
                  tcontroller, "Name your Expense", ),
              SizedBox(height: 10),
              Uihelper.CustomTextField(
                  Desccontroller, "Add Desc", ),
              SizedBox(height: 10),
              Uihelper.CustomTextField(
                  amtcontroller, "Enter amount", ),
              SizedBox(height: 10),
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
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return GridView.builder(
                        itemCount: AppStatic.categories.length,
                        padding: EdgeInsets.all(20),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          var eachCat = AppStatic.categories[index];
                          return InkWell(
                            onTap: () {
                              selectedCatIndex = index;
                              setState(() {

                              });
                              Navigator.pop(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.red.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(21),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(21),
                                child: Center(
                                  child: Image.network(eachCat["img"],fit: BoxFit.cover,),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
                child: selectedCatIndex == -1 ? Text("Choose Expense") : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      AppStatic.categories[selectedCatIndex]["img"], width: 20,
                      height: 20,),
                    Text(" - ${AppStatic.categories[selectedCatIndex]["name"]}")
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                ),
              ),
              ElevatedButton(onPressed: () async {
                var dateFromPicker = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000, 9, 01),
                    lastDate: DateTime.now());

                selectedDate = dateFromPicker!;
                setState(() {

                });
              }, child: Text(format.format(selectedDate))),
              ElevatedButton(onPressed: () {
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


              }, child: Text("ADD Expanse"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,

                ),),
              SizedBox(height: 20),

            ],
          ),
        ),
      ),
    );
  }
}
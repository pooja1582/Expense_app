import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../models/expense_model.dart';

import '../add_expense.dart';
import '../app_static.dart';
import '../bloc/expense_bloc.dart';
import '../models/day_wise_expense.dart';
import '../models/expense_model.dart';

class Allexpense extends StatefulWidget {
  const Allexpense({Key? key}) : super(key: key);

  @override
  State<Allexpense> createState() => _AllexpenseState();
}

class _AllexpenseState extends State<Allexpense> {
  List<DayWiseExpenseModel> dayWiseExpenses = [];
  double balance = 0.0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    BlocProvider.of<ExpenseBloc>(context).add(FetchAllExpenseEvent());
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text("Expense"),
        backgroundColor: Colors.red,
      ),
      body: BlocBuilder<ExpenseBloc, ExpenseState>(
        builder: (ctx, state) {
          if (state is ExpenseLoaded) {
            print('${state.allExpenses.length}');
            filterExpenseDateWise(state.allExpenses.reversed.toList());
            balance = state.allExpenses.last.balance.toDouble();
            return Column(
              children: [
                Expanded(child: Container(
                  child: Center(
                    child: Text('$balance', style: TextStyle(fontSize: 25),),
                  ),
                )),
                Expanded(
                  flex: 2,
                  child: ListView.builder(
                      itemCount: dayWiseExpenses.length,
                      itemBuilder: (_, parentIndex){
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(dayWiseExpenses[parentIndex].date.toString()),
                                  Text(dayWiseExpenses[parentIndex].amt.toString())
                                ],
                              ),
                              ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: dayWiseExpenses[parentIndex].transaction.length,
                                  itemBuilder: (_, childIndex){

                                    ExpenseModel eachTransaction = dayWiseExpenses[parentIndex].transaction[childIndex];

                                    /*var catItem = AppStatic.categories.where((element) => element['id']==eachTransaction.catId).toList();*/

                                    return ListTile(
                                      leading: Image.asset(AppStatic.categories[eachTransaction.catId]['img']),
                                      title: Text(eachTransaction.title),
                                      subtitle: Text(eachTransaction.desc),
                                      trailing: Column(
                                        children: [
                                          Text(eachTransaction.amt.toString(), style: TextStyle(color: eachTransaction.eType==1 ? Colors.red : Colors.green),),
                                          Text(eachTransaction.balance.toString())
                                        ],
                                      ),
                                    );
                                  })
                            ],
                          ),
                        );
                      }),
                ),
              ],
            );
          }
          return Container();
        },
      ),
      // Button to navigate to the AddExpense page
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddExpense(mBalance: balance)));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void filterExpenseDateWise(List<ExpenseModel> allExp){
    dayWiseExpenses.clear();

    List<String> arrUniqueDate = [];

    for(ExpenseModel eachExp in allExp){
      var dateTime = DateTime.fromMillisecondsSinceEpoch(int.parse(eachExp.timeStamp));
      var dateFormat = DateFormat.yMd();
      var formattedDate = dateFormat.format(dateTime);
      print(formattedDate);

      if(!arrUniqueDate.contains(formattedDate)){
        arrUniqueDate.add(formattedDate);
      }
    }

    print(arrUniqueDate);

    for(String eachDate in arrUniqueDate){

      List<ExpenseModel> eachDateExpense = [];
      double amt = 0;

      for(ExpenseModel eachExpense in allExp){
        var dateTime = DateTime.fromMillisecondsSinceEpoch(int.parse(eachExpense.timeStamp));
        var dateFormat = DateFormat.yMd();
        var formattedDate = dateFormat.format(dateTime);

        if(formattedDate==eachDate){
          eachDateExpense.add(eachExpense);
          if(eachExpense.eType==0){
            //debit
            amt -= eachExpense.amt;
          } else {
            //credit
            amt += eachExpense.amt;
          }
        }
      }


      /// for today
      var dateTime = DateTime.now();
      var dateFormat = DateFormat.yMd();
      var formattedDate = dateFormat.format(dateTime);

      if(formattedDate==eachDate){
        eachDate = "Today";
      }

      ///for yesterday

      dayWiseExpenses.add(DayWiseExpenseModel(date: eachDate, amt: amt.toString(), transaction: eachDateExpense));

    }



  }

}

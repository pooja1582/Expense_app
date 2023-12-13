import 'package:expense_app/add_expense.dart';
import 'package:expense_app/app_static.dart';
import 'package:expense_app/screens/edit_profile.dart';
import 'package:flutter/material.dart';

class AllExpensesPage extends StatelessWidget {
  const AllExpensesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = AppStatic.dummyExpense;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>EditProfile()));},
            child: Icon(Icons.account_circle_outlined,color: Colors.white,size: 30,)),
        backgroundColor: Colors.red,
      ),
      body:
      ListView.builder(
        itemCount: data.length,
        itemBuilder: (_, parentIndex) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(data[parentIndex]['date']?.toString() ?? ''),
                    Text(data[parentIndex]['atm']?.toString() ?? ''),
                  ],
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: (data[parentIndex]['transactions']
                  as List<Map<String, dynamic>>?)
                      ?.length ?? 0,
                  itemBuilder: (_, childIndex) {
                    Map<String, dynamic>? eachTransaction =
                    (data[parentIndex]['transactions']
                    as List<Map<String, dynamic>>?)?[childIndex];
                    return ListTile(
                      leading: CircleAvatar(backgroundImage:NetworkImage(eachTransaction?['catImg'??'']) ,
                      ),
                      title: Text(eachTransaction?['title'] ?? ''),
                      subtitle: Text(eachTransaction?['des'] ?? ''),
                      trailing: Column(
                        children: [
                          Text(eachTransaction?['amt'] ?? ''),
                          Text(eachTransaction?['balance'] ?? ''),
                        ],
                      ),
                    );
                  },
                ),

              ],
            ),
          );

        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>AddExpense()));},
        
      ),
    );
  }
}
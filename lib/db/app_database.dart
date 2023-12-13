// import 'package:expense_app/models/expense_model.dart';
// import 'package:flutter/material.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
//
//
// class AppDataBase{
//
//   AppDataBase._();
//
//   static final AppDataBase db = AppDataBase._();
//   static final String TABLE_NAME = "expense";
//   static final String COLUMN_ID = "eid";
//   static final String COLUMN_TITLE = "etitle";
//   // static final String COLUMN_DESC = "edesc";
//   static final String COLUMN_TYPE = "etype";
//   static final String COLUMN_EXPENSE_CAT_ID ="cId";
//   static final String COLUMN_AMT="amt";
//   static final String COLUMN_BALANCE="balance";
//   static final String COLUMN_TIMESTAMP="time";
//
//
//
//   static final String TABLE_CAT_NAME ="category";
//   static final String COLUMN_CAT_ID="cId";
//   static final String COLUMN_CAT_TITLE="ctitle";
//   static final String COLUMN_CAT_IMG_PATH="cpath";
//
//   Database? myDB;
//   Future<Database> getDB()async{
//     if (myDB !=null){
//       return myDB!;
//     }else{
//       myDB = await intDB();
//       return myDB!;
//
//     }
//   }
//   Future<DataBase> initDB()async{
//     var mDirectory = await getApplicationDocumentsDirectory();
//     var dbpath = join(mDirectory.path,"expensoDB");
//
//     return openDatabase(dbpath,version: 1,onCreate: (db, _){
//
//       db.execute(
//         "Create Table $TABLE_NAME ($COLUMN_ID integer primary key autoincrement,$COLUMN_TITLE text not null,$COLUMN_DESC text not null,$COLUMN_TYPE integer,$COLUMN_EXPENSE_CAT_ID integer,$COLUMN_AMT num,$COLUMN_BALANCE num,$COLUMN_TIMESTAMP text)"
//       );
//       db.execute("Create Table $TABLE_CAT_NAME ($COLUMN_CAT_ID integer primary key autoincrement,$COLUMN_CAT_TITLE text not null,$COLUMN_CAT_IMG_PATH text not null)");
//     });
//   }
//
//
// void addExpense(ExpenseModel newExpense)async{
//    var db = await getDB();
//
//  var rowsEffected = await db.insert(TABLE_NAME, newExpense.tomap());
//  return rowsEffected>0;
// }
// Future<List<ExpenseModel>> getAllExpense()async{
//     var db = await getDB();
//     var data= db.query(TABLE_NAME);
//     List<ExpenseModel>arrExpenses = [];
//     for(Map<String,dynamic> eachMap in data){
//       arrExpenses.add(ExpenseModel.fromeMap(eachMap));
//     }
//     return arrExpenses;
// }
//
//
// }
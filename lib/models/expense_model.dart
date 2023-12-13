// import 'package:expense_app/db/app_database.dart';
//
// class ExpenseModel{
//
//   int eId;
//   int catId;
//   int etype;
//   double amt;
//   double balance;
//   String title;
//   String desc;
//   String timeStamp;
//
//   ExpenseModel({this.eId = 0,
//     required this.catId,
//     required this.etype,
//     required this.amt,
//     required this.balance
//     ,required this.title,
//     required this.desc,
//     required this.timeStamp});
//
//   factory ExpenseModel.fromeMap(Map<String,dynamic>map){
//     return ExpenseModel(
//         eId: map[AppDataBase.COLUMN_ID],
//         catId: map[AppDataBase.COLUMN_EXPENSE_CAT_ID],
//         etype: map[AppDataBase.COLUMN_TYPE],
//         amt: map[AppDataBase.COLUMN_AMT],
//         balance: map[AppDataBase.COLUMN_BALANCE],
//         title: map[AppDataBase.COLUMN_TITLE],
//         desc: map[AppDataBase.COLUMN_DESC],
//         timeStamp: map[AppDataBase.COLUMN_TIMESTAMP],);
//
//   }
//   Map<String,dynamic>tomap(){
//     return{
//       AppDataBase.COLUMN_ID:eId,
//       AppDataBase.COLUMN_EXPENSE_CAT_ID:catId,
//       AppDataBase.COLUMN_TYPE:etype,
//       AppDataBase.COLUMN_AMT:amt,
//       AppDataBase.COLUMN_BALANCE:balance,
//       AppDataBase.COLUMN_TIMESTAMP:eId,
//       AppDataBase.COLUMN_TITLE:title,
//       AppDataBase.COLUMN_DESC:desc,
//     };
//   }
// }

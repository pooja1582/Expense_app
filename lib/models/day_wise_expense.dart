import 'expense_model.dart';

class DayWiseExpenseModel {
  String date;
  String amt;
  List<ExpenseModel> transaction;

  DayWiseExpenseModel({
    required this.date,
    required this.amt,
    required this.transaction,
  });

  // Convert ExpenseModel to Map
  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'amt': amt,
      'transaction': transaction.map((expenseDetails) => expenseDetails.toMap()).toList(),
    };
  }

  // Reconstruct ExpenseModel from Map
  factory DayWiseExpenseModel.fromMap(Map<String, dynamic> map) {
    return DayWiseExpenseModel(
      date: map['date'],
      amt: map['amt'],
      transaction: List<ExpenseModel>.from(map['transaction'].map((x) => ExpenseModel.fromMap(x))),
    );
  }
}

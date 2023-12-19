import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../db/app_database.dart';
import '../models/expense_model.dart';




part 'expense_event.dart';
part 'expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  AppDataBase db;
  ExpenseBloc({required this.db}) : super(ExpenseInitial()) {


    /// adding expense
    on<AddExpenseEvent>((event, emit) async{
      emit(ExpenseLoading());
      var check = await db.addExpense(event.newExpense);

      if(check){
        var allExp = await db.getAllExpenses();
        emit(ExpenseLoaded(allExpenses: allExp));
      } else {
        emit(ExpenseError(errorMsg: "Note not added!!"));
      }


    });


    ///fetching all expenses
    on<FetchAllExpenseEvent>((event, emit) async{
      emit(ExpenseLoading());
      var allExp = await db.getAllExpenses();
      emit(ExpenseLoaded(allExpenses: allExp));
    });
  }
}

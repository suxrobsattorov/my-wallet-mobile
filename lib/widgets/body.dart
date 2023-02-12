import 'package:flutter/material.dart';

import '../models/expense.dart';
import 'budget.dart';
import 'expense_list.dart';

class Body extends StatelessWidget {
  final List<Expense> expenses;
  final double totalExpenseByMonth;
  final Function deleteExpense;

  const Body(this.expenses, this.totalExpenseByMonth, this.deleteExpense,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Budget(totalExpenseByMonth),
        ExpenseList(expenses, deleteExpense),
      ],
    );
  }
}

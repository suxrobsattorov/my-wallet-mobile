import 'package:flutter/material.dart';

import '../models/expense.dart';
import 'budget.dart';
import 'expense_list.dart';

class Body extends StatelessWidget {
  final List<Expense> expenses;

  Body(this.expenses);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Budget(),
        ExpenseList(expenses),
      ],
    );
  }
}

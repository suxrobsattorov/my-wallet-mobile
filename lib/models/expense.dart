import 'package:flutter/material.dart';

class Expense {
  final String id;
  final String title;
  final DateTime date;
  final double amount;
  final IconData icon;

  Expense({
    required this.id,
    required this.title,
    required this.date,
    required this.amount,
    this.icon = Icons.account_balance_wallet,
  });
}

class Expenses {
  List<Expense> _expenses = [
    Expense(id: "1", title: "Tarvuz", date: DateTime.now(), amount: 15000),
    Expense(id: "2", title: "Krasofka", date: DateTime.now(), amount: 200000),
    Expense(id: "3", title: "Kurs", date: DateTime.now(), amount: 2000000),
    Expense(id: "4", title: "Pepsi", date: DateTime.now(), amount: 12000),
  ];

  List<Expense> get items {
    return _expenses;
  }

  List<Expense> itemByMonth(DateTime date) {
    return _expenses
        .where((expense) =>
            expense.date.month == date.month && expense.date.year == date.year)
        .toList();
  }

  double totalExpenseByMonth(DateTime date) {
    final expensesByMonth = itemByMonth(date);

    return expensesByMonth.fold(
        0, (previousValue, expense) => previousValue + expense.amount);
  }

  void addNewExpense(String title, double amount, DateTime date) {
    _expenses.add(
      Expense(
        id: "${_expenses.length + 1}",
        title: title,
        date: date,
        amount: amount,
      ),
    );
  }

  void delete(String id) {
    _expenses.removeWhere((expense) => expense.id == id);
  }
}

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
    this.icon = Icons.ac_unit,
  });
}

class Expenses {
  List<Expense> _expenses = [
    Expense(id: "1", title: "Tarvuz", date: DateTime.now(), amount: 15000),
    Expense(id: "2", title: "Krasofka", date: DateTime.now(), amount: 200000),
    Expense(id: "3", title: "Kurs", date: DateTime.now(), amount: 2000000),
    Expense(id: "4", title: "Pepsi", date: DateTime.now(), amount: 12000),
  ];

  List<Expense> get expenses {
    return _expenses;
  }
}

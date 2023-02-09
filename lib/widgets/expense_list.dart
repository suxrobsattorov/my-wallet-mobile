import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/expense.dart';

class ExpenseList extends StatelessWidget {
  final List<Expense> expenses;

  ExpenseList(this.expenses);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        clipBehavior: Clip.hardEdge,
        width: MediaQuery.of(context).size.width,
        height: 450,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60),
            topRight: Radius.circular(60),
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.only(
            top: 10,
            right: 5,
          ),
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.deepOrange,
              ),
              title: Text(
                expenses[index].title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                DateFormat("d MMMM, y").format(expenses[index].date),
                style: const TextStyle(
                  fontSize: 13,
                ),
              ),
              trailing: Text(
                "${expenses[index].amount} so'm",
              ),
            );
          },
          itemCount: expenses.length,
        ),
      ),
    );
  }
}

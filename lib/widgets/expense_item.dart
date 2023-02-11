import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseItem extends StatelessWidget {
  final String id;
  final String title;
  final DateTime date;
  final double amount;
  final IconData icon;
  final Key key;
  final Function deleteExpense;

  ExpenseItem(
    this.id,
    this.title,
    this.date,
    this.amount,
    this.icon,
    this.key,
    this.deleteExpense,
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: key,
      onDismissed: (direction) {
        deleteExpense(id);
      },
      direction: DismissDirection.endToStart,
      background: Container(
        padding: const EdgeInsets.only(right: 10),
        alignment: Alignment.centerRight,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.red,
              Colors.red,
              Colors.red,
              Colors.white,
            ],
          ),
        ),
        child: const Icon(
          Icons.delete,
          color: Colors.red,
        ),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color.fromRGBO(239, 240, 250, 1),
          child: Icon(icon, color: Color.fromRGBO(124, 125, 135, 1),size: 26,),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          DateFormat("d MMMM, y").format(date),
          style: const TextStyle(
            fontSize: 13,
          ),
        ),
        trailing: Text(
          "$amount so'm",
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_wallet/widgets/expense_item.dart';

import '../models/expense.dart';

class ExpenseList extends StatelessWidget {
  final List<Expense> expenses;
  final Function deleteExpense;

  ExpenseList(
    this.expenses,
    this.deleteExpense,
  );

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Positioned(
        bottom: 0,
        child: Container(
          clipBehavior: Clip.hardEdge,
          width: MediaQuery.of(context).size.width,
          height: constraints.maxHeight - 110,
          margin: const EdgeInsets.only(top: 110),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(60),
              topRight: Radius.circular(60),
            ),
          ),
          child: expenses.isNotEmpty
              ? ListView.builder(
                  padding: const EdgeInsets.only(
                    top: 10,
                    right: 5,
                  ),
                  itemBuilder: (context, index) {
                    return ExpenseItem(
                      expenses[index].id,
                      expenses[index].title,
                      expenses[index].date,
                      expenses[index].amount,
                      expenses[index].icon,
                      ValueKey(expenses[index].id),
                      deleteExpense,
                    );
                  },
                  itemCount: expenses.length,
                )
              : Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 50,
                    left: 50,
                    right: 50,
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Xarajatlar mavjud emas!",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Image.asset(
                        "assets/images/rocket.png",
                        fit: BoxFit.cover,
                      )
                    ],
                  ),
                ),
        ),
      );
    });
  }
}

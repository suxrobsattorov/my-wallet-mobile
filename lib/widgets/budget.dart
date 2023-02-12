import 'package:flutter/material.dart';
import 'package:my_wallet/widgets/progress_bar.dart';

import 'edit_monthly_budget.dart';

class Budget extends StatefulWidget {
  final double _totalExpenseByMonth;

  const Budget(this._totalExpenseByMonth, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BudgetState createState() => _BudgetState();
}

class _BudgetState extends State<Budget> {
  double _limit = 1000000;

  void _showMonthlyBudgetWindow(BuildContext context) {
    showModalBottomSheet(
        isDismissible: false,
        context: context,
        builder: (builder) {
          return EditMonthlyBudget(_changeBudgetLimit, _limit);
        });
  }

  void _changeBudgetLimit(double amount) {
    setState(() {
      _limit = amount;
    });
  }

  double _totalInterestByMonth(double limit) {
    double result = (widget._totalExpenseByMonth * 100) / limit;

    if (result > 100) return 100;
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          height: constraints.maxHeight,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(239, 240, 250, 1),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(60),
              topRight: Radius.circular(60),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text(
                        "Oylik byudjet: ",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          _showMonthlyBudgetWindow(context);
                        },
                        icon: const Icon(
                          Icons.edit,
                          size: 20,
                        ),
                        label: Text(
                          "${_limit.toStringAsFixed(0)} so'm",
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "${_totalInterestByMonth(_limit).toStringAsFixed(1)}%",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              ProgressBar(_totalInterestByMonth(_limit)),
            ],
          ),
        );
      },
    );
  }
}

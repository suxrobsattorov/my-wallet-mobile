import 'package:flutter/material.dart';
import 'package:my_wallet/widgets/adaptive_button.dart';

class EditMonthlyBudget extends StatefulWidget {
  final Function changeBudgetLimit;
  final double limit;

  EditMonthlyBudget(this.changeBudgetLimit, this.limit);

  @override
  _EditMonthlyBudgetState createState() => _EditMonthlyBudgetState();
}

class _EditMonthlyBudgetState extends State<EditMonthlyBudget> {
  late TextEditingController _budgetAmountController;

  @override
  void initState() {
    _budgetAmountController = TextEditingController();
    _budgetAmountController.text = widget.limit.toStringAsFixed(0);
    super.initState();
  }

  @override
  void dispose() {
    _budgetAmountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          TextField(
            decoration:
                const InputDecoration(labelText: "Oylik budjet miqdori!"),
            keyboardType: TextInputType.number,
            controller: _budgetAmountController,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AdaptiveButton(
                text: "BEKOR QILISH",
                handler: () {
                  Navigator.of(context).pop();
                },
              ),
              AdaptiveButton(
                filled: true,
                text: "O'ZGARTIRISH",
                handler: () {
                  if (_budgetAmountController.text.isEmpty) return;
                  final amount = double.parse(_budgetAmountController.text);
                  if (amount > 0) {
                    widget.changeBudgetLimit(amount);
                    Navigator.of(context).pop();
                  }
                  return;
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

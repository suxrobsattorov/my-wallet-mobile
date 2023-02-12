import 'package:flutter/material.dart';

// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:my_wallet/widgets/adaptive_button.dart';
import 'package:my_wallet/widgets/adaptive_textfield.dart';

class AddExpense extends StatefulWidget {
  final Function addNewExpense;

  const AddExpense(this.addNewExpense, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddExpenseState createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  DateTime? _selectedDate;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void _showNewExpenseCalendar(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then(
      (date) => {
        if (date != null)
          {
            setState(() {
              _selectedDate = date;
            }),
          }
      },
    );
  }

  void _submit() {
    if (titleController == null ||
        amountController == null ||
        _selectedDate == null) {
      return;
    }
    var title = titleController.text;
    var amount = double.parse(amountController.text);
    if (amount <= 0) {
      return;
    }
    widget.addNewExpense(title, amount, _selectedDate);
    Navigator.of(context).pop();
  }

  // void showExpenseIconPicker(BuildContext context) {
  //   FlutterIconPicker.showIconPicker(context);
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
            top: 15,
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom > 0
                ? MediaQuery.of(context).viewInsets.bottom
                : 100),
        child: Column(
          children: [
            AdaptiveTextField(
              label: "Xarajat nomi",
              controller: titleController,
            ),
            AdaptiveTextField(
              keyboardType: TextInputType.number,
              label: "Xarajat miqdori",
              controller: amountController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _selectedDate != null
                      ? "Xarajat kuni: ${DateFormat("MMMM d, y").format(_selectedDate!)}"
                      : "Xarajat kuni tanlanmadi!",
                ),
                TextButton(
                  onPressed: () {
                    _showNewExpenseCalendar(context);
                  },
                  child: const Text(
                    "KUNNI TANLANG",
                  ),
                ),
              ],
            ),
            /*Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Icon tanlanmadi!",
                ),
                TextButton(
                  onPressed: () {
                  },
                  child: const Text(
                    "ICON TANLANG",
                  ),
                ),
              ],
            ),*/
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
                  text: "KIRITISH",
                  handler: _submit,
                  filled: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

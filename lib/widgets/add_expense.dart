import 'package:flutter/material.dart';

// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class AddExpense extends StatefulWidget {
  final Function addNewExpense;

  AddExpense(this.addNewExpense);

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

  // void showExpenseIconPicker(BuildContext context) {
  //   FlutterIconPicker.showIconPicker(context);
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              labelText: "Xarajat nomi",
            ),
            controller: titleController,
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: "Xarajat miqdori",
            ),
            controller: amountController,
            keyboardType: TextInputType.number,
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
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("BEKOR QILISH"),
              ),
              ElevatedButton(
                onPressed: () {
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
                },
                child: const Text("KIRITISH"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

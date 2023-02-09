import 'package:flutter/material.dart';
import 'package:flutter_month_picker/flutter_month_picker.dart';
import 'package:intl/intl.dart';

class AddExpense extends StatefulWidget {
  @override
  _AddExpenseState createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  DateTime? _selectedDate;

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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: "Xarajat nomi",
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "Xarajat miqdori",
            ),
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
                child: Text(
                  "KUNNI TANLANG",
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Icon tanlanmadi!",
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "ICON TANLANG",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

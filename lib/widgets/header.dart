import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Header extends StatelessWidget {
  final double totalByMonth;
  final DateTime selectedDate;
  final Function showCalendar;
  final Function() beforeDate;
  final Function() afterDate;

  Header(
    this.selectedDate,
    this.showCalendar,
    this.beforeDate,
    this.afterDate,
    this.totalByMonth,
  );

  @override
  Widget build(BuildContext context) {
    final isFirstDate = selectedDate.year == 2022 && selectedDate.month == 1;
    final isLastDate = selectedDate.year == DateTime.now().year &&
        selectedDate.month == DateTime.now().month;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextButton(
            onPressed: () {
              showCalendar(context);
            },
            child: Text(
              DateFormat("MMMM,  y").format(selectedDate),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: isFirstDate ? Colors.grey : Colors.deepOrange,
                  ),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: beforeDate,
                  icon: Icon(
                    Icons.arrow_left,
                    size: 40,
                    color: isFirstDate ? Colors.grey : Colors.deepOrange,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    totalByMonth.toStringAsFixed(0),
                    style: const TextStyle(
                      fontSize: 44,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "so'm",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      height: 0.7,
                    ),
                  ),
                ],
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: isLastDate ? Colors.grey : Colors.deepOrange,
                  ),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: afterDate,
                  icon: Icon(
                    Icons.arrow_right,
                    size: 40,
                    color: isLastDate ? Colors.grey : Colors.deepOrange,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

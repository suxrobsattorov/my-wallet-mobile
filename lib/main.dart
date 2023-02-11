import 'package:flutter/material.dart';
import 'package:flutter_month_picker/flutter_month_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_wallet/models/expense.dart';
import 'package:my_wallet/widgets/add_expense.dart';
import 'package:my_wallet/widgets/body.dart';
import 'package:my_wallet/widgets/header.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      home: MyWallet(),
    );
  }
}

class MyWallet extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _MyWalletState createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
  final Expenses _expenses = Expenses();
  DateTime _selectedDate = DateTime.now();

  void _showCalendar(BuildContext context) {
    showMonthPicker(
      context: context,
      initialDate: DateTime.now(),
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

  void _beforeDate() {
    if (_selectedDate.year == 2022 && _selectedDate.month == 1) return;
    setState(() {
      _selectedDate = DateTime(_selectedDate.year, _selectedDate.month - 1);
    });
  }

  void _afterDate() {
    if (_selectedDate.year == DateTime.now().year &&
        _selectedDate.month == DateTime.now().month) return;
    setState(() {
      _selectedDate = DateTime(_selectedDate.year, _selectedDate.month + 1);
    });
  }

  void _showAddExpenseWindow(BuildContext context) {
    showModalBottomSheet(
      isDismissible: false,
      context: context,
      builder: (builder) {
        return AddExpense(_addNewExpense);
      },
    );
  }

  void _addNewExpense(String title, double amount, DateTime date) {
    setState(() {
      _expenses.addNewExpense(title, amount, date);
    });
  }

  void deleteExpense(String id) {
    setState(() {
      _expenses.delete(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Wallet",
        ),
      ),
      body: Column(
        children: [
          Header(
            _selectedDate,
            _showCalendar,
            _beforeDate,
            _afterDate,
            _expenses.totalExpenseByMonth(_selectedDate),
          ),
          Body(
            _expenses.itemByMonth(_selectedDate),
            _expenses.totalExpenseByMonth(_selectedDate),
            deleteExpense,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddExpenseWindow(context);
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_month_picker/flutter_month_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_wallet/models/expense.dart';
import 'package:my_wallet/widgets/add_expense.dart';
import 'package:my_wallet/widgets/body.dart';
import 'package:my_wallet/widgets/header.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      home: const MyWallet(),
    );
  }
}

class MyWallet extends StatefulWidget {
  const MyWallet({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyWalletState createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
  final Expenses _expenses = Expenses();
  DateTime _selectedDate = DateTime.now();
  bool _showExpenseList = false;

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
      isScrollControlled: true,
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

  void _deleteExpense(String id) {
    setState(() {
      _expenses.delete(id);
    });
  }

  Widget _showPortraitItems(deviceHeight, deviceWidth) {
    return Column(
      children: [
        SizedBox(
          width: deviceWidth,
          height: deviceHeight > 640 ? deviceHeight * 0.25 : deviceHeight * 0.3,
          child: Header(
            _selectedDate,
            _showCalendar,
            _beforeDate,
            _afterDate,
            _expenses.totalExpenseByMonth(_selectedDate),
          ),
        ),
        SizedBox(
          width: deviceWidth,
          height: deviceHeight > 640 ? deviceHeight * 0.75 : deviceHeight * 0.7,
          child: Body(
            _expenses.itemByMonth(_selectedDate),
            _expenses.totalExpenseByMonth(_selectedDate),
            _deleteExpense,
          ),
        ),
      ],
    );
  }

  Widget _showLandscapeItems(deviceHeight, deviceWidth) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Ro'yhatni ko'rsatish",
            ),
            Switch.adaptive(
              value: _showExpenseList,
              onChanged: (value) {
                setState(() {
                  _showExpenseList = value;
                });
              },
            ),
          ],
        ),
        _showExpenseList
            ? SizedBox(
                width: deviceWidth,
                height: deviceHeight * 0.85,
                child: Body(
                  _expenses.itemByMonth(_selectedDate),
                  _expenses.totalExpenseByMonth(_selectedDate),
                  _deleteExpense,
                ),
              )
            : SizedBox(
                width: deviceWidth,
                height: deviceHeight * 0.85,
                child: Header(
                  _selectedDate,
                  _showCalendar,
                  _beforeDate,
                  _afterDate,
                  _expenses.totalExpenseByMonth(_selectedDate),
                ),
              ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final appBar = AppBar(
      title: const Text(
        "My Wallet",
      ),
      actions: Platform.isIOS
          ? [
              IconButton(
                onPressed: () {
                  _showAddExpenseWindow(context);
                },
                icon: const Icon(
                  Icons.add,
                ),
              ),
            ]
          : [],
    );
    final topPadding = MediaQuery.of(context).padding.top;
    final deviceHeight = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        topPadding;
    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            isLandscape
                ? _showLandscapeItems(deviceHeight, deviceWidth)
                : _showPortraitItems(deviceHeight, deviceWidth),
          ],
        ),
      ),
      floatingActionButton: Platform.isAndroid
          ? FloatingActionButton(
              onPressed: () {
                _showAddExpenseWindow(context);
              },
              child: const Icon(
                Icons.add,
              ),
            )
          : Container(),
    );
  }
}

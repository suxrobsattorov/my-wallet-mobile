import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: double.infinity,
      height: 6,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(212, 219, 239, 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: FractionallySizedBox(
        heightFactor: 2,
        widthFactor: 0.5,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepOrange,
                Colors.deepOrange,
                Colors.deepOrange.shade100,
                Colors.deepOrange,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.deepOrange,
                blurRadius: 15,
                spreadRadius: -2,
              ),
            ],
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_wallet/widgets/progress_bar.dart';

class Budget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      height: 572.429,
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
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit,
                      size: 20,
                    ),
                    label: Text(
                      "1,000,000 so'm",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                "4.9%",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          ProgressBar(),
        ],
      ),
    );
  }
}

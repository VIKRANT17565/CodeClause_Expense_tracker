import 'package:flutter/material.dart';

class ExpensesCard extends StatelessWidget {
  final int netExpense;
  const ExpensesCard({super.key, required this.netExpense});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.red,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Expenses",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '₹ ${netExpense.toString()}',
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

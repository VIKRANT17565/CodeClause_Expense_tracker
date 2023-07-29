import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/screens/history_screen.dart';
import 'package:expense_tracker/widget/transaction_card.dart';
import 'package:flutter/material.dart';

class RecentTransaction extends StatelessWidget {
  final AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot;
  const RecentTransaction({
    super.key,
    required this.snapshot,
  });

  @override
  Widget build(BuildContext context) {
    List data = snapshot.data!.docs;

    return Expanded(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recent Transaction',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const HistoryScreen(),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromRGBO(238, 229, 255, 1),
                    ),
                    child: const Text(
                      "See All",
                      style: TextStyle(
                        color: Color.fromRGBO(106, 0, 255, 1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 7, bottom: 60),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  String category = 'Category';
                  String description = data[index]['description'];
                  String amount = data[index]['amount'].toString();
                  String dateTime = data[index]['date'];
                  String transactionCategory = data[index]['type'];
                  int transactionType = -1;
                  if (data[index]['type'] == 'income') {
                    category = data[index]['title'];
                    transactionType = 1;
                  } else if (data[index]['type'] == 'expense') {
                    category = data[index]['category'];
                    transactionType = 0;
                  }

                  return TransactionCard(
                    category: category.toUpperCase(),
                    description: description,
                    amount: amount,
                    dateTime: dateTime,
                    transactionCategory: transactionCategory,
                    transactionType: transactionType,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

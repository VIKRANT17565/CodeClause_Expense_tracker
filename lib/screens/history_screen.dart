import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/widget/transaction_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: MediaQuery.of(context).padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 27,
                  ),
                ),
                const Text(
                  'History',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection(
                      FirebaseAuth.instance.currentUser?.uid ?? '',
                    )
                    .orderBy('date', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    if (snapshot.hasData) {
                      List data = snapshot.data!.docs;
                      return ListView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 7),
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
                      );
                    } else {
                      return const Center(
                        child: Text('Something went wrong!'),
                      );
                    }
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
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

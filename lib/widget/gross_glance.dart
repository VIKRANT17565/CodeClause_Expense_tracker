import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/resources/firebase_auth.dart';
import 'package:expense_tracker/screens/login_screen.dart';
import 'package:expense_tracker/utils/global.dart';
import 'package:expense_tracker/widget/expenses_card.dart';
import 'package:expense_tracker/widget/income_card.dart';
import 'package:flutter/material.dart';

class GrossGlance extends StatelessWidget {
  final AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot;
  const GrossGlance({
    super.key,
    required this.snapshot,
  });

  @override
  Widget build(BuildContext context) {
    num netAmount = 0;
    num netIncome = 0;
    num netExpense = 0;
    List data = snapshot.data!.docs;
    for (int i = 0; i < snapshot.data!.docs.length; i++) {
      if (data[i]['type'] == 'income') {
        netAmount += data[i]['amount'];
        netIncome += data[i]['amount'];
      } else if (data[i]['type'] == 'expense') {
        netAmount -= data[i]['amount'];
        netExpense += data[i]['amount'];
      }
    }

    return Container(
      padding: MediaQuery.of(context).padding,
      height: MediaQuery.of(context).size.height * 0.35,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(253, 247, 235, 1),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(37),
          bottomRight: Radius.circular(37),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    // bottom sheet with logout option
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 70,
                          child: Column(
                            children: [
                              ListTile(
                                leading: const Icon(Icons.logout),
                                title: const Text('Logout'),
                                onTap: () {
                                  print('logout');
                                  AuthMethods().signOut();
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => const LoginScreen(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      auth.currentUser?.photoURL ?? '',
                    ),
                    minRadius: 20,
                  ),
                ),
                // IconButton(
                //   onPressed: () {
                //     AuthMethods().signOut();
                //   },
                //   icon: const Icon(
                //     Icons.notifications,
                //     size: 30,
                //     color: Colors.purpleAccent,
                //   ),
                // )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Account Balance",
            style: TextStyle(color: Color.fromARGB(255, 126, 126, 126)),
          ),
          const SizedBox(
            height: 7,
          ),
          Text(
            '₹ ${netAmount.toInt().toString()}',
            style: const TextStyle(
              fontSize: 37,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IncomeCard(
                netIncome: netIncome.toInt(),
              ),
              ExpensesCard(
                netExpense: netExpense.toInt(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

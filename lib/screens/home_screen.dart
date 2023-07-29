import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/resources/firebase_auth.dart';
import 'package:expense_tracker/widget/custom_action_menu.dart';
import 'package:expense_tracker/widget/gross_glance.dart';
import 'package:expense_tracker/widget/recent_transaction.dart';
import 'package:expense_tracker/widget/spend_frequency_graph.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showActionMenu = false;
  void signOut(BuildContext context) async {
    await AuthMethods().signOut();
    if (context.mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection(
                FirebaseAuth.instance.currentUser?.uid ?? '',
              )
              .orderBy('date', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GrossGlance(
                              snapshot: snapshot,
                            ),
                            // const TestUI(),
                            SpendFrequencyGraph(
                              snapshot: snapshot,
                            ),
                            RecentTransaction(
                              snapshot: snapshot,
                            ),
                          ],
                        ),
                        _showActionMenu
                            ? const CustomActionMenu()
                            : Container(),
                        const CustomActionMenu(),
                      ],
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: Text('Something went wrong, please try again later'),
                );
              }
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SpendFrequencyGraph extends StatelessWidget {
  final AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot;
  const SpendFrequencyGraph({
    super.key,
    required this.snapshot,
  });

  @override
  Widget build(BuildContext context) {
    List data = snapshot.data!.docs.reversed.toList();
    List<ExpenseModel> expenseList = [];

    Map<String, double> expenseMap = {};
    for (int i = 0; i < snapshot.data!.docs.length; i++) {
      if (data[i]['type'] == 'expense') {
        if (expenseMap.containsKey(data[i]['date'].substring(0, 10))) {
          expenseMap[data[i]['date'].substring(0, 10)] =
              expenseMap[data[i]['date'].substring(0, 10)]! + data[i]['amount'];
        } else {
          expenseMap[data[i]['date'].substring(0, 10)] = data[i]['amount'];
        }
      }
    }

    expenseMap.forEach((key, value) {
      ExpenseModel expense = ExpenseModel(value, key);
      expenseList.add(expense);
    });

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(8.0),
            child: const Text(
              'Spend Frequency',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: SfCartesianChart(
              // Initialize category axis
              primaryXAxis: CategoryAxis(),
              series: <SplineSeries<ExpenseModel, dynamic>>[
                SplineSeries<ExpenseModel, dynamic>(
                  // Bind data source
                  dataSource: expenseList,
                  xValueMapper: (ExpenseModel sales, _) =>
                      sales.date.substring(0, 10),
                  yValueMapper: (ExpenseModel sales, _) => sales.expense,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:expense_tracker/widget/income_details_input.dart';
import 'package:expense_tracker/widget/expense_details_input.dart';
import 'package:flutter/material.dart';

class AddTransactionScreen extends StatefulWidget {
  final Color color;

  const AddTransactionScreen({
    super.key,
    required this.color,
  });

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  String amount = "0";

  String getAmount() {
    return amount;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                color: widget.color, //Colors.red,
              ),
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Container(
                      padding: MediaQuery.of(context).padding,
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_back_rounded,
                              size: 30,
                            ),
                            onPressed: Navigator.of(context).pop,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "How much?",
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Color.fromRGBO(255, 255, 255, 0.6),
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "₹ ",
                                      style: TextStyle(
                                        fontSize: 70,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      child: TextField(
                                        // controller: _amountController,
                                        onChanged: (value) {
                                          amount = value;
                                        },
                                        style: const TextStyle(
                                          fontSize: 70,
                                          color: Colors.white,
                                        ),
                                        keyboardType: TextInputType.number,
                                        decoration: const InputDecoration(
                                          hintText: "0",
                                          hintStyle: TextStyle(
                                            fontSize: 70,
                                            color: Colors.white,
                                          ),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: widget.color == Colors.red
                          ? ExpenseDetailsInput(getAmount: getAmount)
                          : IncomeDetailsInput(getAmount: getAmount),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

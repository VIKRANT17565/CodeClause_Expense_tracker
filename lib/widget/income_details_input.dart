import 'package:expense_tracker/resources/firestore_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class IncomeDetailsInput extends StatefulWidget {
  final Function getAmount;
  const IncomeDetailsInput({
    super.key,
    required this.getAmount,
  });

  @override
  State<IncomeDetailsInput> createState() => _IncomeDetailsInputState();
}

class _IncomeDetailsInputState extends State<IncomeDetailsInput> {
  TextEditingController descriptionController = TextEditingController();
  TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.85,
          child: TextField(
            maxLines: 1,
            controller: titleController,
            decoration: const InputDecoration(
              hintText: "Title",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(17),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.85,
          child: TextField(
            maxLines: 5,
            controller: descriptionController,
            decoration: const InputDecoration(
              hintText: "Description",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(17),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.85,
          child: ElevatedButton(
            onPressed: () {
              String amount = widget.getAmount();

              FirestoreMethods().addTransaction(
                uid: FirebaseAuth.instance.currentUser?.uid ?? '',
                type: "income",
                title: titleController.text,
                description: descriptionController.text,
                amount: double.parse(amount),
                date: DateTime.now(),
              );
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(127, 61, 255, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(17),
              ),
              padding: const EdgeInsets.symmetric(vertical: 15),
            ),
            child: const Text(
              "Continue",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

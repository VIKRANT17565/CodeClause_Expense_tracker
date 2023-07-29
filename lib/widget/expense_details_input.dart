import 'package:expense_tracker/resources/firestore_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ExpenseDetailsInput extends StatefulWidget {
  final Function getAmount;
  const ExpenseDetailsInput({
    super.key,
    required this.getAmount,
  });

  @override
  State<ExpenseDetailsInput> createState() => _ExpenseDetailsInputState();
}

class _ExpenseDetailsInputState extends State<ExpenseDetailsInput> {
  TextEditingController descriptionController = TextEditingController();
  String category = "Not selected";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.85,
          child: DropdownButtonFormField(
            items: const [
              DropdownMenuItem(
                value: "shopping",
                child: Text("Shopping"),
              ),
              DropdownMenuItem(
                value: "food",
                child: Text("Food"),
              ),
              DropdownMenuItem(
                value: "travel",
                child: Text("Travel"),
              ),
              DropdownMenuItem(
                value: "bills",
                child: Text("Bills"),
              ),
              DropdownMenuItem(
                value: "others",
                child: Text("Others"),
              ),
            ],
            // value: "Category",
            hint: const Text("Category"),
            onTap: () {
              print("tapped");
            },
            onChanged: (value) {
              print(value);
              category = value.toString();
            },
            decoration: const InputDecoration(
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
            controller: descriptionController,
            maxLines: 5,
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
              print(descriptionController.text);
              print(category);
              print(amount);

              FirestoreMethods().addTransaction(
                uid : FirebaseAuth.instance.currentUser?.uid ?? '',
                type: "expense",
                description: descriptionController.text,
                category: category,
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

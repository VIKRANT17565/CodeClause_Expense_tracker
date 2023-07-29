import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  final String category;
  final String description;
  final String amount;
  final String dateTime;
  final String transactionCategory;
  final int transactionType;
  const TransactionCard({
    super.key,
    required this.category,
    required this.description,
    required this.amount,
    required this.dateTime,
    required this.transactionCategory,
    required this.transactionType,
  });

  @override
  Widget build(BuildContext context) {
    Map<String, Widget> categoryList = {
      'shopping': const Icon(
        Icons.shopping_bag_outlined,
        color: Color.fromRGBO(106, 0, 255, 1),
      ),
      'food': const Icon(
        Icons.food_bank_outlined,
        color: Color.fromRGBO(106, 0, 255, 1),
      ),
      'travel': const Icon(
        Icons.airplanemode_active_outlined,
        color: Color.fromRGBO(106, 0, 255, 1),
      ),
      'bills': const Icon(
        Icons.receipt_long_outlined,
        color: Color.fromRGBO(106, 0, 255, 1),
      ),
      'income': const Icon(
        Icons.attach_money_outlined,
        color: Color.fromRGBO(106, 0, 255, 1),
      ),
      'others': const Icon(
        Icons.more_horiz_outlined,
        color: Color.fromRGBO(106, 0, 255, 1),
      ),
    };

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromRGBO(238, 229, 255, 1),
            ),
            child: categoryList[category.toLowerCase()] ??
                Image.asset(
                  'assets/icons/transactionIcon.png',
                  scale: 2.5,
                  color: const Color.fromRGBO(106, 0, 255, 1),
                ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        category,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        transactionType == 1 ? '+ ₹$amount' : '- ₹$amount',
                        style: TextStyle(
                          color:
                              transactionType == 1 ? Colors.green : Colors.red,
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        description,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        '${dateTime.substring(11, 16)} ${dateTime.substring(0, 10)}',
                        style: const TextStyle(
                          color: Colors.grey,
                          
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:expense_tracker/screens/add_transaction_scree.dart';
import 'package:expense_tracker/utils/global.dart';
import 'package:flutter/material.dart';

class CustomActionMenu extends StatefulWidget {
  const CustomActionMenu({super.key});

  @override
  State<CustomActionMenu> createState() => _CustomActionMenuState();
}

class _CustomActionMenuState extends State<CustomActionMenu> {
  bool _showActionMenu = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 17,
          right: 17,
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.grey[300],
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5,
                  offset: Offset(2, 3),
                )
              ],
            ),
            child: IconButton(
              onPressed: () {
                debugPrint('taped on button');
                setState(() {
                  _showActionMenu = !_showActionMenu;
                });
              },
              icon: _showActionMenu
                  ? const Icon(
                      Icons.close,
                      size: 30,
                    )
                  : const Icon(
                      Icons.add,
                      size: 30,
                    ),
            ),
          ),
        ),
        _showActionMenu
            ? Positioned(
                bottom: 17 + 60 + 17,
                right: 17,
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.green,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5,
                        offset: Offset(2, 3),
                      )
                    ],
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(60),
                    onTap: () {
                      showActionMenu = false;
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const AddTransactionScreen(
                            color: Colors.green,
                          ),
                        ),
                      );
                    },
                    child: Image.asset(
                      'assets/icons/incomeIcon.png',
                      scale: 2,
                    ),
                  ),
                ),
              )
            : Container(),
        _showActionMenu
            ? Positioned(
                bottom: 17 + 60 + 17 + 60 + 17,
                right: 17,
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.red,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5,
                        offset: Offset(2, 3),
                      )
                    ],
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(60),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const AddTransactionScreen(
                            color: Colors.red,
                          ),
                        ),
                      );
                    },
                    child: Image.asset(
                      'assets/icons/expenseIcon.png',
                      scale: 2,
                    ),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}

import 'package:expense_tracker/resources/firebase_auth.dart';
import 'package:expense_tracker/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({super.key});

  void signIn(BuildContext context) async {
    UserCredential userCredential = await AuthMethods().signInWithGoogle();
    debugPrint(userCredential.user.toString());

    // await Future.delayed(const Duration(milliseconds: 5000));
    if (context.mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return  HomeScreen();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          debugPrint('Google Sign In Button Pressed');
          signIn(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 7,
        ),
        child: Row(
          children: [
            SvgPicture.asset('assets/icons/googleIcon.svg', height: 30),
            const Expanded(
              child: Center(
                child: Text(
                  'Sign in with Google',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

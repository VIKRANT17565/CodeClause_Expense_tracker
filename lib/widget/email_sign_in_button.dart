import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmailSignInButton extends StatelessWidget {
  const EmailSignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          debugPrint('Phone Sign In Button Pressed');
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
            SvgPicture.asset('assets/icons/emailIcon.svg', height: 30),
            const Expanded(
              child: Center(
                child: Text(
                  'Sign in with Email',
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

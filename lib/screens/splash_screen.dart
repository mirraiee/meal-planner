import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart'; // Required for TapGestureRecognizer
import 'sign_in.dart';
import 'sign_up.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Dark background color
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          // App Icon
          Center(
              child: Image.asset(
                'assets/images/icon.png',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
          ),
          SizedBox(height: 20),
          // App Name
          Center(
            child: Row( // Use Row for horizontal arrangement
              mainAxisAlignment: MainAxisAlignment.center, // Center the texts in the row
              children: [
                Text(
                  'Meal',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0B1115),
                  ),
                ),
                Text(
                  'Diary',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          // Get Started Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () {
                // Handle Get Started button press
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF65A967), // Button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(vertical: 15),
                minimumSize: Size(double.infinity, 50), // Full-width button
              ),
              child: Text(
                'Get Started',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 25),
          // Sign In Link (using RichText)
          Center(
            child: RichText(
              text: TextSpan(
                text: 'Already have an account? ',
                style: TextStyle(color: Colors.black54),
                children: [
                  TextSpan(
                    text: 'Sign In',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Navigate to the SignIn page
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 60),
        ],
      ),
    );
  }
}

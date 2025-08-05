// ignore_for_file: use_build_context_synchronously

import 'package:blinkist/components/commonBtn.dart';
import 'package:blinkist/components/commonTextField.dart';
import 'package:blinkist/constants/dimensions.dart';
import 'package:blinkist/repositories/Screens/HomeScreens/Subscription.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  bool _validateForm() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all required fields")),
      );
      return false;
    }
    return true;
  }

  Future<void> _signInUser() async {
    try {
      final response = await Supabase.instance.client.auth.signInWithPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      if (response.user != null) {
        if (kDebugMode) {
          print("User Logged in ${response.user!.email}");
        }
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Subscription()),
        );
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Invalid email or password")));
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: ${e.toString()}")));
    } finally {
      setState(() {
        emailController.clear();
        passwordController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = AppDimensions.screenWidth(context);
    double height = AppDimensions.screenHeight(context);
    return Scaffold(
      backgroundColor: Color(0xffEDEDED),
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.1),
            Text(
              'Welcome Back!',
              style: TextStyle(
                fontSize: width * 0.08,
                fontFamily: 'Bold',
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            CommonTextField(
              controller: emailController,
              hint: 'Email',
              icon: Icons.email,
            ),
            SizedBox(height: 20),
            CommonTextField(
              controller: passwordController,
              hint: 'Password',
              icon: Icons.password,
            ),
            SizedBox(height: 40),
            commonBtn(
              label: 'Login With Email',
              onPressed: () {
                if (_validateForm()) {
                  _signInUser();
                }
              },
            ),
            SizedBox(height: 40),
            Center(
              child: InkWell(
                onTap: () {
                  print("Button tapped");
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Text(
                  'Forgot Your Password?',
                  style: TextStyle(fontSize: 16, color: Color(0xff2BDE80)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

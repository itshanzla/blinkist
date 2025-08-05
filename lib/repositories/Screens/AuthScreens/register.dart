// ignore_for_file: use_build_context_synchronously

import 'package:blinkist/components/commonTextField.dart';
import 'package:blinkist/repositories/Screens/AuthScreens/login.dart';
import 'package:blinkist/repositories/Screens/HomeScreens/Subscription.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart'; // Replace with your actual screen

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final cityController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    cityController.dispose();
    super.dispose();
  }

  bool _validateForm() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all required fields")),
      );
      return false;
    }
    return true;
  }

  Future<void> _signUpUser() async {
    try {
      final response = await Supabase.instance.client.auth.signUp(
        email: emailController.text.trim(),
        password: passwordController.text,
        data: {
          'name': nameController.text,
          'phone': phoneController.text,
          'city': cityController.text,
        },
      );

      if (response.user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const Subscription()),
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print("Signup error: $e");
      }
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Signup failed: $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEDEDED),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const Text(
                "Create an account",
                style: TextStyle(
                  color: Color(0xff1A1D1F),
                  fontFamily: 'Bold',
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 30),
              CommonTextField(
                controller: nameController,
                hint: "User Name",
                icon: Icons.person,
              ),
              CommonTextField(
                controller: emailController,
                hint: "Email",
                icon: Icons.email,
              ),
              CommonTextField(
                controller: passwordController,
                hint: "Password",
                icon: Icons.lock,
                obscure: true,
              ),
              CommonTextField(
                controller: phoneController,
                hint: "Phone",
                icon: Icons.phone,
              ),
              CommonTextField(
                controller: cityController,
                hint: "City",
                icon: Icons.location_city,
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_validateForm()) {
                      _signUpUser();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Register",
                    style: TextStyle(
                      fontFamily: 'Medium',
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Already have an account? Login",
                    style: TextStyle(
                      color: Colors.green,
                      fontFamily: 'Medium',
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

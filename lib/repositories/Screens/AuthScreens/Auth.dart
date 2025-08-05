// ignore_for_file: unused_local_variable, unrelated_type_equality_checks, use_build_context_synchronously

import 'package:blinkist/components/commonBtn.dart';
import 'package:blinkist/repositories/Screens/AuthScreens/login.dart';
import 'package:blinkist/repositories/Screens/AuthScreens/register.dart';
import 'package:blinkist/repositories/Screens/HomeScreens/Subscription.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  void initState() {
    _setupAuthListener();
    super.initState();
  }

  final SupabaseClient supabase = Supabase.instance.client;

  static String webClientId =
      '788882933292-kqg1rtm9m0c81l8i596o1nugfn6ebdap.apps.googleusercontent.com';

  void _setupAuthListener() {
    supabase.auth.onAuthStateChange.listen((data) {
      final event = data.event;
      if (event == AuthChangeEvent.signedIn) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Subscription()),
        );
      }
    });
  }

  // Google Log-in
  Future<AuthResponse> _googleSignIn() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: ['email', 'profile'],
      serverClientId: webClientId,
    );
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null) {
      throw 'No Access Token found.';
    }
    if (idToken == null) {
      throw 'No ID Token found.';
    }
    if (googleUser == Null) {
      if (kDebugMode) {
        print("User cancelled the sign-in");
      }
      return Future.error("Cancelled by user");
    }
    if (kDebugMode) {
      print(
        "The User from Google is =>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>${googleUser.email}",
      );
    }

    return supabase.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
  }

  void _handleGoogleLogin() async {
    if (kDebugMode) {
      print("Function Triggered");
    }
    try {
      final result = await _googleSignIn();
      if (kDebugMode) {
        print("Logged in User is =>>>>>>>>>>>>>>>>>>>>>>>>>>>>${result.user}");
      }
    } catch (err) {
      if (kDebugMode) {
        print("Login Failed $err");
      }
    }
  }

  // Facebook Log-in

  bool _isFacebookLoggingIn = false;

  Future<void> signInWithFacebook() async {
    if (_isFacebookLoggingIn) return; // Prevent duplicate login
    _isFacebookLoggingIn = true;

    try {
      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        final accessToken = result.accessToken!.tokenString;

        final supaBase = Supabase.instance.client;

        final response = await supaBase.auth.signInWithIdToken(
          provider: OAuthProvider.facebook,
          idToken: accessToken,
        );

        final session = Supabase.instance.client.auth.currentSession;
        if (session != null && kDebugMode) {
          if (kDebugMode) {
            print("User is logged in: ${session.user.email}");
          }
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Subscription()),
          );
        }

        if (kDebugMode) {
          print("User Session : ${response.session}");
        }
      } else {
        if (kDebugMode) {
          print("Facebook Login Failed : ${result.message}");
        }
      }
    } catch (err) {
      if (kDebugMode) {
        print("Facebook login Error : $err");
      }
    } finally {
      _isFacebookLoggingIn = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('assets/images/Blinkist.png')),
            SizedBox(height: 40),
            SizedBox(
              width: width * 0.85,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  backgroundColor: WidgetStateProperty.all(Color(0xFF4267B2)),
                ),
                onPressed: () async {
                  _isFacebookLoggingIn ? null : () => signInWithFacebook();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Image(
                        image: AssetImage("assets/images/facebook.png"),
                      ),
                    ),
                    Text(
                      'Connect with Facebook',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFFFFFFFF),
                        fontFamily: 'Medium',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: width * 0.85,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  backgroundColor: WidgetStateProperty.all(Color(0xFFFFFFFF)),
                ),
                onPressed: () {
                  _handleGoogleLogin();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Image(
                        width: 20,
                        height: 20,
                        image: AssetImage("assets/images/Google_img.png"),
                      ),
                    ),
                    Text(
                      'Connect with Google',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF3c4142),
                        fontFamily: 'Medium',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(color: Colors.grey, width: width * 0.4, height: 2),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Or",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),

                Container(color: Colors.grey, width: width * 0.4, height: 2),
              ],
            ),
            SizedBox(height: 20),
            commonBtn(
              label: 'Signup With Email',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

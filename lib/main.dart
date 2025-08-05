import 'package:blinkist/repositories/Splash/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://mlgvfdisketvkpukdiuu.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1sZ3ZmZGlza2V0dmtwdWtkaXV1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTQxMjA1MDcsImV4cCI6MjA2OTY5NjUwN30.T7ApX4eaRXMPDmlYa6LktuhGr9zumfOmlGimi8PMkB8',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blinkist',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Splashscreen(),
    );
  }
}

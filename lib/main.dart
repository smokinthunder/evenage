import 'package:evenage/presentation/auth/signup_screen.dart';
import 'package:evenage/presentation/home.dart';
import 'package:flutter/material.dart';
import 'package:evenage/domain/core/di/injectable.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final prefs = await SharedPreferences.getInstance();
  // final skipOnBoarding = prefs.getBool("skipOnBoarding") ?? false;

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await configureInjection();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Evenage',
      home: SignUpScreen(),
    );
  }
}
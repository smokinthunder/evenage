import 'package:evenage/application/auth/auth_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:evenage/presentation/auth/signup_screen.dart';
// import 'package:evenage/presentation/home.dart';

import 'package:evenage/presentation/eventlist.dart';
import 'package:evenage/presentation/home.dart';
import 'package:flutter/material.dart';
import 'package:evenage/domain/core/di/injectable.dart';
import 'package:evenage/infrastructure/core/firebase_option.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return MaterialApp(
      title: 'Evenage',
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<AuthBloc>(),
          ),
        ],
        child: BottomNavBar(),
        // child: SignUpScreen(),
      ),
    );
  }
}

import 'package:car_rental/data/models/car.dart';
import 'package:car_rental/firebase_options.dart';
import 'package:car_rental/injection_container.dart';
import 'package:car_rental/presentation/bloc/car_bloc.dart';
import 'package:car_rental/presentation/bloc/car_event.dart';
import 'package:car_rental/presentation/screens/car_detail_screen.dart';
import 'package:car_rental/presentation/screens/car_list_screen.dart';
import 'package:car_rental/presentation/screens/maps_detail_screen.dart';
import 'package:car_rental/presentation/screens/onboarding_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  initInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (_) => getIt<CarBloc>()..add(LoadCars()),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white38),
        ),
        home: OnboardingScreen(),
      ),
    );
  }
}



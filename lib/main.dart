import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rmb/components/bottom_bar.dart';
import 'package:firebase_app_check/firebase_app_check.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

  );
  await FirebaseAppCheck.instance.activate(
    webProvider: ReCaptchaV3Provider('6LcAMA8qAAAAAGQoZlYy-oIAj5qliyXL2BIUOJvZ'),
  );
  await FirebaseAppCheck.instance.activate(

    androidProvider: AndroidProvider.playIntegrity,

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
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black26),
        useMaterial3: true,
      ),
      home: const BottomBar(


      ),
    );
  }
}


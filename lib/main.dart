import 'package:flutter/material.dart';
import 'package:loginpage_ui_flutter/change_password.dart';
import 'package:loginpage_ui_flutter/forgot_password.dart';
import 'package:loginpage_ui_flutter/login_home_page.dart';
import 'package:loginpage_ui_flutter/onboarding_screen.dart';
import 'package:loginpage_ui_flutter/otp_verification.dart';
import 'package:loginpage_ui_flutter/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
// debugShowCheckedModeBanner: false,
//       home: ChangePassword(),
      routes: {
        "/": (context) => OnBoardingScreen(),
        "Login": (context) => LoginPage(),
        "Register": (context) => RegisterPage(),
        "ForgotPasswordEmail": (context) => ForgotPassword(),
        "OtpVerification": (context) => OtpVerification(),
        "ChangePassword": (context) => ChangePassword(),
      },
    );
  }
}

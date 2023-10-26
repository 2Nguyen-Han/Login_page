import 'dart:async';

import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  bool _isSecurePassword = true;
  final _formKey = GlobalKey<FormState>();
  String _userEmail = '';
  String _password = '';

  void _trySubmitForm() {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      debugPrint(_userEmail);
      debugPrint(_password);
    }
  }
  int _start = 30;
  bool _isResendAgain = false;
  bool _isVerified = false;
  bool _isLoading = false;
  String _code = "";
  late Timer _time;
  String titleMessage = "You should receive the OTP in";
  String buttonMessage = "30 Second";
  // String buttonMessage=" 30 second";
  void resend() {
    setState(() {
      _isResendAgain = true;
    });
    const oneSec = Duration(seconds: 1);
    _time = Timer.periodic(oneSec, (timer) {
      setState(() {
        if (_start == 0) {
          _start = 30;
          _isResendAgain = false;
          titleMessage = "Didn't recieve the OTP?";
          buttonMessage = "Resend OTP";
          // buttonMessage="Resend";
          _time.cancel();
        } else {
          _start--;
        }
      });
    });
  }
  verify() {
    setState(() {
      _isLoading = true;
    });
    const oneSec = Duration(milliseconds: 10000);
    _time = new Timer.periodic(oneSec, (timer) {
      setState(() {
        _isLoading = false;
        _isVerified = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: const Text(
                    "OTP Verification",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  centerTitle: true,
                  leading:
                      // Container(
                      //   padding: EdgeInsets.fromLTRB(24, 1, 10, 2),
                      //   child:
                      InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(24, 1, 10, 2),
                      child: Image.asset(
                        "assets/icons/button_otp.png",
                        height: 50,
                        width: 50,
                      ),
                    ),
                  )
                  // ),
                  ),
              body: SingleChildScrollView(
                child: Container(

                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(50, 15, 10, 2),
                        child: Image.asset(
                          "assets/images/otp_verification.png",
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(30, 15, 20, 5),
                        child: Text(
                          'Enter OTP',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              "An 4 digit code has been sent to your\nemail",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey.shade600),
                            ),
                          ),

                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            child: otpField(),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 35),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    titleMessage,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey.shade500),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        if (_isResendAgain) return;
                                        resend();
                                      },
                                      child: Text(
                                        _isResendAgain
                                            ? _start.toString() + " Second "
                                            : buttonMessage,
                                        style: TextStyle(
                                            color: Colors.orangeAccent),
                                      ))
                                ],
                              )),
                          SizedBox(
                            height: 12,
                          ),
                          InkWell(
                            onTap: () {
                              // _trySubmitForm();
                              Navigator.pushNamed(context, "ChangePassword");
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 10),
                              margin: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 28),
                              decoration: BoxDecoration(
                                color: Colors.orangeAccent,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Center(
                                child: Text(
                                  'Verify',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )));
  }

  Widget otpField() {
    return OTPTextField(
      length: 4,
      width: MediaQuery.of(context).size.width - 140,
      fieldWidth: 50,
      otpFieldStyle: OtpFieldStyle(backgroundColor: Colors.black12),
      style: TextStyle(fontSize: 17),
      textFieldAlignment: MainAxisAlignment.spaceAround,
      keyboardType: TextInputType.number,
      // fieldStyle: FieldStyle.underline,
      onCompleted: (pin) {
        setState(() {
          _code = pin;
        });
      },
    );
  }
}

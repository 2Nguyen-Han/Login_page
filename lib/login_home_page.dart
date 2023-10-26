import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isSecurePassword=true;
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      children: [
        Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(287),
              child: AppBar(

                flexibleSpace: Container(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/images/login1page.png",
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      InkWell(onTap:(){
    Navigator.pop(context);
    },
    child:
                      Container(
                        padding: EdgeInsets.fromLTRB(18, 25, 10, 2),
                        child: InkWell(
                          onTap: () {},
                          child: Image.asset(
                            "assets/icons/navigate_bf.png",

                          ),
                        ),
                      ),
                      )
                    ],
                  ),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,

              ),
    ),
            body: SingleChildScrollView(
              child: Form(
                  key: _formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(90, 4, 20, 5),
                          child: Text(
                            'Welcome back',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 34,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(100, 4, 20, 5),
                          child: Text(
                            'Login to your account',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 21,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.01,
                              right: 27,
                              left: 30),
                          child: Column(children: [
                            TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide(
                                      width: 1,
                                    )),
                                contentPadding:
                                    EdgeInsets.only(top: 16, left: 15),
                                hintText: 'Enter email or phone',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              validator: (value) {
                                print(value);
                                if (value == null || value.trim().isEmpty) {
                                  return 'Please enter your email address';
                                }
                                // Check if the entered email has the right format
                                if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                  return 'Invalid email or Password. Try again';
                                }
                                // Return null if the entered email is valid
                                return null;
                              },
                              onChanged: (value) => _userEmail = value,
                            )
                          ]),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.01,
                            right: 27,
                            left: 30,
                          ),
                          child: TextFormField(
                            obscureText: _isSecurePassword,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(width: 1),
                                ),
                                contentPadding:
                                    EdgeInsets.only(top: 16, left: 25),
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                suffixIcon: togglePassword()
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Invalid email or Password. Try again';
                              }
                              if (value.trim().length < 8) {
                                return 'Password must be at least 8 characters in length';
                              }
                              return null;
                            },
                            onChanged: (value) => _password = value,
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.fromLTRB(35, 10, 7, 5),
                            child: Row(children: [
                              Image.asset("assets/icons/tick_icon.png"),
                              Text(
                                " Remember me",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14),
                              ),
                              SizedBox(
                                width: 80,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, "ForgotPasswordEmail");
                                },
                                child: const Text(
                                  "Forgot Password ?",
                                  style: TextStyle(
                                      color: Colors.orangeAccent, fontSize: 15),
                                ),
                              )
                            ])),
                        InkWell(
                          onTap: () {
                            _trySubmitForm();
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
                                'Log In',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Divider(
                                  thickness: 1.5,
                                  color: Colors.orangeAccent,
                                )),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    "OR",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Expanded(
                                    child: Divider(
                                  thickness: 1.5,
                                  color: Colors.orangeAccent,
                                )),
                              ],
                            )),
                        SizedBox(
                          height: 14,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {

                              },
                              child: Image.asset(
                                "assets/icons/icon1.png",
                                height: 42,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              onTap: () {

                              },
                              child: Image.asset(
                                "assets/icons/icon2_gg.png",
                                height: 42,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            InkWell(
                                onTap: () {

                                },
                                child: Image.asset(
                                  "assets/icons/icon3_ap.png",
                                  height: 42,
                                )),
                          ],
                        ),
                        Container(
                            padding: EdgeInsets.fromLTRB(65, 20, 64, 2),
                            child: Row(children: [
                              Text(
                                "Don't have an Account? ",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, 'Register');
                                },
                                child: const Text(
                                  "Creat Account",
                                  style: TextStyle(
                                      color: Colors.orangeAccent,
                                      fontSize: 14.5),
                                ),
                              )
                            ])),
                      ])),
            ))
      ],
    ));
  }
  Widget togglePassword(){
    return IconButton(onPressed: (){
      setState(() {
        _isSecurePassword=!_isSecurePassword;
      });

    }, icon: _isSecurePassword? Icon(Icons.visibility): Icon(Icons.visibility_off), color: Colors.grey,);
  }

}

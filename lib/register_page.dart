import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isSecurePassword = true;
  final _formKey = GlobalKey<FormState>();

  String _userEmail = '';
  String _yourName = '';
  String _phoneName = '';
  String _password = '';

  void _trySubmitForm() {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      debugPrint(_userEmail);
      debugPrint(_yourName);
      debugPrint(_phoneName);
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
            preferredSize: Size.fromHeight(170),
            child: AppBar(
              flexibleSpace: Container(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/images/register1.png",
                          ),
                          fit: BoxFit.fill,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(132, 1, 20, 5),
                  child: Text(
                    'Register',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 34,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(78, 4, 20, 5),
                  child: Text(
                    'Create your new account',
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
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(width: 0.8)),
                        contentPadding: EdgeInsets.only(top: 14, left: 15),
                        hintText: 'Name',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[a-z A-Z]').hasMatch(value)) {}
                      },
                      onChanged: (value) => _yourName = value,
                    )),
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
                        contentPadding: EdgeInsets.only(top: 16, left: 15),
                        hintText: 'E-mail',
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
                        left: 30),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(width: 0.8)),
                        contentPadding: EdgeInsets.only(top: 14, left: 15),
                        hintText: 'Phone',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'(^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$)')
                                .hasMatch(value)) {}
                      },
                      onChanged: (value) => _phoneName = value,
                    )),
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
                      contentPadding: EdgeInsets.only(top: 16, left: 15),
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),

                      // suffixIcon: togglePassword()
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
                    padding: EdgeInsets.fromLTRB(22, 20, 7, 5),
                    child: Column(children: [
                      Row(children: [
                        Text(
                          "By signing up you agree to our ",
                          style: TextStyle(color: Colors.black, fontSize: 15.5),
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Text(
                            "Terms & Conditions",
                            style: TextStyle(
                                color: Colors.orangeAccent,
                                fontSize: 15.5,
                                decoration: TextDecoration.underline),
                          ),
                        )
                      ]),
                      Center(
                          child: Row(children: [
                        SizedBox(width: 112),
                        Text(
                          "and ",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Text(
                            "Privacy Policy",
                            style: TextStyle(
                                color: Colors.orangeAccent,
                                fontSize: 15,
                                decoration: TextDecoration.underline),
                          ),
                        )
                      ])),
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
                        'Sign Up',
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
                          padding: const EdgeInsets.symmetric(horizontal: 10),
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
                      onTap: () {},
                      child: Image.asset(
                        "assets/icons/icon1.png",
                        height: 42,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        "assets/icons/icon2_gg.png",
                        height: 42,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                        onTap: () {},
                        child: Image.asset(
                          "assets/icons/icon3_ap.png",
                          height: 42,
                        )),
                  ],
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(100, 16, 64, 2),
                    child: Row(children: [
                      Text(
                        "Already have an Account? ",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "Login");
                        },
                        child: const Text(
                          "Log In",
                          style: TextStyle(
                              color: Colors.orangeAccent, fontSize: 14.5),
                        ),
                      )
                    ])),
              ],
            ),
          ),
        )
      ],
    ));
  }

  Widget togglePassword() {
    return IconButton(
      onPressed: () {
        setState(() {
          _isSecurePassword = !_isSecurePassword;
        });
      },
      icon: _isSecurePassword
          ? Icon(Icons.visibility)
          : Icon(Icons.visibility_off),
      color: Colors.grey,
    );
  }
}

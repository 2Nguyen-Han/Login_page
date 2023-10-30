import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  String _userEmail = '';
  void _trySubmitForm() {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      debugPrint(_userEmail);
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
              Container(
                padding: EdgeInsets.fromLTRB(18, 25, 10, 2),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    "assets/icons/navigate_bf.png",
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
        padding: EdgeInsets.fromLTRB(32, 30, 20, 2),
        child: Text(
          'Forgot your password?',
          style: TextStyle(
              color: Colors.black,
              fontSize: 23,
              fontWeight: FontWeight.bold),
        ),
      ),
      Container(
        padding: EdgeInsets.fromLTRB(32, 2, 20, 5),
        child: Text(
          'Enter email address',
          style: TextStyle(
              color: Colors.black,
              fontSize: 20,
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
              EdgeInsets.only(top: 16, left: 17),

            ),
            validator: (value) {
              print(value);
              if (value == null || value.trim().isEmpty) {
                return 'Enter email and Try again!';
              }
              // Check if the entered email has the right format
              if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                return 'Invalid email. Try again';
              }
              // Return null if the entered email is valid
              return null;
            },
            onChanged: (value) => _userEmail = value,
          )
        ]),
      ),
      InkWell(
        onTap: () {
          // _trySubmitForm();
          if(_formKey.currentState!.validate()){

            Navigator.pushNamed(context, "OtpVerification");
          }else{
            _trySubmitForm();
          }

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
              'Send code',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
      SizedBox(height: 175,),
      Container(
          padding: EdgeInsets.fromLTRB(75, 16, 50, 2),
          child: Row(children: [
            Text(
              " Don't have an Account?",
              style: TextStyle(
                  color: Colors.black, fontSize: 14),
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


    ]
        )
    )
        )
        )
    ]
    )
    );
  }
}

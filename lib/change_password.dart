import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool _isSecurePassword=true;
  bool _isSecurePassword1=true;
  final _formKey = GlobalKey<FormState>();

  TextEditingController _password=TextEditingController();
  @override
  void dispose(){
    _password.dispose();
    super.dispose();
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
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
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
                child:Form(
                  key: _formKey,
                  child:
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 29),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: const Text(
                          "Create new password",
                          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 29,
                        vertical: 8,
                      ),
                      child: Text(
                        "Enter new password",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.01,
                          right: 27,
                          left: 30),
                      child: Column(children: [
                        TextFormField(
                          obscureText: _isSecurePassword,
                          controller: _password,
                          obscuringCharacter: ".",
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                    width: 1,
                                  )
                              ),
                              contentPadding:
                              EdgeInsets.only(top: 16, left: 15),
                              hintText: 'Enter new password',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              suffixIcon: togglePassworda()
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
                        )
                      ]),
                    ),
                    SizedBox(height: 2,),
                    Padding(padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.01,
                        right: 27,
                        left: 30),
                      child: TextFormField(
                        // controller: _password,
                        // obscureText: true,
                        obscureText: _isSecurePassword1,
                        obscuringCharacter: ".",
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(
                                  width: 1,
                                )
                            ),
                            contentPadding:
                            EdgeInsets.only(top: 16, left: 15),
                            hintText: 'Confirm password',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            suffixIcon: togglePasswordb()
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter again password';
                          }
                          else if (value.trim().length < 8) {
                            return 'Password must be at least 8 characters in length';
                          }else if(value!=_password.text){
                            return "Password is incorrect. Try again it.";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 15,),
                    InkWell(
                      onTap: () {
                        if(_formKey.currentState!.validate()){
                          // (context,"Password changed successfully");
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
                            'Submit',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]
                  ),
                ),
              ),
            )
          ],
        ));
  }
  Widget togglePassworda(){
    return IconButton(onPressed: (){
      setState(() {
        _isSecurePassword=!_isSecurePassword;
      });

    }, icon: _isSecurePassword? Icon(Icons.visibility): Icon(Icons.visibility_off), color: Colors.grey,);
  }
  Widget togglePasswordb(){
    return IconButton(onPressed: (){
      setState(() {
        _isSecurePassword1=!_isSecurePassword1;
      });

    }, icon: _isSecurePassword1? Icon(Icons.visibility): Icon(Icons.visibility_off), color: Colors.grey,);
  }
}


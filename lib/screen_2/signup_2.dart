
import 'package:auth/colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login_2.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var nameControlar = TextEditingController();
  var emailControlar = TextEditingController();
  var numControlar = TextEditingController();
  var passControlar = TextEditingController();

  @override
  void dispose() {
  
    super.dispose();
    nameControlar.dispose();
    emailControlar.dispose();
    numControlar.dispose();
    passControlar.dispose();
  }

  final _formkey = GlobalKey<FormState>();
  bool passToggle = true;

  
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Screen2().white,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Image.asset(
                  'assets/images/screen.jpg',
                  width: 200,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    textField('Full Name', const Icon(Icons.person), nameControlar,
                        TextInputType.text, 'Enter full name'),
                    textField(
                        'Email Address',
                        const Icon(Icons.email),
                        emailControlar,
                        TextInputType.emailAddress,
                        'Enter email address'),
                    textField('Phone Number', const Icon(Icons.phone), numControlar,
                        TextInputType.number, 'Enter phone number'),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 8),
                      child: TextFormField(
                        controller: passControlar,
                        obscureText: passToggle ? true : false,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: const OutlineInputBorder(),
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: InkWell(
                            onTap: () {
                              if (passToggle == true) {
                                passToggle = false;
                              } else {
                                passToggle = true;
                              }
                              setState(() {});
                            },
                            child: passToggle
                                ? const Icon(CupertinoIcons.eye_slash_fill)
                                : const Icon(CupertinoIcons.eye_fill),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter password';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: double.infinity,
                  child: Material(
                    color: Screen2().primarycolor,
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        if (_formkey.currentState!.validate()) {
                          
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 12, horizontal: 35),
                        child: Center(
                          child:  Text(
                                  'Create Account',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have account?",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Login(),
                          ),
                        );
                      },
                      child: Text(
                        'Log In',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Screen2().primarycolor),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding textField(name, icon, Controlars, keyboaeds, error) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: TextFormField(
        keyboardType: keyboaeds,
        controller: Controlars,
        decoration: InputDecoration(
          labelText: name,
          border: OutlineInputBorder(),
          prefixIcon: icon,
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return error;
          }
          return null;
        },
      ),
    );
  }
}

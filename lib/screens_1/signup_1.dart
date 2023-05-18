import 'package:auth/colors/colors.dart';
import 'package:auth/screens_1/login_1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class SignupPage extends StatefulWidget {
  SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var nameControllers = TextEditingController();
  var userNameControllers = TextEditingController();
  var emailControllers = TextEditingController();
  var passwordControllers = TextEditingController();

  bool passToggle = true;

  final _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    emailControllers.dispose();
    nameControllers.dispose();
    passwordControllers.dispose();
    userNameControllers.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Screen1().tdBackground,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 80),
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Screen1().tdButtonAndText,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    textFormField(userNameControllers, 'Username',
                        Icon(CupertinoIcons.profile_circled), 'Enter Username',  TextInputType.name),
                    textFormField(
                        nameControllers,
                        'Full Name',
                        Icon(CupertinoIcons.person_alt_circle),
                        'Enter full name',  TextInputType.name),
                    textFormField(emailControllers, 'Email',
                        Icon(CupertinoIcons.mail), 'Enter email address',  TextInputType.emailAddress),
                    TextFormField(
                      controller: passwordControllers,
                      obscureText: passToggle ? true : false,
                      decoration: InputDecoration(
                        label: Text(
                          'Password',
                          style: TextStyle(color: Screen1().tdButtonAndText),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        prefixIcon: Icon(CupertinoIcons.lock_circle),
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
                              ? Icon(CupertinoIcons.eye_slash_fill)
                              : Icon(CupertinoIcons.eye_fill),
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
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (value) {},
                    shape: CircleBorder(eccentricity: 0.0),
                  ),
                  Text(
                    'By signup you accept the',
                    style: TextStyle(
                      fontSize: 10,
                      color: Screen1().tdButtonAndText,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(onTap: (){},
                      child: Text(
                        'Term and service',
                        style: TextStyle(
                          fontSize: 12,
                          color: Screen1().tdLink,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      ' and',
                      style: TextStyle(
                        fontSize: 10,
                        color: Screen1().tdButtonAndText,
                      ),
                    ),
                    InkWell(onTap: (){},
                      child: Text(
                        ' Privacy and policy',
                        style: TextStyle(
                          fontSize: 12,
                          color: Screen1().tdLink,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              InkWell(
                onTap: () {
                  if (_formkey.currentState!.validate()) {}
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Screen1().tdButtonAndText,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Sign Up',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  loginMedia('assets/images/google.png', () {}),
                  loginMedia('assets/images/facebook.png', () {}),
                  loginMedia('assets/images/twitter.png', () {}),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already a user?',
                      style: TextStyle(
                        fontSize: 14,
                        color: Screen1().tdButtonAndText,
                      ),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ));
                      },
                      child: Text(
                        'LogIn',
                        style: TextStyle(
                          fontSize: 18,
                          color: Screen1().tdButtonAndText,
                          fontWeight: FontWeight.bold,
                        ),
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

  loginMedia(image, ontaps) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: ontaps,
        child: SizedBox(
          width: 40,
          height: 40,
          child: Image(
            image: AssetImage(image),
          ),
        ),
      ),
    );
  }

  textFormField(controllers, input, icon, error, keybard) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(keyboardType: keybard,
        controller: controllers,
        decoration: InputDecoration(
          label: Text(
            input,
            style: TextStyle(color: Screen1().tdButtonAndText),
          ),
          prefixIcon: icon,
          iconColor: Screen1().tdButtonAndText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
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

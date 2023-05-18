import 'package:auth/colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PasswordForget1 extends StatefulWidget {
  PasswordForget1({super.key});

  @override
  State<PasswordForget1> createState() => _PasswordForget1State();
}

class _PasswordForget1State extends State<PasswordForget1> {
  var emailControllers = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailControllers.dispose();
  }

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AlertDialog(
        backgroundColor: Screen1().tdBackground,
        title: Text(
          'Forget password',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Screen1().tdButtonAndText,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Form(
          key: _formkey,
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: emailControllers,
            decoration: InputDecoration(
              label: Text(
                'Email',
                style: TextStyle(color: Screen1().tdButtonAndText),
              ),
              prefixIcon: Icon(CupertinoIcons.mail),
              iconColor: Screen1().tdButtonAndText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Enter email address';
              }
              return null;
            },
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              if (_formkey.currentState!.validate()) {}
            },
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Screen1().tdButtonAndText,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Padding(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                  child: Text(
                    "Forget password",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

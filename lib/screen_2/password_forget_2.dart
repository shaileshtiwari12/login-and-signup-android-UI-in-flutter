import 'package:auth/colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PasswordForget2 extends StatefulWidget {
  PasswordForget2({super.key});

  @override
  State<PasswordForget2> createState() => _PasswordForget2State();
}

class _PasswordForget2State extends State<PasswordForget2> {
  var emailControllers = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailControllers.dispose();
  }

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Screen2().white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.all(20),
              child: Image.asset(
                'assets/images/screen.jpg',
                width: 200,
              ),
            ),
            const SizedBox(height: 10),
            Form(
              key: _formkey,
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailControllers,
                decoration: InputDecoration(
                  label: const Text(
                    'Email',
                  ),
                  prefixIcon: const Icon(CupertinoIcons.mail),
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
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                if (_formkey.currentState!.validate()) {}
              },
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Screen2().primarycolor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        child: Icon(Icons.arrow_back_ios),
        backgroundColor: Screen2().primarycolor,
      ),
    );
  }
}

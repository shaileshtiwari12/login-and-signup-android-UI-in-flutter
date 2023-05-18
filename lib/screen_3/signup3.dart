import 'package:auth/colors/colors.dart';
import 'package:auth/screen_3/login3.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import 'package:flutter/material.dart';

class Signup_Page extends StatefulWidget {
  const Signup_Page({super.key});

  @override
  State<Signup_Page> createState() => _Signup_PageState();
}

class _Signup_PageState extends State<Signup_Page> {
  final emailcontrolar = TextEditingController();
  final passcontrolar = TextEditingController();
  final namecontrolar = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Screen3().tdBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: WaveClipperTwo(),
                  child: Container(
                    height: 200,
                    color: Screen3().tdBotton,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Center(
                    child: Container(
                      width: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(70),
                        color: Colors.white,
                      ),
                      child: const Image(
                        image: NetworkImage(
                            'https://cdn.pixabay.com/photo/2016/04/15/18/05/computer-1331579_960_720.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            const Text(
              'Sign Up',
              textAlign: TextAlign.end,
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      textFormField(namecontrolar, 'Full Name'),
                      textFormField(emailcontrolar, 'Email'),
                      textFormField(passcontrolar, 'Password'),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    ClipPath(
                        clipper: WaveClipperTwo(reverse: true, flip: true),
                        child: Container(
                          height: 200,
                          color: Screen3().tdBotton,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: Center(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.login,
                            color: Colors.black,
                          ),
                          label: const Text(
                            'Sign Up',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Screen3().tdBackground),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.only(
                                    left: 30, right: 30, top: 15, bottom: 15)),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 120),
                        child: FloatingActionButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          backgroundColor: Screen3().tdBackground,
                          tooltip: 'Log In',
                          child: const Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  textFormField(controllers, texts) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        controller: controllers,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)),
          labelStyle: const TextStyle(color: Colors.black),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)),
          labelText: texts,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

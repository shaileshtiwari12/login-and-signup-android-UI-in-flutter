import 'package:auth/screen_2/login_2.dart';
import 'package:auth/screen_3/login3.dart';
import 'package:auth/screens_1/login_1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('LogIn and SignUp UI'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            ClipPaths(
              text: 'LogIn and SignUp UI - 1',
              colors: Colors.amber,
              ontap: LoginPage(),
            ),
            ClipPaths(
              text: 'LogIn and SignUp UI - 2',
              colors: Colors.blueAccent,
              ontap: Login(),
            ),
            ClipPaths(
              text: 'LogIn and SignUp UI - 3',
              colors: Colors.red,
              ontap: Login_Page(),
            ),
          ],
        ),
      ),
    );
  }
}

class ClipPaths extends StatelessWidget {
  final text;
  final colors;
  final ontap;
  const ClipPaths({
    super.key,
    required this.text,
    required this.colors,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
      child: ClipPath(
        clipper: OvalRightBorderClipper(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          color: colors,
          child: Center(
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ontap,
                    ));
              },
              child: Text(
                text as String,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

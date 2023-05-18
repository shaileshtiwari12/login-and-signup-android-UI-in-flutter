import 'package:auth/colors/colors.dart';
import 'package:auth/screen_3/login3.dart';
import 'package:auth/screen_3/signup3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class Password_Forget3 extends StatefulWidget {
  const Password_Forget3({super.key});

  @override
  State<Password_Forget3> createState() => _Password_Forget3State();
}

class _Password_Forget3State extends State<Password_Forget3> {
  final emailcontrolar = TextEditingController();

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
            const SizedBox(height: 90),
            const Text(
              'Password Forget',
              textAlign: TextAlign.end,
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 90),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      textFormField(emailcontrolar, 'Email'),
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
                      ),
                    ),
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
                            'Forget',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Screen3().tdBackground),
                            padding: MaterialStateProperty.all(
                              const EdgeInsets.only(
                                  left: 30, right: 30, top: 15, bottom: 15),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 120),
                      child: Center(
                        child: FloatingActionButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Login_Page(),
                                ));
                          },
                          backgroundColor: Screen3().tdBackground,
                        
                          child: const Icon(Icons.arrow_back_ios_new,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
                // const SizedBox(height: 20),
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

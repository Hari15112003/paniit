// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:name/authentication/start/splash_screen.dart';
import 'package:name/pages/initial_page.dart';
import 'package:name/utilities/snack_bar.dart';

import '../../main.dart';
import '../../utilities/navigation.dart';
import 'signup.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _pass = true;
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    var hei = MediaQuery.of(context).size.height;
    var wid = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                // margin: EdgeInsets.only(top: hei * 0.04),
                height: hei * 0.28,
                // margin: EdgeInsets.only(left: wid * 0.03),
                child: Image.asset('assets/png/logo2.png'),
              ),
            ),
            Text(
              'Good to see you again',
              style:
                  TextStyle(fontSize: hei * 0.033, fontWeight: FontWeight.bold),
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Login to'),
                SizedBox(width: wid * 0.02),
                const Text(
                  'Learn',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: wid * 0.02,
                ),
                const Text('to continue learning.')
              ],
            ),
            Container(
              height: hei * 0.07,
              margin: EdgeInsets.only(
                  left: wid * 0.065, right: wid * 0.065, top: hei * 0.05),
              child: TextField(
                controller: emailController,
                cursorColor: const Color.fromARGB(255, 76, 157, 175),
                decoration: InputDecoration(
                    focusColor: const Color.fromARGB(255, 76, 157, 175),
                    // hintStyle:,

                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 76, 157, 175))),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    suffixIcon: const Icon(Icons.email_outlined),
                    labelStyle:
                        TextStyle(color: Colors.black, fontSize: hei * 0.018),
                    hintText: '123@gmail.com',
                    hintStyle: TextStyle(fontSize: hei * 0.02),
                    labelText: 'Email address'),
              ),
            ),
            Container(
              height: hei * 0.07,
              margin: EdgeInsets.only(
                  left: wid * 0.065, right: wid * 0.065, top: hei * 0.025),
              child: TextField(
                controller: passwordController,
                obscureText: _pass,
                cursorColor: const Color.fromARGB(255, 76, 157, 175),
                decoration: InputDecoration(
                    focusColor: const Color.fromARGB(255, 76, 157, 175),
                    // hintStyle:,

                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 76, 157, 175))),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    suffixIcon: togglePassword(),
                    hintText: '123...',
                    hintStyle: TextStyle(fontSize: hei * 0.02),
                    labelStyle:
                        TextStyle(color: Colors.black, fontSize: hei * 0.018),
                    labelText: 'Password'),
              ),
            ),
            Container(
              alignment: const Alignment(1.0, 0.0),
              margin: EdgeInsets.only(right: wid * 0.06, top: hei * 0.04),
              child: Text(
                'Forgot Password?',
                style: TextStyle(fontSize: hei * 0.018),
              ),
            ),
            GestureDetector(
              onTap: () {
                _signIn(
                    emailController: emailController,
                    passwordController: passwordController);
              },
              child: Container(
                // margin: Ed,
                decoration: BoxDecoration(
                    color: const Color(0xFF6EDD8A),
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.only(
                    top: hei * 0.02, left: wid * 0.065, right: wid * 0.065),
                // color: Colors.blue,
                height: hei * 0.07,
                child: const Center(
                    child: Text(
                  'Sign in',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: wid * 0.08, top: hei * 0.13),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin:
                        EdgeInsets.only(left: wid * 0.02, right: wid * 0.02),
                    height: hei * 0.01,
                    width: wid * 0.2,
                    decoration: const BoxDecoration(
                        // color: Colors.blue,
                        border: BorderDirectional(bottom: BorderSide())),
                  ),
                  Center(
                    child: Text(
                      'Dont have an account?',
                      style: TextStyle(fontSize: hei * 0.018),
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(left: wid * 0.02, right: wid * 0.02),
                    height: hei * 0.01,
                    width: wid * 0.2,
                    decoration: const BoxDecoration(
                        // color: Colors.blue,
                        border: BorderDirectional(bottom: BorderSide())),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignupPage()));
              },
              child: Container(
                // margin: Ed,
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFF6EDD8A)),
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.only(
                    top: hei * 0.02, left: wid * 0.065, right: wid * 0.065),
                // color: Colors.blue,
                height: hei * 0.07,
                child: const Center(child: Text('Create Account')),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget togglePassword() {
    return IconButton(
        onPressed: () {
          setState(() {
            _pass = !_pass;
          });
        },
        icon: _pass
            ? const Icon(Icons.visibility_outlined)
            : const Icon(Icons.visibility_off_outlined));
  }

  Future<void> _signIn(
      {required TextEditingController emailController,
      required TextEditingController passwordController}) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // Navigate to the home screen or display a success message
    } catch (e) {
      showSnackBar(context: context, content: e.toString());

      // Handle error, e.g., display an error message
    }
  }
}

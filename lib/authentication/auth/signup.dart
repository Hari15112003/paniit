// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:name/firebase/student.dart';
import 'package:name/main.dart';
import 'package:name/pages/initial_page.dart';

import '../../utilities/image_pick.dart';
import '../../utilities/navigation.dart';
import '../../utilities/snack_bar.dart';

import 'package:firebase_storage/firebase_storage.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  File? image;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController upiIdController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _collection = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    upiIdController.dispose();
    super.dispose();
  }

  bool _pass = true;

  void selectedImage() async {
    image = await pickImage(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var hei = MediaQuery.of(context).size.height;
    var wid = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: hei * 0.05,
            ),
            Text(
              'Register To Continue',
              style:
                  TextStyle(fontSize: hei * 0.033, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: hei * 0.008,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Join'),
                SizedBox(width: wid * 0.02),
                const Text(
                  'Learn',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: wid * 0.02,
                ),
                const Text('to improve learning')
              ],
            ),
            SizedBox(
              height: hei * 0.02,
            ),
            GestureDetector(
              onTap: () {
                print("ad");
                selectedImage();
              },
              child: image == null
                  ? CircleAvatar(
                      backgroundColor: const Color(0xFF6EDD8A),
                      maxRadius: hei * 0.065,
                      child:
                          Center(child: Image.asset('assets/png/profile.png')),
                      // backgroundImage: NetworkImage('images/profile.png'),
                    )
                  : CircleAvatar(
                      backgroundImage: FileImage(image!),
                      radius: 50,
                    ),
            ),
            SizedBox(
              height: hei * 0.01,
            ),
            Center(
              child: Text(
                'Set profile picture',
                style: TextStyle(
                    fontSize: hei * 0.015,
                    decoration: TextDecoration.underline),
              ),
            ),
            Container(
              height: hei * 0.1,
              margin: EdgeInsets.only(
                  left: wid * 0.065, right: wid * 0.065, top: hei * 0.025),
              child: TextField(
                controller: nameController,
                cursorColor: const Color.fromARGB(255, 76, 157, 175),
                decoration: InputDecoration(
                    focusColor: const Color.fromARGB(255, 76, 157, 175),
                    // hintStyle:,

                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 76, 157, 175))),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    suffixIcon: const Icon(Icons.person_outlined),
                    hintText: 'Enter your full name',
                    hintStyle: TextStyle(fontSize: hei * 0.02),
                    helperText: 'example: Abdul kalam',
                    labelStyle:
                        TextStyle(color: Colors.black, fontSize: hei * 0.018),
                    labelText: 'Name'),
              ),
            ),
            Container(
              height: hei * 0.1,
              margin: EdgeInsets.only(
                  left: wid * 0.065, right: wid * 0.065, top: hei * 0.025),
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
                    hintText: 'Enter your email',
                    hintStyle: TextStyle(fontSize: hei * 0.02),
                    helperText: 'example: abc@gmail.com',
                    labelStyle:
                        TextStyle(color: Colors.black, fontSize: hei * 0.018),
                    labelText: 'Email'),
              ),
            ),
            Container(
              height: hei * 0.1,
              margin: EdgeInsets.only(
                  left: wid * 0.065, right: wid * 0.065, top: hei * 0.025),
              child: TextField(
                controller: upiIdController,
                cursorColor: const Color.fromARGB(255, 76, 157, 175),
                decoration: InputDecoration(
                    focusColor: const Color.fromARGB(255, 76, 157, 175),
                    // hintStyle:,

                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 76, 157, 175))),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    suffixIcon: const Icon(Icons.file_upload_outlined),
                    hintText: 'Enter your UID',
                    hintStyle: TextStyle(fontSize: hei * 0.02),
                    helperText: 'example: abc@okaxisbank',
                    labelStyle:
                        TextStyle(color: Colors.black, fontSize: hei * 0.018),
                    labelText: 'UPI ID'),
              ),
            ),
            Container(
              height: hei * 0.067,
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
                    hintText: 'Enter any password',
                    hintStyle: TextStyle(fontSize: hei * 0.02),
                    // helperText: 'example: Abdul kalam',
                    labelStyle:
                        TextStyle(color: Colors.black, fontSize: hei * 0.018),
                    labelText: 'Password'),
              ),
            ),
            GestureDetector(
              onTap: () {
                _signUp(emailController, passwordController, nameController);
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
                  'Sign up',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: wid * 0.085, top: hei * 0.02),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin:
                        EdgeInsets.only(left: wid * 0.01, right: wid * 0.02),
                    height: hei * 0.01,
                    width: wid * 0.25,
                    decoration: const BoxDecoration(
                        // color: Colors.blue,
                        border: BorderDirectional(bottom: BorderSide())),
                  ),
                  Center(
                    child: Text(
                      'Have an account?',
                      style: TextStyle(fontSize: hei * 0.018),
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(left: wid * 0.01, right: wid * 0.02),
                    height: hei * 0.01,
                    width: wid * 0.25,
                    decoration: const BoxDecoration(
                        // color: Colors.blue,
                        border: BorderDirectional(bottom: BorderSide())),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                // margin: Ed,
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFF6EDD8A)),
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.only(
                    top: hei * 0.0, left: wid * 0.065, right: wid * 0.065),
                // color: Colors.blue,
                height: hei * 0.07,
                child: const Center(child: Text('Sign in')),
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

  Widget textField(
      {required TextEditingController controller,
      required String hintText,
      required IconData icon}) {
    return const SizedBox();
  }

  Future<void> _signUp(
      TextEditingController emailController,
      TextEditingController passwordController,
      TextEditingController nameController) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      )
          .whenComplete(() async {
        await storeFileToStorage(
                "profilePic/${FirebaseAuth.instance.currentUser!.uid}", image!)
            .then((value) {
          FirestoreServiceStudent().addStudent(
              name: nameController.text.trim(),
              email: emailController.text.trim(),
              upiId: upiIdController.text.trim(),
              profile: value,
              userId: FirebaseAuth.instance.currentUser!.uid);
        });
      });
      // .whenComplete(
      //   () => navigationpush(
      //     context: context,
      //     // widget: const App(),
      //     //TODO
      //     widget:  StartingPage()
      //   ),
      // );
      // Navigate to the home screen or display a success message
    } catch (e) {
      showSnackBar(context: context, content: e.toString());

      // Handle error, e.g., display an error message
    }
  }

  Future<String> storeFileToStorage(String ref, File file) async {
    UploadTask uploadTask = _firebaseStorage.ref().child(ref).putFile(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}

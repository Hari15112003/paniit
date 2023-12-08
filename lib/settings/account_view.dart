import 'package:flutter/material.dart';
import 'package:name/settings/edit_item.dart';

class ShowProfile extends StatefulWidget {
  const ShowProfile({super.key});

  @override
  State<ShowProfile> createState() => _ShowProfileState();
}

class _ShowProfileState extends State<ShowProfile> {
  @override
  Widget build(BuildContext context) {
    // final ap = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        leadingWidth: 80,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Profile",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40),
            EditItem(
              title: "Photo",
              widget: Column(children: [
                CircleAvatar(
                  // backgroundImage: NetworkImage(ap.userModel.profilePic),
                  radius: 50,
                ),
              ]),
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 20,
            ),
            EditItem(
              title: "Name",
              widget: TextField(
                readOnly: true,
                // decoration: InputDecoration(labelText: ap.userModel.name),
              ),
            ),
            SizedBox(height: 40),
            EditItem(
              title: "Gender",
              widget: TextField(
                readOnly: true,
                // decoration: InputDecoration(labelText: ap.userModel.gender),
              ),
            ),
            SizedBox(height: 40),
            EditItem(
              widget: TextField(
                readOnly: true,
                // decoration: InputDecoration(labelText: ap.userModel.age),
              ),
              title: "Age",
            ),
            SizedBox(height: 40),
            EditItem(
              widget: TextField(
                readOnly: true,
                // decoration: InputDecoration(labelText: ap.userModel.email),
              ),
              title: "Email",
            ),
            SizedBox(height: 40),
            EditItem(
              widget: TextField(
                  // decoration:
                  // InputDecoration(labelText: ap.userModel.phoneNumber),
                  // readOnly: true,
                  ),
              title: "Phone Number",
            ),
            SizedBox(height: 40),
            // CustomButton(
            //     text: "Sign out",
            //     onPressed: () {
            //       ap.userSignOut();
            //     })
          ]),
        ),
      ),
    );
  }
}

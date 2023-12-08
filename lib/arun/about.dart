import 'package:flutter/material.dart';

import '../utilities/topbar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    var hei = MediaQuery.of(context).size.height;
    var wid = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const TopBar(
              text: "Exit",
            ),
            Container(
                margin: EdgeInsets.only(top: hei * 0.05, left: wid * 0.05),
                height: hei * 0.07,
                child: Image.asset(
                  'assets/png/logo2.png',
                )),
            Container(
                margin: EdgeInsets.only(top: hei * 0.01, left: wid * 0.06),
                child: Text('LEARNING REVOLUTIONIZED')),
            Container(
                margin: EdgeInsets.only(left: wid * 0.06),
                child: Text('Earn as you Learn !')),
            Container(
              margin: EdgeInsets.only(top: hei * 0.03, left: wid * 0.06),
              child: Text(
                'Connect with us',
                style: TextStyle(
                    fontSize: hei * 0.025, fontWeight: FontWeight.bold),
              ),
            ),
            ContactUs(hei, wid, 'Harisharajan R R'),
            ContactUs(hei, wid, 'Shiva Prasath R'),
            ContactUs(hei, wid, 'Aruneshwar U S'),
            ContactUs(hei, wid, 'Ebishdon G V'),
            Container(
              margin: EdgeInsets.only(top: hei * 0.03, left: wid * 0.06),
              child: Text(
                'But why choose us?',
                style: TextStyle(
                    fontSize: hei * 0.025, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: wid * 0.06, vertical: hei * 0.015),
              padding: EdgeInsets.symmetric(
                  vertical: hei * 0.02, horizontal: wid * 0.06),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 76, 157, 175),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Text(
                'Elevate your knowledge, Enrich your skills and earn 50% back on every course - where education meets oppourtunity !',
                style: TextStyle(color: Colors.white, fontSize: hei * 0.021),
              )),
            ),
            Container(
              margin: EdgeInsets.only(top: hei * 0.03, left: wid * 0.06),
              child: Text(
                'Want to reach out to us?',
                style: TextStyle(
                    fontSize: hei * 0.025, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: wid * 0.06),
                child: Text('Drop a mail, we will get back to you')),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.green)),
              padding: EdgeInsets.symmetric(
                  horizontal: wid * 0.03, vertical: hei * 0.008),
              margin: EdgeInsets.only(
                  left: wid * 0.06,
                  top: hei * 0.03,
                  bottom: hei * 0.1,
                  right: wid * 0.06),
              child: Row(
                children: [
                  Container(
                    height: hei * 0.04,
                    child: Image.asset('assets/images/gmail.png'),
                  ),
                  SizedBox(
                    width: wid * 0.02,
                  ),
                  Container(
                    child: Text(
                      'Learn@gmail.com',
                      style: TextStyle(
                        fontSize: hei * 0.02,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: wid * 0.06),
              child: Text(
                'Developed with love by',
                style: TextStyle(
                    fontSize: hei * 0.025,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 76, 157, 175)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: wid * 0.06, bottom: hei * 0.06),
              child: Text(
                'Team AESIR',
                style: TextStyle(
                    fontSize: hei * 0.035, fontWeight: FontWeight.bold),
              ),
            )
          ]),
        ),
      ),
    );
  }

  Container ContactUs(
    double hei,
    double wid,
    String name,
  ) {
    return Container(
      margin: EdgeInsets.only(top: hei * 0.015, left: wid * 0.06),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 0, 0, 0),
              maxRadius: hei * 0.035,
              child: Center(child: Image.asset('assets/images/profile.png')),
              // backgroundImage: NetworkImage('images/profile.png'),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              margin: EdgeInsets.only(left: wid * 0.02),
              child: Text(
                name,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              // margin: EdgeInsets.only(left: wid * 0.35),
              height: hei * 0.04,
              child: Image.asset('assets/images/linkedin.png'),
            ),
          )
        ],
      ),
    );
  }
}

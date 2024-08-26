import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final List<String> myImageIcons = [
    "Images/google.webp",
    "Images/apple.jpg",
    "Images/Email.jpg"
  ];
  final List<String> myString = [
    "Continue With Google",
    "Continue With Apple",
    "Continue With Email"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.asset("Images/login.png"),
            const Text(
              "Explore the app",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Now your finances are in one place",
              style: TextStyle(fontSize: 18),
            ),
            const Text(
              "and always under control",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.blueGrey.shade50,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                          border: Border.all(color: Colors.blueGrey,width: 2),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                              backgroundImage: AssetImage(myImageIcons[index])),
                          title: Text(
                            myString[index],
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 20,
            ),
            RichText(
                text: const TextSpan(children: [
              TextSpan(
                  text: "Already have an Account? ",
                  style: TextStyle(color: Colors.blueGrey, fontSize: 18)),
              TextSpan(
                  text: "Log In",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black))
            ])),
          ],
        ),
      ),
    );
  }
}

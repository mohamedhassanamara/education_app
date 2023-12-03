import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'main_screen.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  DateTime selectedDate = DateTime.now(); // Add this line to store the selected date
  IconData selectedIcon = Icons.person; // Default icon
  String selectedIconName = 'Choose Avatar'; // Default name

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Sign up",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Create an Account",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[700],
                          ),
                        ),
                        SizedBox(height: 30)
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: [
                          makeInput(label: "Student Card Number"),
                          makeIconPicker(),
                          makeInput(label: "Email"),
                          makeInput(label: "Password", obscureText: true),
                          makeInput(label: "Confirm Password", obscureText: true)
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Container(
                        padding: EdgeInsets.only(top: 3, left: 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border(
                                bottom: BorderSide(color: Colors.black),
                                top: BorderSide(color: Colors.black),
                                right: BorderSide(color: Colors.black),
                                left: BorderSide(color: Colors.black))),
                        child: // Inside your _SignUpState class

                        MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: () {
                            // Navigate to the HomeScreen when the "Sign Up" button is pressed
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MainScreen()),
                            );
                          },
                          color: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),

                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account? "),
                        Text(
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget makeIconPicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Avatar",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 5),
        GestureDetector(
          onTap: () => _selectIcon(Icons.person),
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedIconName,
                  style: TextStyle(fontSize: 16),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  size: 30,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }


  Widget buildIconContainer(IconData icon, String name, String specifications) {
    return Column(
      children: [
        Icon(icon, size: 40),
        SizedBox(height: 5),
        Text(name, style: TextStyle(fontSize: 12)),
        SizedBox(height: 5),
        Text(specifications, style: TextStyle(fontSize: 10, color: Colors.grey)),
      ],
    );
  }

  void _selectIcon(IconData icon) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          width: MediaQuery.of(context).size.width ,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Choose Avatar",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Each avatar comes with unique abilities and characteristics.",
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),

              buildIconRow("assets/kitsune.png", "Kitsune", "Adaptable, Charismatic and Dynamic"),
              buildIconRow("assets/tora.png", "Tora", "High stress, Quick tempered and Impatient"),
              buildIconRow("assets/kuma.png", "Kuma", "Calm, Slow & Steady and Easy going"),

              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close the bottom sheet
                },
                child: Text("Close"),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildIconRow(String imagePath, String name, String specifications) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIcon = Icons.check;
          selectedIconName = name;
        });
        Navigator.pop(context); // Close the bottom sheet
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // Center the content
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Center the image and text
              children: [
                Image.asset(imagePath, width: 50, height: 50),
                SizedBox(width: 10),
                Text(
                  name,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 5),
            Text(
              specifications,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }


  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
}



Widget makeInput({String label="", bool obscureText = false, Widget? child}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black87,
        ),
      ),
      SizedBox(height: 5),
      if (child != null) ...[
        child, // If a custom child is provided, use it
      ] else ...[
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding:
            EdgeInsets.symmetric(vertical: 0, horizontal: 5),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey[400] ?? Colors.black,
              ),
            ),
            border: OutlineInputBorder(
              borderSide:
              BorderSide(color: Colors.grey[400] ?? Colors.black),
            ),
          ),
        ),
      ],
      SizedBox(height: 5),
    ],
  );
}


void main() {
  runApp(MaterialApp(
    home: SignUp(),
  ));
}

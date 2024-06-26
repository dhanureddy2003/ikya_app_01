import 'package:flutter/material.dart';
import 'package:ikya_app/components/buttons.dart';
import 'package:ikya_app/components/globals.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        decoration: myGradientDecoration,
        child: Stack(
          children: [
            // Main content
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Please Sign up to continue',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Your sign up fields here
                          Text(
                            "Username",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(height: 10),
                          InputField(hintText: 'Username', icon: Icons.person),
                          SizedBox(height: 20),
                          Text(
                            "Email",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(height: 10),
                          InputField(
                              hintText: "Enter your email", icon: Icons.email),
                          SizedBox(height: 20),
                          Text(
                            "DOB",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(height: 10),
                          InputField(
                              hintText: "Enter the date",
                              icon: Icons.date_range),
                          SizedBox(height: 20),
                          Text(
                            "Password",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(height: 10),
                          InputField(
                              hintText: "Enter your password",
                              icon: Icons.key,
                              isPassword: true),
                          SizedBox(height: 5),
                          PolicyAgreement(),
                          SizedBox(height: 5),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Color(0xFF5D80CC),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.0,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: SizedBox(
                                  width: screenWidth * 0.15,
                                  height: 2,
                                ),
                              ),
                              Text(
                                'Or Login with',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 22),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: SizedBox(
                                  width: screenWidth * 0.15,
                                  height: 2,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 24),
                          Center(
                            child: Image(
                              image: AssetImage('assets/images/Google.png'),
                            ),
                          ),
                          SizedBox(height: 22),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // AppBar
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                backgroundColor: Color.fromARGB(0, 51, 66, 69),
                elevation: 0,
                leading: IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ikya_app/components/globals.dart';
import 'package:ikya_app/pages/signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
            height: screenHeight, // Set container height to screen height
            decoration: myGradientDecoration,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: screenWidth < 400
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenWidth < 400
                      ? screenHeight * 0.015
                      : screenHeight * 0.1, // Adjusted height using screen height
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    'Please Sign in to continue',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: screenHeight * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Email",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: screenHeight *
                            0.01, // Adjusted height using screen height
                      ),
        
                      // Email field
                      InputField(
                        hintText: "Enter your email",
                        icon: Icons.email,
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      Text(
                        "Password",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: screenHeight *
                            0.01, // Adjusted height using screen height
                      ),
        
                      // password field
                      InputField(
                        hintText: "Enter your password",
                        icon: Icons.key,
                        isPassword: true,
                      ),
        
                      // forgot password
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot password?',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          style: ButtonStyle(
                            overlayColor: MaterialStateProperty.all(
                                Colors.transparent), // Remove the ripple effect
                            padding: MaterialStateProperty.all(
                                EdgeInsets.zero), // Remove padding
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),  
                      GlobalLoginButton(
                          buttonColor: Color(0xFF5D80CC),
                          buttonText: 'Login',
                          onPressed: (){},
                          ),
                          
                      SizedBox(
                        height: screenHeight * 0.05,
                      ),
        
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white, // Example background color
                              borderRadius: BorderRadius.circular(
                                  10), // Example border radius
                            ),
                            child: SizedBox(
                              width: screenWidth * 0.15,
                              height: 2,
                            ),
                          ),
                          Text(
                            'Or Login with',
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white, // Example background color
                              borderRadius: BorderRadius.circular(
                                  10), // Example border radius
                            ),
                            child: SizedBox(
                              width: screenWidth * 0.15,
                              height: 2,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      Center(
                        child: Image(
                          image: AssetImage('assets/images/Google.png'),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account ?",
                            style: TextStyle(color: Colors.white),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder:
                                      (context, animation, secondaryAnimation) =>
                                          SignUp(),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    var begin = Offset(1.0, 0.0);
                                    var end = Offset.zero;
                                    var curve = Curves.ease;
                                    var tween = Tween(begin: begin, end: end)
                                        .chain(CurveTween(curve: curve));
                                    var offsetAnimation = animation.drive(tween);
                                    return SlideTransition(
                                      position: offsetAnimation,
                                      child: child,
                                    );
                                  },
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: Color.fromARGB(18, 37, 43, 45),
                                ),
                            child: Text(
                              'Sign Up Now',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenHeight * 0.014),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ikya_app/components/bottomnavbar.dart';
import 'package:ikya_app/components/globals.dart';

class ProfilePage extends StatelessWidget {
  final String _username = 'Gowtham L';

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: GradientDecoration_2,
            child: Column(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: screenHeight * 0.05),
                
                      // PROFILE PHOTO
                      Stack(
                        children: [
                          ClipOval(
                            child: Container(
                              // Set the height of the profile photo
                              child: Image.asset(
                                'assets/images/image 4.png', // Replace with your image path
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 10,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(232, 249, 247, 247), // Background color of the icon container
                                borderRadius: BorderRadius.circular(20), // Rounded border radius
                              ),
                              child: IconButton(
                                icon: Icon(Icons.edit, size: 15),
                                onPressed: () {
                                  // Handle the onPressed event
                                  print('Edit icon pressed');
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                
                      SizedBox(height: screenHeight * 0.01),
                
                      // USERNAME
                      Text(
                        _username,
                        style: TextStyle(
                          fontSize: screenWidth * 0.08,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.03),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF333333),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45.0),
                        topRight: Radius.circular(45.0),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: screenHeight * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Personal Information',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      // ADD FUNCTION HERE
                                    },
                                    child: Text(
                                      'Edit',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline,
                                        decorationColor: Colors.blue,
                                        decorationThickness: screenHeight * 0.004,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          // EMAIL FIELD
                          CustomInputField(
                            leadingIcon: Icons.email,
                            hintText: 'Email',
                            email: 'dhanushreddy248@gmail.com',
                          ),
                          SizedBox(height: 5),
                          // NAME
                          CustomInputField(
                            leadingIcon: Icons.person,
                            hintText: 'Name',
                            email: 'Dhanush',
                          ),
                          SizedBox(height: 5),
                          // DOB
                          CustomInputField(
                            leadingIcon: Icons.calendar_month,
                            hintText: 'DOB',
                            email: '20/12/2024',
                          ),
                          SizedBox(height: 5),
                          // NUMBER
                          CustomInputField(
                            leadingIcon: Icons.phone,
                            hintText: 'Phone',
                            email: '9343934300',
                          ),
                          SizedBox(height: 15),
                          // LOGIN BUTTON
                          GlobalLoginButton(
                            buttonColor: Color(0xFF4267B8),
                            buttonText: 'Add Profile',
                            onPressed: () {},
                            iconData: Icons.add,
                          ),
                          SizedBox(height: screenHeight * 0.014),
                          // LOGOUT BUTTON
                          GlobalLoginButton(
                            buttonColor: Color(0xFFB84142),
                            buttonText: 'Logout',
                            onPressed: () {},
                            iconData: Icons.arrow_right_alt_rounded,
                          ),
                          SizedBox(height: screenHeight * 0.1),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 10,
            child: BottomNavBar(),
          ),
        ],
      ),
    );
  }
}

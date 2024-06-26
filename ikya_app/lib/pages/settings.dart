import 'package:flutter/material.dart';
import 'package:ikya_app/components/bottomnavbar.dart';
import 'package:ikya_app/components/buttons.dart';
import 'package:ikya_app/pages/faq.dart';
import 'package:ikya_app/pages/profile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    // double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: screenHeight,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(243, 33, 56, 61),
                  Color.fromARGB(255, 26, 32, 32),
                  Color.fromARGB(233, 24, 36, 40),
                ],
                stops: [0.17, 0.4, 0.7],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    AppBar(
                      title: Text('Settings'),
                      titleTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                      backgroundColor: Colors.transparent,
                      automaticallyImplyLeading: false,
                    ),
                    SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 15.0, left: 15.0, bottom: 15.0, right: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SettingsRow(
                            title: 'Account',
                            subtitle: 'Profile, name',
                            iconPath: 'assets/images/Account.png',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProfilePage()),
                              );
                            },
                          ),
                          SizedBox(height: 25),
                          SettingsRow(
                            title: 'Privacy',
                            subtitle: 'Block cookies',
                            iconPath: 'assets/images/privacy.png',
                            onTap: () {},
                          ),
                          SizedBox(height: 25),
                          SettingsRow(
                            title: 'Notifications',
                            subtitle: 'Sounds control',
                            iconPath: 'assets/images/notification.png',
                            onTap: () {},
                          ),
                          SizedBox(height: 25),
                          SettingsRow(
                            title: 'Policy',
                            subtitle: 'Terms & Conditions',
                            iconPath: 'assets/images/Policy.png',
                            onTap: () {},
                          ),
                          SizedBox(height: 25),
                          SettingsRow(
                            title: 'FAQ',
                            subtitle: 'Questions',
                            iconPath: 'assets/images/Faq.png',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FaqPage()),
                              );
                            },
                          ),
                          SizedBox(height: 25),
                          SettingsRow(
                            title: 'Contact Us',
                            subtitle: 'Mail support',
                            iconPath: 'assets/images/Contact Us.png',
                            onTap: () {
                              print('Contact Us tapped');
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // BOTTOM NAV BAR
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
import 'package:flutter/material.dart';
import 'package:ikya_app/components/bottomnavbar.dart';
import 'package:ikya_app/components/dropdown.dart';
import 'package:ikya_app/components/globals.dart';
import 'package:ikya_app/components/header.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    // Define a custom TextStyle for the mainText
    TextStyle mainTextStyle = TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w900,
      color: Colors.white,
    );

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: screenHeight,
            width: screenWidth,
            decoration: myGradientDecoration,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.06,
                    horizontal: screenWidth * 0.05),
                child: Column(
                  children: [
                    SizedBox(height: screenHeight * 0.075),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: screenHeight * 0.05,
                        width: screenWidth * 0.5,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(vertical: 10.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'search',
                            hintStyle: TextStyle(
                                color: Color.fromARGB(255, 93, 91, 91)),
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Icon(
                              Icons.search,
                              size: 16,
                              color: const Color.fromARGB(255, 87, 86, 86),
                            ),
                            suffixIcon: Icon(
                              Icons.close,
                              size: 16,
                              color: Color.fromARGB(255, 105, 104, 104),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Popular questions',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 104, 60, 149),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    QAList(),
                    SizedBox(height: screenHeight * 0.015),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'More',
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 104, 60, 149),
                              decoration: TextDecoration.underline,
                              decorationColor: Color.fromARGB(255, 104, 60, 149),
                              decorationThickness: screenHeight * 0.002),
                        ),
                        Icon(Icons.chevron_right, color: Colors.white, size: 20),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 12,
            left: 0,
            right: 0,
            child: Header(
              mainText: 'FAQ',
              image: AssetImage('assets/images/customer service.png'),
              isShowButton: true,
              mainTextStyle: mainTextStyle,
              sizedBoxWidth: 10.0,
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
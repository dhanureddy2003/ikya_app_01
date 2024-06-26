import 'package:flutter/material.dart';
import 'package:ikya_app/pages/dailyStats.dart';

class EnergyUsed extends StatelessWidget {
  final String Text1;
  final String Text2;
  final String Text3;
  final String Text4;
  final IconData icon;
  final bool showBackButton; 
  final bool enableOnTap;

  const EnergyUsed({
    super.key,
    required this.Text1,
    required this.Text2,
    required this.Text3,
    required this.Text4,
    required this.icon,
    this.showBackButton = true, 
    required this.enableOnTap,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenHeight * 0.1,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(10.0), // Adjust the radius as needed
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // First Column
          Row(
            children: [
              Icon(
                icon,
                size: screenWidth * 0.08,
              ),
              SizedBox(
                width: 1,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    Text1,
                    style: TextStyle(
                      color: Color.fromARGB(219, 81, 82, 87),
                      fontWeight: FontWeight.bold,
                      fontSize: screenHeight * 0.018,
                    ),
                  ),
                  Text(
                    Text2,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: screenHeight * 0.025,
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Vertical Divider
          Center(
            child: Container(
              width: 4,
              decoration: BoxDecoration(
                color: Color.fromARGB(82, 82, 81, 81),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SizedBox(
                height: screenHeight * 0.075,
              ),
            ),
          ),

          // Second Column
          if (showBackButton) // Conditionally show the back button
            GestureDetector(
             onTap: enableOnTap
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DailyStats()),
                      );
                    }
                  : null,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Row(
                  children: [
                    Icon(
                      icon,
                      size: screenWidth * 0.08,
                    ),
                    SizedBox(
                      width: 1,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          Text3,
                          style: TextStyle(
                            color: Color.fromARGB(219, 80, 81, 86),
                            fontWeight: FontWeight.bold,
                            fontSize: screenHeight * 0.018,
                          ),
                        ),
                        Text(
                          Text4,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: screenHeight * 0.025,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// SECOND COMPONENT

class EnergyUsed2 extends StatelessWidget {
  final String Text1;
  final String Text2;
  final String Text3;
  final String Text4;
  final IconData icon;
 

  const EnergyUsed2({
    super.key,
    required this.Text1,
    required this.Text2,
    required this.Text3,
    required this.Text4,
    required this.icon,
    
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenHeight * 0.09,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(10.0), // Adjust the radius as needed
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // First Column
          Row(
            children: [
              Icon(
                icon,
                size: screenWidth * 0.08,
              ),
              SizedBox(
                width: 1,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    Text1,
                    style: TextStyle(
                      color: Color.fromARGB(219, 58, 58, 59),
                      fontWeight: FontWeight.bold,
                      fontSize: screenHeight * 0.015,
                    ),
                  ),
                  Text(
                    Text2,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: screenHeight * 0.025,
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Vertical Divider
          Center(
            child: Container(
              width: 4,
              decoration: BoxDecoration(
                color: Color.fromARGB(82, 82, 81, 81),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SizedBox(
                height: screenHeight * 0.075,
              ),
            ),
          ),

          // Second Column
            Row(
              children: [
                Icon(
                  icon,
                  size: screenWidth * 0.08,
                ),
                SizedBox(
                  width: 1,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      Text3,
                      style: TextStyle(
                      color: Color.fromARGB(219, 58, 58, 59),
                        fontWeight: FontWeight.bold,
                        fontSize: screenHeight * 0.015,
                      ),
                    ),
                    Text(
                      Text4,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: screenHeight * 0.025,
                      ),
                    ),
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }
}


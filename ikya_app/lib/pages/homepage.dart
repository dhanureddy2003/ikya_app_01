import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:ikya_app/components/bottomnavbar.dart';
import 'package:ikya_app/components/energy.dart';
import 'package:ikya_app/components/globals.dart';
import 'package:ikya_app/components/header.dart';
import 'dart:async';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../components/dropdown.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String fetchDate;
  late String fetchTime;
  final PageController _controller = PageController();
  final List<String> _imageUrls = [
    'assets/images/Rectangle 21.png',
    'assets/images/Rectangle 21.png',
    'assets/images/Rectangle 21.png',
    'assets/images/Rectangle 21.png',
  ];
  double _currentPage = 0;

  void updateTime() {
    setState(() {
      // Fetch current date and time
      DateTime now = DateTime.now();
      fetchDate = '${now.year}/${now.month}/${now.day}';
      fetchTime =
          '${now.hour < 10 ? '0${now.hour}' : now.hour}:${now.minute < 10 ? '0${now.minute}' : now.minute}';
    });
  }

  @override
  void initState() {
    super.initState();

    updateTime();
    Timer.periodic(Duration(seconds: 1), (timer) {
      updateTime();
    });

    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height:screenHeight ,
            width:screenWidth ,
            decoration: myGradientDecoration,
            child: SingleChildScrollView(
              
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.06,
                    horizontal: screenWidth * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    SizedBox(height: screenHeight * 0.075),

                    // List view Images
                    Container(
                      height:
                          screenHeight * 0.19, // Adjust the height as needed
                      child: PageView.builder(
                        controller: _controller,
                        itemCount: _imageUrls.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Image.asset(
                              _imageUrls[index],
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: DotsIndicator(
                        dotsCount: _imageUrls.length,
                        position: _currentPage.round(),
                        decorator: DotsDecorator(
                          size: const Size.square(5.0),
                          activeSize: const Size(10.0, 5.0),
                          activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),

                    // Live Data
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Live Data',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 25),
                          ),
                          SizedBox(height: screenHeight * 0.025),

                          // weather and battery percentage
                          Container(
                            height: screenHeight * 0.16,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    // First container properties
                                    margin: EdgeInsets.all(
                                        5.0), // adjust margin as needed
                                    decoration: BoxDecoration(
                                      color: Color(0xFF0A423B),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    // Content of the first container
                                    child: Column(
                                      children: [
                                        Expanded(
                                          flex: 7, // Takes up 80% of the height
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex:
                                                    6, // Takes up 70% of the width
                                                child: Image.asset(
                                                  'assets/images/Cloudy Day.png',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Expanded(
                                                flex:
                                                    4, // Takes up 70% of the width
                                                child: Center(
                                                  child: Text(
                                                    '38°', // Displaying 38 degree symbol
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize:
                                                          25, // Adjust font size as needed
                                                      color: Colors
                                                          .white, // Example color, change as needed
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3, // Takes up 20% of the height
                                          child: Center(
                                            child: Text(
                                              'Condition: Sunny', // Displaying the condition
                                              style: TextStyle(
                                                fontSize:
                                                    14, // Adjust font size as needed
                                                color: Colors
                                                    .white, // Example color, change as needed
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    // Second container properties
                                    margin: EdgeInsets.all(
                                        5.0), // adjust margin as needed
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                    // Content of the second container
                                    child: Column(
                                      children: [
                                        Expanded(
                                          flex: 8, // Takes up 80% of the height
                                          child: Center(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: CircularPercentIndicator(
                                                radius: 45.0,
                                                lineWidth: 5.0,
                                                percent: 0.75,
                                                center: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .center,
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .battery_charging_full,
                                                      color: Colors.black,
                                                      size: 20,
                                                    ),
                                                    Text(
                                                      "Charging",
                                                      style: TextStyle(
                                                          color: Colors.red,
                                                          fontSize: 10),
                                                    ),
                                                    Text(
                                                      "75%",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20),
                                                    ),
                                                  ],
                                                ),
                                                progressColor: Colors.blue,
                                                backgroundColor: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2, // Takes up 20% of the height
                                          child: Container(
                                            child: Center(
                                              child: Text(
                                                'Remaining: 1h:30min', // Displaying the remaining time
                                                style: TextStyle(
                                                  fontSize:
                                                      12, // Adjust font size as needed
                                                  color: Colors
                                                      .black, // Example color, change as needed
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: screenHeight * 0.020),

                          // Date and time
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF3D4D50),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Today, ',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(fetchDate,
                                      style: TextStyle(color: Colors.white)),
                                  SizedBox(
                                    width: screenWidth * 0.03,
                                  ),
                                  Text(fetchTime,
                                      style: TextStyle(color: Colors.white))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.020),

                          // energy used
                          EnergyUsed(
                            Text1: 'Today usage',
                            Text2: '15Kwh',
                            Text3: 'Total data of today',
                            Text4: '150Kwh',
                            icon: Icons.bolt,
                            enableOnTap: true,
                          ),
                          SizedBox(
                            height: screenHeight * 0.015,
                          ),

                          // DROPDOWN MENU

                          DropDown(),

                          // data products
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '5.21',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 35),
                                      ),
                                      Text(
                                        'kWh',
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Data Products',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        '  +1.2%',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Center(
                                child: Container(
                                  child: SizedBox(
                                    height: screenHeight * 0.08,
                                    width: 3,
                                  ),
                                  color: Colors.white,
                                ),
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.currency_rupee,
                                          color: Colors.white),
                                      Text(
                                        '12',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 25),
                                      )
                                    ],
                                  ),
                                  Text(
                                    'Money Saved',
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.05),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Positioned Header
          Positioned(
            top: 12,
            left: 0,
            right: 0,
            child: Header(
              mainText: 'Hello, Gowtham',
              subText: "Let's make earth green",
              image: AssetImage('assets/images/Notifications.png'),
              isShowButton: false,
            ),
          ),
          // Fixed BottomNavBar
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

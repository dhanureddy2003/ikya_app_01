import 'package:flutter/material.dart';
import 'package:ikya_app/components/barChart.dart';
import 'package:ikya_app/components/bottomNavBar.dart';
import 'package:ikya_app/components/energy.dart';
import 'package:ikya_app/components/globals.dart';
import 'package:ikya_app/components/header.dart';
import 'package:ikya_app/components/lineChart.dart';

class DailyStats extends StatefulWidget {
  DailyStats({super.key});

  @override
  State<DailyStats> createState() => _DailyStatsState();
}

class _DailyStatsState extends State<DailyStats> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    int _MoneySaved = 5600;
    int _TotalSaved = 23000;
    return Scaffold(
      body: Stack(
        children: [
          // Background content
          Positioned.fill(
            child: Container(
              height: screenHeight,
              decoration: myGradientDecoration,
              child: SingleChildScrollView(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.06,
                        horizontal: screenWidth * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: screenHeight * 0.08),

                        // TAB BAR
                        DefaultTabController(
                          length: 3,
                          child: Column(
                            children: [
                              Material(
                                color: Color(0xFF1E4355),
                                borderRadius: BorderRadius.circular(30),
                                child: Container(
                                  height: 55,
                                  child: TabBar(
                                    physics: ClampingScrollPhysics(),
                                    padding: EdgeInsets.only(
                                        top: 10,
                                        left: 10,
                                        bottom: 10,
                                        right: 10),
                                    indicatorSize: TabBarIndicatorSize.label,
                                    dividerColor: Colors.transparent,
                                    indicator: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.white,
                                    ),
                                    splashBorderRadius:
                                        BorderRadius.circular(40),
                                    indicatorPadding: EdgeInsets.zero,
                                    unselectedLabelColor: Colors.white,
                                    labelColor: Colors.black,
                                    tabs: [
                                      Tab(
                                        child: Container(
                                          height: 35,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "Daily",
                                            ),
                                          ),
                                        ),
                                      ),
                                      Tab(
                                        child: Container(
                                          height: 35,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "Weekly",
                                            ),
                                          ),
                                        ),
                                      ),
                                      Tab(
                                        child: Container(
                                          height: 35,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "Months",
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: screenHeight * 0.30,
                                color: Colors.transparent,
                                child: TabBarView(
                                  children: [
                                    // Daily Tab: Line Chart
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: LineChartSample(),
                                      ),
                                    ),
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: BarChartSampleWithDays(),
                                      ),
                                    ),
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: BarChartSampleWithMonths(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        // ENERGY USED
                        EnergyUsed2(
                          Text1: 'Average Data of today',
                          Text2: '15Kwh',
                          Text3: 'Total data of today',
                          Text4: '150Kwh',
                          icon: Icons.bolt,
                        ),

                        SizedBox(height: screenHeight * 0.03),

                        // STATISTICS
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Statistics",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            ),
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFF4267B8),
                                    shape: BoxShape.circle,
                                  ),
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.share,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: screenWidth * 0.03,
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      shape: BoxShape.circle,
                                    ),
                                    padding: EdgeInsets.all(5.0),
                                    child: Image.asset(
                                        'assets/images/Download.png',height: 30,)),
                              ],
                            )
                          ],
                        ),

                        SizedBox(
                          height: screenHeight * 0.02,
                        ),

                        // Money and battery status
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: screenHeight * 0.2,
                              width: screenWidth * 0.4,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(209, 236, 237, 225),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Money Saved today',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 14,
                                            )),
                                      ],
                                    ),
                                    SizedBox(height: screenHeight * 0.01),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.currency_rupee,size: 30,),
                                        Text(
                                          _MoneySaved.toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30),
                                        ),
                                        Image.asset('assets/images/Coins.png',)
                                        
                                      ],
                                    ),
                                    SizedBox(height: screenHeight * 0.007),
                                    Text(
                                      'This month total saved',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    SizedBox(height: screenHeight * 0.005),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.currency_rupee,size: 17,),
                                        Text(
                                          _TotalSaved.toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17),
                                        ),
                                        Image.asset('assets/images/Coins.png',height: 15,)
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: screenHeight * 0.2,
                              width: screenWidth * 0.4,
                              decoration: BoxDecoration(
                                color: Color(0xFF7AE85F),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Battery status of',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15),
                                        ),
                                        Text(
                                          'a day',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15),
                                        ),
                                        SmallBarChartBatteryStatus()
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),

                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        // Adding extra padding to avoid overlap with BottomNavBar
                        SizedBox(height: screenHeight * 0.1),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          // AppBar overlay
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: Header(
              mainText: 'Electricity Generated',
              subText: "Your Today's report",
              image: AssetImage('assets/images/Calendar.png'),
              isShowButton: true,
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

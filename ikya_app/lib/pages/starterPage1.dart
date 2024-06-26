import 'package:flutter/material.dart';

class StarterPage extends StatelessWidget {
  const StarterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(218, 71, 81, 79), // Initial color at the top-left
              Color.fromARGB(223, 90, 93, 92), // Initial color at the top-left
              Color.fromARGB(224, 60, 78, 73), // Initial color at the top-left
              Color.fromARGB(248, 3, 3, 3),   // Dark color for the bottom-right
            ],
            stops: [0.0, 0.1,0.15,0.25], // Define stops for smooth transition
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              Image.asset('assets/images/logo 2.png')
            ],),
            SizedBox(height: 35),
            Center(
              child: Image.asset('assets/images/bigstock-Solar-Panels-On-A-Gable-Roof-477481471-Photoroom 1.png'),
            ),
            SizedBox(height: 20,),
            Text('AI POWERED BY',style: TextStyle(color: Colors.white,fontSize: 30),textAlign: TextAlign.center,),
            Text('IKYA',style: TextStyle(color: Colors.white,fontSize: 30),textAlign: TextAlign.center,),
            Text('ON EARTH',style: TextStyle(color: Colors.white,fontSize: 30),textAlign: TextAlign.center,)

          ],),
        ),
      ),

    );
  }
}

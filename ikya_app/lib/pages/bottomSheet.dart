import 'package:flutter/material.dart';
import 'package:ikya_app/pages/camScanner.dart';
// import 'package:ikya_app/components/camera_access.dart';
import 'package:ikya_app/components/globals.dart';

class BottomSheetPage extends StatefulWidget {
  const BottomSheetPage({Key? key}) : super(key: key);

  @override
  _BottomSheetPageState createState() => _BottomSheetPageState();
}

class _BottomSheetPageState extends State<BottomSheetPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible:
            false, // Set to false to make the bottom sheet non-dismissable
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(70.0),
            topRight: Radius.circular(70.0),
          ),
        ),
        builder: (context) {
          return Container(
            child: SizedBox(
              child: Container(
                height: 650,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFF232F32),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(70.0),
                    topRight: Radius.circular(70.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      color: Colors.white,
                      child: SizedBox(
                        height: 3,
                        width: 100,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Scan QR code',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'please place QR inside the frame to scan',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    Text(
                      'please avoid shaking to get result',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CameraPage()),
                        );
                      },
                      child: Container(
                        height:
                            300, // Set the desired height of the container here
                        child: Image.asset(
                          'assets/images/Qr Code.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Text(
                      'Scanning Code...',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: myGradientDecoration,
      ),
    );
  }
}
import 'package:flutter/material.dart';
// import 'package:ikya_app/components/buttons.dart';
import 'package:ikya_app/main.dart';
import 'package:ikya_app/pages/settings.dart';
import 'package:provider/provider.dart';
// import 'package:ikya_app/pages/dailyStats.dart';
import 'package:ikya_app/pages/homepage.dart';
import 'package:ikya_app/pages/profile.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyProviderClass>(
      builder: (context, provider, _) => Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width * 0.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            color: Color.fromARGB(255, 11, 29, 32),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildNavBarIcon(context, Icons.home, 0, provider.selectedIndex),
              buildNavBarIcon(context, Icons.person, 1, provider.selectedIndex),
              buildNavBarIcon(
                  context, Icons.settings, 2, provider.selectedIndex),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNavBarIcon(
      BuildContext context, IconData iconData, int index, int selectedIndex) {
    return GestureDetector(
      onTap: () {
        Provider.of<MyProviderClass>(context, listen: false).selectedIndex =
            index;
        navigateToPage(context, index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            color: selectedIndex == index ? Colors.white : Colors.grey,
            size: 35,
          ),
          if (selectedIndex == index)
            ClipRRect(
              borderRadius:
                  BorderRadius.circular(20), // Adjust this value as needed
              child: Container(
                width: 20, // Adjusted width based on the icon size
                height: 3,
                color: Colors.white, // Customize the color of the underline
              ),
            ),
        ],
      ),
    );
  }

  void navigateToPage(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SettingsPage()),
        );
        break;
      default:
        break;
    }
  }
}

import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String mainText;
  final String? subText;
  final ImageProvider image;
  final bool isShowButton;
  final TextStyle? mainTextStyle;
  final double? sizedBoxWidth; // Add this line

  Header({
    required this.mainText,
    this.subText,
    required this.image,
    required this.isShowButton,
    this.mainTextStyle,
    this.sizedBoxWidth, // Add this line
  });

  @override
  Widget build(BuildContext context) {
    // double screenHeight = MediaQuery.of(context).size.height;
    // double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (sizedBoxWidth != null)
                  SizedBox(width: sizedBoxWidth!), // Add this line
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mainText,
                      style: mainTextStyle ??
                          TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                    ),
                    if (subText != null)
                      Text(
                        subText!,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                  ],
                ),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image(image: image),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (isShowButton)
          Positioned(
            left: -10,
            top: 35,
            child: IconButton(
              icon: Icon(Icons.chevron_left, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
      ],
    );
  }
}

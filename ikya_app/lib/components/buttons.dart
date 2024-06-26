import 'package:flutter/material.dart';

class PolicyAgreement extends StatefulWidget {
  @override
  _PolicyAgreementState createState() => _PolicyAgreementState();
}

class _PolicyAgreementState extends State<PolicyAgreement> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Checkbox(
          value: _isChecked,
          onChanged: (value) {
            setState(() {
              _isChecked = value!;
            });
          },
        ),
        Text(
          'Agree to our policy',
          style: TextStyle(
            color: Colors.white,
            decoration: TextDecoration.underline,
            decorationColor: Colors.blue,
            decorationThickness: 3
          ),
        ),
      ],
    );
  }
}




class SettingsRow extends StatelessWidget {
  final String title;
  final String subtitle;
  final String iconPath;
  final VoidCallback onTap;

  const SettingsRow({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.iconPath,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.transparent, padding: EdgeInsets.zero,
        backgroundColor: Colors.transparent, // No splash color
      ),
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image(image: AssetImage(iconPath)),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(subtitle, style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

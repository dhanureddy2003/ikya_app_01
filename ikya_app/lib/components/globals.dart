import 'package:flutter/material.dart';
// background color
final BoxDecoration myGradientDecoration = BoxDecoration(
    gradient: LinearGradient(
  colors: [
    Color(0xff3a4e53),
    Color(0xff23292a),
    Color(0xff222b2b),
    Color(0xff263235)
  ],
  stops: [0, 0.25, 0.58, 1],
  begin: Alignment(0.7, -0.8),
  end: Alignment(-0.7, 0.8),
));
final BoxDecoration GradientDecoration_2 = BoxDecoration(
  gradient: LinearGradient(
    colors: [
      Color.fromARGB(243, 52, 89, 92),
      Color.fromARGB(255, 30, 40, 41),
      Color.fromARGB(233, 28, 39, 43),
    ],
    stops: [0, 0.35, 1],
    begin: Alignment.topRight,
    end: Alignment.bottomCenter,
  ),
);
// text field

class InputField extends StatefulWidget {
  final IconData icon;
  final String hintText;
  final bool isPassword;

  const InputField({
    Key? key,
    required this.icon,
    required this.hintText,
    this.isPassword = false,
  }) : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFF3D4D50),
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Colors.grey),
        prefixIcon: Icon(widget.icon, color: Colors.white),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
      ),
      obscureText: widget.isPassword ? _obscureText : false,
    );
  }
}

class CustomInputField extends StatelessWidget {
  final IconData leadingIcon;
  final String hintText;
  final String email;

  const CustomInputField({
    Key? key,
    required this.leadingIcon,
    required this.hintText,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF31393B),
          borderRadius: BorderRadius.circular(20.0),
          
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.email,color: Colors.white,),
              SizedBox(width: 4),
              Text(hintText,style: TextStyle(color: Colors.white),),
              Spacer(),
              Text(email,style: TextStyle(color: const Color.fromARGB(155, 255, 255, 255))),
            ],
          ),
        ),
      ),
    );
  }
}

class GlobalLoginButton extends StatelessWidget {

  
  final Color buttonColor;
  final String buttonText;
  final VoidCallback onPressed;
  final IconData? iconData; // New parameter for the icon

  const GlobalLoginButton({
    Key? key,
    required this.buttonColor,
    required this.buttonText,
    required this.onPressed,
    this.iconData, // Initialize the iconData parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 250,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: TextButton(
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                buttonText,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(width: 8),
              if (iconData != null) // Conditionally display the icon if provided
                Icon(iconData, color: Colors.white),
              if (iconData != null)SizedBox(width: 8) // Add space if icon is provided    
            ],
          ),
        ),
      ),
    );
  }
}

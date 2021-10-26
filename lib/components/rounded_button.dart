import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Color buttonColor;
  final Function() onClick;
  final String buttonText;

  const RoundedButton({
    required this.buttonText,
    required this.buttonColor,
    required this.onClick,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: buttonColor,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: onClick,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            buttonText,
          ),
        ),
      ),
    );
  }
}

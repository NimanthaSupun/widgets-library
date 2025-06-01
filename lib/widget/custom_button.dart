import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final String title;
  final VoidCallback onpresed;
  const CustomButton({
    super.key,
    required this.width,
    required this.title,
    required this.onpresed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        width: width,
        height: 50,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.lightBlueAccent],
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: TextButton(
            onPressed: onpresed,
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

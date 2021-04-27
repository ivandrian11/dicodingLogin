import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  final Color color;
  final Widget child;

  ReusableButton({required this.color, required this.child});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: color),
      onPressed: () {},
      child: child,
    );
  }
}

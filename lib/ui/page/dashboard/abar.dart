import 'package:flutter/material.dart';

class ABar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: new BoxConstraints.expand(
        width: double.infinity,
        height: 10.0,
      ),
      color: Colors.purple,
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 50.0),
      child: Text('IAMABAR')
    );
  }
}
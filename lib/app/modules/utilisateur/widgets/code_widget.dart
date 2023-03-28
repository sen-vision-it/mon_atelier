import 'package:flutter/material.dart';

class CodeWidget extends StatelessWidget {
  final String title;
  const CodeWidget({Key? key, this.title = "CodeWidget"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Text(title));
  }
}
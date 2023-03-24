import 'package:flutter/material.dart';

class DetailClientWidget extends StatelessWidget {
  final String title;
  const DetailClientWidget({Key? key, this.title = "DetailClientWidget"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Text(title));
  }
}
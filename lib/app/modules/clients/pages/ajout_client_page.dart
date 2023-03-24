import 'package:flutter/material.dart';

class AjoutClientPage extends StatefulWidget {
  final String title;
  const AjoutClientPage({Key? key, this.title = 'AjoutClientPage'}) : super(key: key);
  @override
  AjoutClientPageState createState() => AjoutClientPageState();
}
class AjoutClientPageState extends State<AjoutClientPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
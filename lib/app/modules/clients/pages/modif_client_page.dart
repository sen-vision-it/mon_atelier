import 'package:flutter/material.dart';

class ModifClientPage extends StatefulWidget {
  final String title;
  const ModifClientPage({Key? key, this.title = 'ModifClientPage'}) : super(key: key);
  @override
  ModifClientPageState createState() => ModifClientPageState();
}
class ModifClientPageState extends State<ModifClientPage> {
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
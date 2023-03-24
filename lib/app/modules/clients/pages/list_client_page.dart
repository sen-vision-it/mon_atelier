import 'package:flutter/material.dart';

class ListClientPage extends StatefulWidget {
  final String title;
  const ListClientPage({Key? key, this.title = 'ListClientPage'}) : super(key: key);
  @override
  ListClientPageState createState() => ListClientPageState();
}
class ListClientPageState extends State<ListClientPage> {
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
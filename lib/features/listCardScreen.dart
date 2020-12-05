import 'package:flutter/material.dart';
import 'package:awesome_card/awesome_card.dart';
class ListCardScreen extends StatefulWidget {
  @override
  _ListCardScreenState createState() => _ListCardScreenState();
}

class _ListCardScreenState extends State<ListCardScreen> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
          child: Scaffold(
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(),
            ),
          )
      ),
    );
  }
}
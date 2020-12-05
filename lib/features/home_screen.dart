import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_final_exam/features/listCardScreen.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String barcode = '';
  Uint8List bytes = Uint8List(200);
  bool showButtom = false;
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return SafeArea(
        child: Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                fit: StackFit.loose,
                alignment: Alignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/image1.png'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                  ),
                  Column(
                    children: [
                      Text('Digital',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 42,
                              fontStyle: FontStyle.italic)),
                      Text('wallet',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 42,
                              fontStyle: FontStyle.italic)),
                    ],
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black12),
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    Container(
                      child: Text(
                        "Balance",
                        style: TextStyle(fontSize: 25),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 80,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Rp.76.547.000,-',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            width: 200,
                            height: 200,
                            child: Image.memory(bytes),
                          ),
                          Text('RESULT  $barcode'),

                          RaisedButton(onPressed: _scan, child: Text("Scan")),
                        ],
                      ),
                    ),
                    showButtom
                        ? GestureDetector(
                            child: Container(
                              alignment: Alignment.center,
                              height: 65,
                              width: MediaQuery.of(context).size.width * 0.9,
                              decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Text(
                                'TOP UP',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: Colors.white),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ListCardScreen()));
                            },
                          )
                        : Container(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  Future _scan() async {
    String barcode = await scanner.scan();
    setState(() => this.barcode = barcode);
    if(this.barcode.length > 1){
      showButtom = true;
    }
  }
}

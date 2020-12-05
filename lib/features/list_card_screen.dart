import 'package:flutter/material.dart';
import 'package:awesome_card/awesome_card.dart';
import 'package:flutter_final_exam/features/home_screen.dart';
import 'package:flutter_final_exam/features/new_card_screen.dart';
import 'package:flutter_final_exam/model/item_card.dart';

class ListCardScreen extends StatefulWidget {
  @override
  _ListCardScreenState createState() => _ListCardScreenState();
}

class _ListCardScreenState extends State<ListCardScreen> {

  List<ItemCard> cards;

  @override
  void initState() {
    cards = new List<ItemCard>();
    cards.add(new ItemCard(name: 'MasterCard',imagePath: 'image10'));
    cards.add(new ItemCard(name: 'Visa',imagePath: 'image11'));
    cards.add(new ItemCard(name: 'JCB',imagePath: 'image12'));
    cards.add(new ItemCard(name: 'American Express',imagePath: 'image13'));
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
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
                              image: AssetImage('assets/images/image9.png'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                    ),
                    Column(
                      children: [
                        Text('Credit',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 42,
                                fontStyle: FontStyle.italic)),
                        Text('Card',
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
                      SizedBox(height: 20),
                      ListView.separated(
                        itemCount: cards.length,
                        separatorBuilder: (context, i) => const Divider(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, i) {
                          return ItemCardModel(
                              name: cards[i].name,
                              imagePath: cards[i].imagePath);
                        },
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        child: Container(
                          alignment: Alignment.center,
                          height: 65,
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text(
                            'ADD CARD',
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
                                  builder: (context) => NewCardScreen()));
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}

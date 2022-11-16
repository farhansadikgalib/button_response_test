import 'package:flutter/material.dart';

class cards extends StatefulWidget {
  const cards({Key? key}) : super(key: key);

  @override
  State<cards> createState() => _cardsState();
}

class _cardsState extends State<cards> {
  String selectedCard = '1';

  @override
  Widget build(BuildContext context) {
    final List<dynamic> tabOptionsList = [
      {"id": "1", "text": "A options"},
      {"id": "2", "text": "B options"},
      {"id": "3", "text": "C options"}
    ];

    final selectedTabValue = tabOptionsList
        .where((element) => element['id'] == selectedCard)
        .toList()[0]['text'];

    print(selectedTabValue);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cards"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                optionCards("A", "assets/icons/recycle.png", context, "1"),
                optionCards("B", "assets/icons/tools.png", context, "2"),
                optionCards("C", "assets/icons/file.png", context, "3"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              selectedTabValue,
              style: const TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  Widget optionCards(
      String text, String assetImage, BuildContext context, String cardId) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCard = cardId;
        });
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: ShapeDecoration(
          color: cardId == selectedCard ? Colors.green : Colors.grey,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 13),
                child: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.file_copy),
                ),
              ),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'CeraPro',
                  color: Color.fromRGBO(0, 0, 0, 1),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

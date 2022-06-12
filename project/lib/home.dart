import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> chat = [];
  TextEditingController chatNameText = TextEditingController();
  @override
  removeChat(i) {
    setState(() {
      chat.removeAt(i);
    });
  }

  addItem() {
    setState(() {
      chat.add(chatNameText.text);
      chatNameText.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: TextField(
              controller: chatNameText,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                addItem();
              },
              child: Text("Add Item")),
          Expanded(
            child: ListView.builder(
              itemCount: chat.length,
              itemBuilder: ((context, index) {
                return ListTile(
                    tileColor: Colors.brown,
                    title: Text(chat[index]),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(children: [
                        IconButton(
                          onPressed: () {
                            removeChat(index);
                          },
                          icon: Icon(Icons.delete),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              chat[index] = "Abcd";
                            });
                          },
                          icon: Icon(Icons.edit),
                        ),
                      ]),
                    ));
              }),
            ),
          ),
        ],
      ),
    ));
  }
}

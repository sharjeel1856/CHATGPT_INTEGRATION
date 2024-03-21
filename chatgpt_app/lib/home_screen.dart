import 'package:chatgpt_app/chat_widget.dart';
import 'package:chatgpt_app/constants.dart';
import 'package:chatgpt_app/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final bool isTyping = true;

  late TextEditingController textEditingController;
  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        leading: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Image(
              image: AssetImage('assets/images/openai_logo.jpg'),
            ) // Adjust path accordingly
            ),
        title: Text("ChatGPT"),
        actions: [
          IconButton(
              onPressed: () async {
                await Services.showModalSheet(context: context);
              },
              icon: Icon(
                Icons.more_vert_rounded,
                color: Colors.white,
              )),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return ChatWidget(
                      msg: chatMessages[index]["msg"].toString(),
                      chatIndex: int.parse(
                        chatMessages[index]["chatIndex"].toString(),
                      ),
                    );
                  }),
            ),
            if (isTyping) ...[
              SpinKitThreeBounce(
                color: Colors.white,
                size: 18,
              ),
              SizedBox(
                height: 15,
              ),
              Material(
                color: cardColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          controller: textEditingController,
                          onSubmitted: (value) {
                            //To send message
                          },
                          decoration: const InputDecoration.collapsed(
                              hintText: "How can i help you ?",
                              hintStyle: TextStyle(color: Colors.grey)),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ]
          ],
        ),
        // Adjust path accordingly
      ),
    );
  }
}

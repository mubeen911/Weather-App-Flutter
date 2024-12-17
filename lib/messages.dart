import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swipe_to/swipe_to.dart';

class Messages extends StatefulWidget {
  final String userName;
  final String userImage;

  const Messages({required this.userName, required this.userImage, super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  late FocusNode textFieldFocusNode = FocusNode();
  late TextEditingController textFieldController = TextEditingController();
  final List<Map<String, String>> messages = [
    {"sender": "me", "message": "Hello! How are you?", "time": "10:00 AM"},
    {
      "sender": "user",
      "message": "I'm good, thanks! How about you?",
      "time": "10:01 AM"
    },
    {
      "sender": "me",
      "message": "Doing well, just working on some projects, well there is.",
      "time": "10:02 AM"
    },
    {
      "sender": "user",
      "message": "That sounds interesting!",
      "time": "10:03 AM"
    },
    {"sender": "me", "message": "Yeah, I'm enjoying it.", "time": "10:04 AM"},
  ];

  Map<String, String>? replyMessage;

  void onSwipeToReply(Map<String, String> message) {
    setState(() {
      replyMessage = message;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      textFieldFocusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 120, 61, 246),
            Color.fromARGB(255, 179, 152, 239),
          ]),
        ),
        child: Column(
          children: [
            const SizedBox(height: 60),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  const SizedBox(width: 10),
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(widget.userImage),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.userName,
                        style:
                            const TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "online",
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Icon(Icons.phone, color: Colors.white),
                  const SizedBox(width: 15),
                  const Icon(Icons.more_vert, color: Colors.white),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    final isMe = message["sender"] == "me";
                    return SwipeTo(
                      key: UniqueKey(),
                      onRightSwipe: (details) {
                        onSwipeToReply(message);
                      },
                      onLeftSwipe: (details) {},
                      child: Column(
                        crossAxisAlignment: isMe
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            decoration: BoxDecoration(
                              color: isMe
                                  ? const Color.fromARGB(255, 179, 152, 239)
                                  : Colors.grey[300],
                              borderRadius: BorderRadius.only(
                                topLeft: isMe
                                    ? const Radius.circular(20)
                                    : Radius.zero,
                                topRight: isMe
                                    ? Radius.zero
                                    : const Radius.circular(20),
                                bottomLeft: const Radius.circular(20),
                                bottomRight: const Radius.circular(20),
                              ),
                            ),
                            child: Text(
                              message["message"]!,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                              ),
                              softWrap: true,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                          Text(
                            message['time']!,
                            style: const TextStyle(fontSize: 10),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            if (replyMessage != null)
              Container(
                color: Colors.grey[200],
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Row(
                  children: [
                    const Icon(Icons.reply, color: Colors.green),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Replying to: ${replyMessage!["message"]}',
                        style: const TextStyle(
                          color: Colors.black87,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.black),
                      onPressed: () {
                        setState(() {
                          replyMessage = null;
                          textFieldFocusNode.unfocus();
                        });
                      },
                    ),
                  ],
                ),
              ),
            Container(
              color: Colors.white,
              height: 1,
            ),
            Container(
              height: 60,
              color: Colors.grey[300],
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      focusNode: textFieldFocusNode,
                      controller: textFieldController,
                      decoration: const InputDecoration(
                        hintText: 'Type a message',
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      ),
                      maxLines: null, // Allows unlimited lines
                      keyboardType: TextInputType.multiline,
                    ),
                  ),
                  IconButton(
                      icon: const Icon(CupertinoIcons.link, color: Colors.grey),
                      onPressed: () {}),
                  IconButton(
                    icon: const Icon(Icons.keyboard_voice_sharp,
                        color: Colors.grey),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.send, color: Colors.green),
                    onPressed: () {
                      setState(() {
                        replyMessage = null;
                        textFieldFocusNode.unfocus();
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              height: 2,
            ),
          ],
        ),
      ),
    );
  }
}

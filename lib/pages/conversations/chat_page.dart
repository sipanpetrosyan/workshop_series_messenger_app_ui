import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {

  String title;

  ChatPage(this.title);
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          resizeToAvoidBottomPadding: true,
          appBar: _appBar(),
          body: _body(),
        ),
      ),
    );
  }

  _appBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(56),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 2),
              color: Colors.grey[300],
              blurRadius: 2,
            ),
          ],
        ),
        height: 56,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                padding: EdgeInsets.all(6),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.blue,
                  size: 35,
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10, left: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset(
                    "assets/user_avatar.png",
                    width: 40,
                    height: 40,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Daniel Eklund",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Active now",
                      style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(6),
                child: Icon(
                  Icons.call,
                  color: Colors.blue,
                  size: 25,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(6),
                child: Icon(
                  Icons.video_call,
                  color: Colors.blue,
                  size: 25,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(6),
                child: Icon(
                  Icons.error,
                  color: Colors.blue,
                  size: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _body() {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
            padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
            itemCount: 50,
            itemBuilder: (context, index) {
              if (index % 2 == 0) {
                return _messageItemForCurrentUser(index);
              } else {
                return _messageItemForSecondUser(index);
              }
            },
          ),
        ),
        _bottomNavigationBar(),
      ],
    );
  }

  _messageItemForCurrentUser(int index) {
    return Row(
      children: [
        Spacer(),
        Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.65,
          ),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(30),
          ),
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Text(
            "Message $index",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  _messageItemForSecondUser(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 13),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.asset(
              "assets/user_avatar.png",
              width: 40,
              height: 40,
            ),
          ),
          Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.65,
              ),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                "Message $index",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          Spacer(),
        ],
      ),
    );
  }

  _bottomNavigationBar() {
    return Container(
      height: 56,
      color: Colors.white,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(6),
              child: Icon(
                Icons.more_vert,
                color: Colors.blue,
                size: 27,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(6),
              child: Icon(
                Icons.camera_alt,
                color: Colors.blue,
                size: 27,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(6),
              child: Icon(
                Icons.image,
                color: Colors.blue,
                size: 27,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(6),
              child: Icon(
                Icons.mic,
                color: Colors.blue,
                size: 27,
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 7),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(27),
                child: TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      border: InputBorder.none,
                      suffixIcon: Container(
                        // padding: EdgeInsets.all(10),
                        child: Icon(
                          Icons.emoji_emotions,
                          color: Colors.blue,
                          size: 27,
                        ),
                      ),
                      hintText: "Aa"),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(6),
              child: Icon(
                Icons.thumb_up,
                color: Colors.blue,
                size: 27,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

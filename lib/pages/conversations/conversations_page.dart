import 'package:flutter/material.dart';
import 'package:messenger_app/pages/conversations/chat_page.dart';

class ConversationsPage extends StatefulWidget {
  @override
  _ConversationsPageState createState() => _ConversationsPageState();
}

class _ConversationsPageState extends State<ConversationsPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
          child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: _appBar(),
          body: _body(),
        ),
      ),
    );
  }

  Widget _appBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(50),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(
                "assets/user_avatar.png",
                width: 45,
                height: 45,
              ),
            ),
            Text("Chats",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                )),
            Spacer(),
            Container(
              margin: EdgeInsets.only(right: 15),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(60),
              ),
              child: Icon(
                Icons.camera_alt,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(60),
              ),
              child: Icon(
                Icons.edit,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      border: InputBorder.none,
                      prefixIcon: Container(
                        // padding: EdgeInsets.all(10),
                        child: Icon(
                          Icons.search,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      hintText: "Search"),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
              alignment: Alignment.centerLeft,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: (context, itemIndex) {
                  return _userStoryItemWidget(
                    itemIndex,
                    hasBorder: (itemIndex % 2) == 0,
                  );
                },
              ),
            ),
            _conversationItem(isRead: true),
            _conversationItem(isRead: false),
            _conversationItem(isRead: true),
            _conversationItem(isRead: true),
            _conversationItem(isRead: true),
            _conversationItem(isRead: true),
            _conversationItem(isRead: true),
            _conversationItem(isRead: true),
            _conversationItem(isRead: true),
            _conversationItem(isRead: true),
          ],
        ),
      ),
    );
  }

  Widget _userStoryItemWidget(int index, {bool hasBorder}) {
    return Center(
      child: Container(
        width: 55,
        height: 55,
        margin: index == 0
            ? EdgeInsets.only(left: 15, right: 15)
            : EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: hasBorder
              ? Border.all(
                  width: 3,
                  color: Colors.blue,
                )
              : null,
        ),
        child: Image.asset("assets/user_avatar.png"),
      ),
    );
  }

  Widget _conversationItem({bool isRead}) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return ChatPage("Chat page");
            },
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 9),
        child: Row(
          children: [
            Container(
              width: 55,
              height: 55,
              margin: EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Image.asset("assets/user_avatar.png"),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "User name",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Last message",
                  style: TextStyle(
                    color: isRead ? Colors.grey : Colors.black,
                  ),
                ),
              ],
            ),
            Spacer(),
            isRead
                ? Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey[400],
                    ),
                    child: Icon(
                      Icons.check,
                      size: 15,
                      color: Colors.white,
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.all(2.5),
                    child: Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blue,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

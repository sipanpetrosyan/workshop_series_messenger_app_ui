import 'package:flutter/material.dart';

class PeoplePage extends StatefulWidget {
  @override
  _PeoplePageState createState() => _PeoplePageState();
}

class _PeoplePageState extends State<PeoplePage> {
  List<Map<String, dynamic>> usersStoryData = [
    {
      "image": "assets/story_1.jpg",
      "avatar_image": "assets/avatar_5.jpeg",
      "user_name": "Mia Reynolds",
      "seen": true,
    },
    {
      "image": "assets/story_2.jpeg",
      "avatar_image": "assets/avatar_4.jpeg",
      "user_name": "Loredana Crisan",
      "seen": true,
    },
    {
      "image": "assets/story_3.jpeg",
      "avatar_image": "assets/avatar_3.jpeg",
      "user_name": "Brendan Aronoff",
      "seen": false,
    },
    {
      "image": "assets/story_4.jpeg",
      "avatar_image": "assets/avatar_2.jpg",
      "user_name": "Alex Ristevski",
      "seen": false,
    },
    {
      "image": "assets/story_5.jpg",
      "avatar_image": "assets/avatar_1.png",
      "user_name": "Justin Smith",
      "seen": false,
    },
    {
      "image": "assets/story_6.jpg",
      "avatar_image": "assets/avatar_6.jpg",
      "user_name": "Juliana Liang",
      "seen": false,
    }
  ];

  List<Map<String, dynamic>> userFirendsData = [
    {
      "avatar_image": "assets/avatar_5.jpeg",
      "user_name": "Mia Reynolds",
      "online": true,
    },
    {
      "avatar_image": "assets/avatar_4.jpeg",
      "user_name": "Loredana Crisan",
      "online": true,
    },
    {
      "avatar_image": "assets/avatar_3.jpeg",
      "user_name": "Brendan Aronoff",
      "online": false,
    },
    {
      "avatar_image": "assets/avatar_2.jpg",
      "user_name": "Alex Ristevski",
      "online": false,
    },
    {
      "avatar_image": "assets/avatar_1.png",
      "user_name": "Justin Smith",
      "online": false,
    },
    {
      "avatar_image": "assets/avatar_6.jpg",
      "user_name": "Juliana Liang",
      "online": false,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
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
            Text(
              "People",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(60),
              ),
              child: Icon(
                Icons.person_add,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _body() {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
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
            _usersStoryList(),
            _userFirendsList(),
          ],
        ),
      ),
    );
  }

  Widget _usersStoryList() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 170,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: usersStoryData.length,
        itemBuilder: (context, index) {
          return _userStoryItem(usersStoryData[index], index: index);
        },
      ),
    );
  }

  Widget _userStoryItem(Map<String, dynamic> storyData, {int index}) {
    return Container(
      width: 110,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(left: index == 0 ? 20 : 0, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(storyData['image']),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 45,
            height: 45,
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  image: AssetImage(
                    storyData['avatar_image'],
                  ),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  width: 3,
                  color: storyData["seen"] ? Colors.white : Colors.blue,
                )),
          ),
          Text(
            storyData['user_name'],
            maxLines: 2,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _userFirendsList() {
    List<Widget> friendItemsWidgets = [];

    // userFirendsData.forEach((friendData) {
    //   friendItemsWidgets.add(_friendItem(friendData));
    // });

    // for (var i = 0; i < userFirendsData.length; i++) {
    //         friendItemsWidgets.add(_friendItem(userFirendsData[i]));

    // }

    // for (Map<String, dynamic> friendData in userFirendsData) {
    //   friendItemsWidgets.add(_friendItem(friendData));
    // }

    return Column(
      children: userFirendsData.map<Widget>((friendData) => _friendItem(friendData)).toList(),
    );
  }

  Widget _friendItem(Map<String, dynamic> friendData) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 25, 20, 0),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 15),
            width: 55,
            height: 52,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        image: AssetImage(
                          friendData['avatar_image'],
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    height: 25,
                    width: 25,
                    color: Colors.white,
                    padding: EdgeInsets.all(5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            friendData['user_name'],
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(60),
            ),
            child: Icon(
              Icons.pan_tool,
            ),
          ),
        ],
      ),
    );
  }
}

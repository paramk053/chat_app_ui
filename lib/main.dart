import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        drawerTheme: const DrawerThemeData(
          scrimColor: Colors.transparent,
        ),
      ),
      title: 'Baatcheet',
      home: MyHomePage(
        title: '',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _globalkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalkey,
      backgroundColor: const Color(0xFF171717),
      body: Stack(
        //Stack is used to build layer of Another Widgets
        //here layering on the scaffold of the GREEN SCREEN
        children: [
          //For Header Menu, Search & ListView(Messages,Online,Groups)
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70, left: 5, right: 5),
                child: Row(
                  //For Menu And Search
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          _globalkey.currentState!.openDrawer();
                        },
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        )),
                  ],
                ),
              ),

              // For List view(Messages, Online, Groups)
              SizedBox(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 10),
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Messages",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        )),
                    const SizedBox(
                      width: 35,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Online",
                        style: TextStyle(color: Colors.grey, fontSize: 30),
                      ),
                    ),
                    const SizedBox(
                      width: 35,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Groups",
                          style: TextStyle(color: Colors.grey, fontSize: 30),
                        )),
                    const SizedBox(
                      width: 35,
                    ),
                  ],
                ),
              ),
            ],
          ),

          //For Green layer Of chats in the Stack
          Positioned(
            top: 190,
            left: 0,
            right: 0,
            child: Container(
                padding: const EdgeInsets.only(top: 15, left: 25, right: 25),
                height: 220,
                decoration: const BoxDecoration(
                    color: Color(0xFF00BA9E),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Column(
                  //For header(Favourite contacts and ...) and avatar
                  children: [
                    Row(
                      //For Favourite contacts and ...
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Favourite contacts",
                          style: TextStyle(color: Colors.white),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.more_horiz,
                              color: Colors.white,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 90,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          buildContactAvatar('Aliana', 'img1.jpeg'),
                          buildContactAvatar('July', 'img2.jpeg'),
                          buildContactAvatar('Mikle', 'img3.jpeg'),
                          buildContactAvatar('Kler', 'img4.jpg'),
                          buildContactAvatar('Moane', 'img5.jpeg'),
                          buildContactAvatar('Julie', 'img6.jpeg'),
                          buildContactAvatar('Allen', 'img7.jpeg'),
                          buildContactAvatar('John', 'img8.jpg'),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
          Positioned(
            top: 365,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
                color: Colors.white,
              ),
              child: ListView(
                padding: const EdgeInsets.only(left: 25),
                children: [
                  buildConversatioRow(
                      'Laura', 'Hello,how are you', 'img1.jpeg', 0),
                  buildConversatioRow(
                      'Kalya', 'Will you visit me', 'img2.jpeg', 2),
                  buildConversatioRow('Mary', 'I ate your...', 'img3.jpeg', 6),
                  buildConversatioRow(
                      'Hellen', 'Are you with Kayla again', 'img5.jpeg', 0),
                  buildConversatioRow(
                      'Louren', 'Borrow money please', 'img6.jpeg', 3),
                  buildConversatioRow('Tom', 'Hey, whatsup', 'img7.jpeg', 0),
                  buildConversatioRow(
                      'Laura', 'Hello,how are you', 'img1.jpeg', 0),
                  buildConversatioRow(
                      'Laura', 'Hello,how are you', 'img1.jpeg', 0),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: SizedBox(
        height: 80,
        width: 65,
        child: FloatingActionButton(
          backgroundColor: Color(0xFF00BA9E),
          child: Icon(Icons.edit_outlined, size: 30),
          onPressed: () {},
        ),
      ),
      drawer: Drawer(
        width: 275,
        backgroundColor: Colors.black26,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(right: Radius.circular(40))),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xF71F1E1E),
            borderRadius: BorderRadius.horizontal(right: Radius.circular(40)),
            boxShadow: [
              BoxShadow(
                color: Color(0XFF711F1E1E),
              )
            ],
          ),
          child: const Padding(
            padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 20,
                        ),
                        SizedBox(
                          width: 56,
                        ),
                        Text(
                          'Settings',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        UserAvatar(filename: 'img3.jpeg'),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          'Tom Brenan',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    DrawerItem(title: 'Account', icon: Icons.key),
                    DrawerItem(title: 'Chats', icon: Icons.chat_bubble),
                    DrawerItem(
                        title: 'Notifications', icon: Icons.notifications),
                    DrawerItem(title: 'Data and Storage', icon: Icons.storage),
                    DrawerItem(title: 'Help', icon: Icons.help),
                    Divider(
                      color: Colors.green,
                      height: 35,
                    ),
                    DrawerItem(title: 'Invite Friend', icon: Icons.people),
                  ],
                ),
                DrawerItem(title: 'Log out', icon: Icons.logout),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column buildConversatioRow(
      String name, String message, String filename, int msgCount) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                UserAvatar(filename: filename),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(color: Colors.black),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      message,
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25, top: 5),
              child: Column(
                children: [
                  const Text(
                    '16:35',
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  const SizedBox(height: 15),
                  if (msgCount > 0)
                    CircleAvatar(
                      radius: 7,
                      backgroundColor: Color(0xFF32C0A9),
                      child: Text(
                        msgCount.toString(),
                        style:
                            const TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    )
                ],
              ),
            )
          ],
        ),
        const Divider(
          indent: 70,
        ),
      ],
    );
  }

  Padding buildContactAvatar(String name, String filename) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        children: [
          UserAvatar(filename: filename),
          const SizedBox(
            height: 5,
          ),
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  const DrawerItem({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(
              width: 56,
            ),
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class UserAvatar extends StatelessWidget {
  final String filename;
  const UserAvatar({
    super.key,
    required this.filename,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 32,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 29,
        backgroundImage:
            Image.asset('assets/images/contact_images/$filename').image,
      ),
    );
  }
}

import 'package:badges/badges.dart';
import 'package:facebook_messenger/pages/theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:provider/provider.dart';

class MessengerPage extends StatefulWidget {
  static const String id = "messenger_page";

  const MessengerPage({Key? key}) : super(key: key);

  @override
  _MessengerPageState createState() => _MessengerPageState();
}

class _MessengerPageState extends State<MessengerPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(builder: (BuildContext context,  ThemeModel themeNotifier, Widget? child) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: Container(
            margin: const EdgeInsets.only(left: 15),
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage("assets/images/Profile.png"))),
          ),
          title: const Text(
            "Chats",
            style: TextStyle(
                letterSpacing: 1,
                fontSize: 30,
                fontWeight: FontWeight.w600),
          ),
          actions: [
            GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                width: 40,
                height: 40,
                child: SvgPicture.asset('assets/icons/camera.svg', color: Theme.of(context).colorScheme.secondary),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.secondaryVariant),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                themeNotifier.isDark
                    ? themeNotifier.isDark = false
                    : themeNotifier.isDark = true;
              },
              child: Container(
                alignment: Alignment.center,
                width: 40,
                height: 40,
                child: SvgPicture.asset("assets/icons/message.svg", color: Theme.of(context).colorScheme.secondary),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.secondaryVariant
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // #search
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width*0.9,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    isCollapsed: true,
                    contentPadding: EdgeInsets.zero,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15)),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.secondaryVariant,
                    hintText: "Search",
                    hintStyle: const TextStyle(fontSize: 17, color: Color(0xff8E8E93)),
                    prefixIcon:
                    const Icon(CupertinoIcons.search, color: Colors.grey),
                  ),
                ),
              ),

              // #stories
              Container(
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                padding: const EdgeInsets.symmetric(vertical: 14),
                height: 111,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: SizedBox(
                        width: 75,
                        child: Column(
                          children: [
                            CircleAvatar(
                              child: Icon(
                                Icons.add,
                                color: themeNotifier.isDark?Colors.white:Colors.black,
                                size: 35,
                              ),
                              backgroundColor: Theme.of(context).colorScheme.secondaryVariant,
                              radius: 26,
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            const Text(
                              "Your story",
                              style: TextStyle(
                                  fontSize: 13,),
                            )
                          ],
                        ),
                      ),
                    ),
                    _stories("assets/images/Joshua.png", "Joshua", true),
                    _stories("assets/images/Martin.png", "Martin", true),
                    _stories("assets/images/Karen.png", "Karen", true),
                    _stories("assets/images/Martha.png", "Martha", false),
                    _stories("assets/images/adele.jpg", "Adele", true),
                    _stories("assets/images/soul.jpg", "Sylvester", false),
                    _stories("assets/images/Flare.jpg", "Lara", true),
                    _stories("assets/images/Samuel.jpg", "Samuel", false),
                  ],
                ),
              ),

              // #chats
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _chats(
                      "assets/images/Martin.png",
                      "Martin Randolph",
                      "You: What's man!",
                      "9:40 AM",
                      const Icon(Icons.circle_outlined)),
                  _chats(
                      "assets/images/Andrew.png",
                      "Andrew Parker",
                      "You: Ok, thanks!",
                      "9:25 AM",
                      const Icon(Icons.check_circle_outline)),
                  _chats(
                      "assets/images/Karen.png",
                      "Karen Castillo",
                      "You: Ok, See you in To...",
                      "Fri",
                      const Icon(Icons.check_circle_outline)),
                  _chats(
                      "assets/images/Maisy.png",
                      "Maisy Humphrey",
                      "Have a good day, Maisy!",
                      "Fri",
                      const Icon(Icons.check_circle_outline)),
                  _chats(
                      "assets/images/Joshua.png",
                      "Joshua Lawrence",
                      "The business plan loo...",
                      "Thu",
                      const Icon(Icons.circle_outlined)),
                  ListTile(
                    leading: Image.asset(
                      "assets/images/Pixsellz.png",
                      height: 60,
                      width: 60,
                    ),
                    title: Row(
                      children: [
                        const Text(
                          "Pixsellz",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 22,
                          height: 15,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.onSecondary,
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: const Text("Ad", style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),),
                        )
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Make design process easier...",
                          style: TextStyle(
                              fontSize: 15),
                        ),
                        GestureDetector(
                            child: const Text(
                              "View more",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5),
                            )),
                      ],
                    ),
                    trailing: Image.asset("assets/images/Rectangle.png",
                        height: 60, width: 60),
                  ),
                  _chats(
                      "assets/images/adele.jpg",
                      "Adele Laurie",
                      "Have a good rest, Selena!",
                      "Wed",
                      const Icon(Icons.check_circle_outline)),
                  _chats(
                      "assets/images/male.jpg",
                      "Michael Page",
                      "It was the best day!",
                      "Wed",
                      const Icon(Icons.check_circle_outline)),
                  _chats(
                      "assets/images/artsy.jpg",
                      "Jazmin Stewart",
                      "What's up, Doc?",
                      "Tue",
                      const Icon(Icons.circle_outlined)),
                  _chats(
                      "assets/images/soul.jpg",
                      "Sylvester Jackson",
                      "Flutter team finished the project",
                      "Tue",
                      const Icon(Icons.check_circle_outline)),
                  _chats(
                      "assets/images/Flare.jpg",
                      "Lara Croft",
                      "You: How are you?",
                      "Mon",
                      const Icon(Icons.circle_outlined)),
                ],
              )
            ],
          ),
        ),
        bottomNavigationBar: GlassmorphicContainer(
          linearGradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.black.withOpacity(0.01),
                Colors.black.withOpacity(0.05),
                const Color(0xFFffffff).withOpacity(0),
              ],
              stops: const [
                0,
                0,
                1,
              ]),
          borderGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFFffffff).withOpacity(0.5),
              const Color(0xFFFFFFFF).withOpacity(0.5),
            ],
          ),
          borderRadius: 0,
          border: 0,
          blur: 30,
          width: 0,
          height: MediaQuery.of(context).size.height*0.08,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 67),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BottomNavigationBar(
                  onTap: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  currentIndex: _currentIndex,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  type: BottomNavigationBarType.fixed,
                  items: [
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset("assets/icons/Tab1.svg", color: _currentIndex==0?Theme.of(context).colorScheme.onSurface:Theme.of(context).colorScheme.onError),
                        title: Container()),
                    BottomNavigationBarItem(
                        icon: Badge(
                          position: BadgePosition.topEnd(
                              top: -12,
                              end: -9
                          ),
                          elevation: 0,
                          badgeColor: const Color(0xff5AD439).withOpacity(0.16),
                          badgeContent: const Text(
                            '2',
                            style: TextStyle(
                                color: Color(0xff5AD439),
                                fontWeight: FontWeight.bold),
                          ),
                          child: SvgPicture.asset("assets/icons/Tab2.svg",  color: _currentIndex==1?Theme.of(context).colorScheme.onSurface:Theme.of(context).colorScheme.onError),
                        ),
                        title:Container()),
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset("assets/icons/Tab3.svg",  color: _currentIndex==2?Theme.of(context).colorScheme.onSurface:Theme.of(context).colorScheme.onError),
                        title: Container()),
                  ],
                ),
                Container(
                  width: 134,
                  height: 5,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(10)),
                )
              ],
            ),
          ),
        ),
      );
    },);
  }

  Widget _stories(String image, String name, bool isOnline) {
    return SizedBox(
      width: 75,
      child: GestureDetector(
        onTap: () {},
        child: Column(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(image),
                  radius: 26,
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  height: 52,
                  width: 53,
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).colorScheme.onBackground,
                        border: Border.all(color:Theme.of(context).colorScheme.onBackground, width: 1)),
                    child: Icon(Icons.circle,
                        size: 15,
                        color:
                            isOnline ? const Color(0xff5AD439) : Colors.grey),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 7,
            ),
            Flexible(
                child: Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 13),
              maxLines: 1,
              softWrap: false,
              overflow: TextOverflow.fade,
            )),
          ],
        ),
      ),
    );
  }

  Widget _chats(
      String image, String name, String message, String time, Icon icon) {
    return Slidable(
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                width: 40,
                height: 40,
                child: SvgPicture.asset(
                  'assets/icons/camera.svg',
                  color: Colors.white,
                ),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.blue),
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  width: 40,
                  height: 40,
                  child: SvgPicture.asset('assets/icons/Call.svg',  color: Theme.of(context).colorScheme.secondary),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.secondaryVariant),
                ),
              )),
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                width: 40,
                height: 40,
                child: SvgPicture.asset('assets/icons/video.svg',  color: Theme.of(context).colorScheme.secondary),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.secondaryVariant),
              ),
            ),
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                width: 40,
                height: 40,
                child: SvgPicture.asset('assets/icons/menu.svg',  color: Theme.of(context).colorScheme.secondary),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.secondaryVariant),
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  width: 40,
                  height: 40,
                  child: SvgPicture.asset('assets/icons/notif.svg', color: Theme.of(context).colorScheme.secondary,),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.secondaryVariant),
                ),
              )),
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                width: 40,
                height: 40,
                child: SvgPicture.asset('assets/icons/basket.svg'),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xffFE294D)),
              ),
            ),
          ),
        ],
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(image),
          radius: 30,
        ),
        title: Text(
          name,
          style: const TextStyle(
              fontSize: 17, fontWeight: FontWeight.w600, letterSpacing: 0.5),
        ),
        subtitle: Row(
          children: [
            Flexible(
                flex: 2,
                child: Text(
                  message,
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  softWrap: false,
                  style: const TextStyle(
                      fontSize: 15,),
                )),
            Flexible(
                flex: 1,
                child: Text(
                  " " + String.fromCharCode(0x00B7) + " " + time,
                  style: const TextStyle(
                      fontSize: 14,),
                ))
          ],
        ),
        trailing: icon,
      ),
    );
  }
}

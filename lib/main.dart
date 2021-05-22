import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:robert_son_proje/yemek.dart';
import 'asya.dart';
import 'fransız.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(1080, 1920),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Projem',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> drawerKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: drawerKey,
        drawer: Drawer(
          child: drawerOlustur(),
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 15.0,
            ),
            header(),
            SizedBox(
              height: 10,
            ),
            TabBarr()
          ],
        ));
  }

  Widget header() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 15.0, left: 5.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      drawerKey.currentState.openDrawer();
                    }),
                Container(
                    width: 50.w, height: 50.h, child: Icon(Icons.favorite))
              ],
            ),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 15),
              child: Text(
                "Favori Yemekler",
                style: TextStyle(fontFamily: "PlayfairDisplay", fontSize: 45),
              ),
            )
          ],
        )
      ],
    );
  }

  drawerOlustur() {
    return Container();
  }
}

class TabBarr extends StatefulWidget {
  @override
  _TabBarrState createState() => _TabBarrState();
}

class _TabBarrState extends State<TabBarr> with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: tabController,
          indicatorColor: Colors.brown.shade200,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.black,
          isScrollable: true,
          tabs: <Widget>[
            Tab(
              child: Text(
                "Popüler",
                style: TextStyle(fontFamily: "PlayfairDisplay", fontSize: 15),
              ),
            ),
            Tab(
              child: Text(
                "Asya Mutfağı",
                style: TextStyle(fontFamily: "PlayfairDisplay", fontSize: 15),
              ),
            ),
            Tab(
              child: Text(
                "Fransız Mutfağı",
                style: TextStyle(fontFamily: "PlayfairDisplay", fontSize: 15),
              ),
            ),
            Tab(
              child: Text(
                "Türk Mutfağı",
                style: TextStyle(fontFamily: "PlayfairDisplay", fontSize: 15),
              ),
            )
          ],
        ),
        Container(
          height: MediaQuery.of(context).size.height - 200,
          child: TabBarView(
            controller: tabController,
            children: [
              YemekListe(),
              AsyaListe(),
              Fransiz(),
              YemekListe(),
            ],
          ),
        )
      ],
    );
  }
}

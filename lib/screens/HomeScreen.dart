import 'dart:io';

import 'package:flutter/material.dart';
import 'package:trading_helper/screens/FibonacciScreen.dart';
import 'package:trading_helper/screens/PullbackCalculation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        key: _scaffoldKey,
        drawer: drawerWidget(),
        appBar: appbarWidget(),
        body: tabbarWidget(),
      ),
    );
  }


  AppBar appbarWidget() {
    return AppBar(
      title: const Text('Trading Helper'),
      bottom: const TabBar(
        isScrollable: true,
        tabs: <Widget>[
          Tab(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(Icons.add),
              SizedBox(
                width: 5,
              ),
              Text("Pullback Forecasting", style: TextStyle(overflow: TextOverflow.ellipsis),),
            ]),
          ),
          Tab(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(Icons.text_fields),
              SizedBox(
                width: 5,
              ),
              Text("Fibonacci Retracement"),
            ]),
          ),
        ],
      ),
    );
  }

  Widget tabbarWidget() {
    return const TabBarView(
      children: <Widget>[
        Center(
          child: PullbackCalculation(),
        ),
        Center(
          child: FibonacciScreen(),
        )
      ],
    );
  }

  Widget logoWidget() {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(80))),
          child: Image.asset(
            "assets/images/tradeicon.png",
            height: 90,
            width: 90,
          ),
        ),
        const Text(
          "Trading Helper",
          style: TextStyle(
              color: Colors.green, fontWeight: FontWeight.w700, fontSize: 20),
        ),
        const Text(
          "[Governemet Registered NBFC Company]",
          style: TextStyle(color: Colors.green, fontSize: 14),
        ),
        const Text(
          "[An ISO 9008:2015 Certified]",
          style: TextStyle(color: Colors.green, fontSize: 14),
        )
      ],
    );
  }

  Widget drawerWidget() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: SingleChildScrollView(child: logoWidget()),
          ),
          ListTile(
            title: const Text(
              "Exit App",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            leading: const Icon(Icons.exit_to_app),
            onTap: () {
              exit(0);
            },
          )
        ],
      ),
    );
  }

}
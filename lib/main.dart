import 'package:calculator_frontend/CapitalGainsTax.dart';
import 'package:calculator_frontend/HoldingTax.dart';
import 'package:calculator_frontend/widgets/LargeText.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final List<String> bar = ["양도소득세", "보유세"];
  final mainColor = 0xff80cfd5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: bar.length,
          child: NestedScrollView(
            physics: NeverScrollableScrollPhysics(),
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                    expandedHeight: 90,
                    pinned: false,
                    backgroundColor: Color(mainColor),
                    title: Padding(
                      padding: const EdgeInsets.only(top: 20, left: 15),
                      child: LargeText(text: '세금 계산기'),
                    )),
                SliverPersistentHeader(
                    pinned: true, delegate: TabBarDelegate(bar: bar))
              ];
            },
            body: const TabBarView(
              children: [CapitalGainsTaxPage(), HoldingTaxPage()],
            ),
          ),
        ),
      ),
    );
  }
}

class TabBarDelegate extends SliverPersistentHeaderDelegate {
  const TabBarDelegate({Key? key, required this.bar});

  final List<String> bar;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return Container(
      child: TabBar(
        tabs: bar
            .map((e) => Tab(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(e),
                  ),
                ))
            .toList(),
        indicatorWeight: 2,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        unselectedLabelColor: Colors.grey,
        labelColor: Colors.black,
        indicatorColor: Colors.black,
        indicatorSize: TabBarIndicatorSize.label,
      ),
    );
  }

  @override
  double get maxExtent => 48;

  @override
  double get minExtent => 48;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}

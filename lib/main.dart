import 'package:calculator_frontend/CapitalGainsTax.dart';
import 'package:calculator_frontend/HoldingTax.dart';
import 'package:calculator_frontend/resume_CapitalGainsTax.dart';
import 'package:calculator_frontend/widgets/LargeText.dart';
import 'package:calculator_frontend/widgets/NavigationBox.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TAXAI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'TAXAI Home Page'),
      routes: {
        '/row1col1': (context) => CapitalGainsTaxPage(),
        '/row1col2': (context) => HoldingTaxPage()
      },
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
  final mainColor = 0xff80cfd5;
  late double widget_width;
  late double widget_height;

  @override
  Widget build(BuildContext context) {
    widget_width = MediaQuery.of(context).size.width;
    widget_height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding:
            EdgeInsets.only(left: widget_width * .1, right: widget_width * .1),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 70,
              ),
              LargeText(
                text: 'AI 세금 계산',
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NavigationBox(
                      pushNamed: '/row1col1',
                      title_1: '양도소득세',
                      title_2: 'AI 판단 계산기'),
                  NavigationBox(
                      pushNamed: '/row1col2',
                      title_1: '보유세(종부세, 재산세)',
                      title_2: 'AI 판단 계산기'),
                  NavigationBox(
                    pushNamed: '/row1col1',
                    title_1: '',
                    title_2: '',
                    iconColor: Colors.transparent,
                    borderColor: Colors.transparent,
                    boxColor: Colors.transparent,
                  ),
                  NavigationBox(
                    pushNamed: '/row1col1',
                    title_1: '',
                    title_2: '',
                    iconColor: Colors.transparent,
                    borderColor: Colors.transparent,
                    boxColor: Colors.transparent,
                  ),
                ],
              ),
              const SizedBox(
                height: 150,
              ),
              LargeText(
                text: 'TAXAI 컨설팅',
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NavigationBox(
                      pushNamed: '/row1col1',
                      title_1: '양도소득세 AI',
                      title_2: '컨설팅'),
                  NavigationBox(
                      pushNamed: '/row1col1',
                      title_1: '매도 관련',
                      title_2: 'AI 컨설팅'),
                  NavigationBox(
                      pushNamed: '/row1col1',
                      title_1: '매입 관련',
                      title_2: 'AI 컨설팅'),
                  NavigationBox(
                      pushNamed: '/row1col1',
                      title_1: '증여 관련',
                      title_2: 'AI 컨설팅')
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

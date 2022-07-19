import 'package:flutter/material.dart';

class CapitalGainsTaxPage extends StatefulWidget {
  const CapitalGainsTaxPage({Key? key}) : super(key: key);

  @override
  State<CapitalGainsTaxPage> createState() => _CapitalGainsTaxPageState();
}

class _CapitalGainsTaxPageState extends State<CapitalGainsTaxPage> {

  List<String> test = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19",];

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  Center(
        child: Text('양도소득세!!!'),
      ),
    );
  }
}

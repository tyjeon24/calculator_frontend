import 'package:flutter/material.dart';

class HoldingTaxPage extends StatefulWidget {
  const HoldingTaxPage({Key? key}) : super(key: key);

  @override
  State<HoldingTaxPage> createState() => _HoldingTaxPageState();
}

class _HoldingTaxPageState extends State<HoldingTaxPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('보유세!!!'),
      ),
    );
  }
}

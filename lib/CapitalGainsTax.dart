import 'package:flutter/material.dart';

class CapitalGainsTaxPage extends StatefulWidget {
  const CapitalGainsTaxPage({Key? key}) : super(key: key);

  @override
  State<CapitalGainsTaxPage> createState() => _CapitalGainsTaxPageState();
}

class _CapitalGainsTaxPageState extends State<CapitalGainsTaxPage> {

  List<String> test = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19",];

  bool _ischecked = false;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1200,
          ),
          child: ListView(
            children: <Widget>[
              Row(
                  children: <Widget>[
                    Expanded(
                      child:  Container(
                          margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                          child: const Divider(
                            color: Colors.black,
                            height: 50,
                          )),
                    ),
                    const Text(
                      "2202년 5월 세법개정(안) 반영",
                      style: TextStyle(),
                    ),
                    Expanded(
                      child:  Container(
                          margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                          child: const Divider(
                            color: Colors.black,
                            height: 50,
                          )),
                    ),
                  ]),
              Row(
                children: [
                  Text('거래대상'),
                  _customButton('주택'),
                  _customButton('분양권'),
                  _customButton('토지'),
                  _customButton('기타')
                ],
              ),
              Row(
                children: [
                  Text('대상주택'),
                  _customButton('1주택'),
                  _customButton('2주택'),
                  _customButton('3주택 이상'),
                  _customButton('기타')
                ],
              ),
              Row(
                children: [
                  Text('규제지역'),
                  Checkbox(
                      value: _ischecked,
                      onChanged: (bool? value){
                        setState(() {
                          _ischecked = value!;
                        });
                      }
                  ),
                  Text('취득시점 조정대상지역')
                ],
              ),
              Row(
                children: [
                  Text('추가사항'),
                  Checkbox(
                      value: _ischecked,
                      onChanged: (bool? value){
                        setState(() {
                          _ischecked = value!;
                        });
                      }
                  ),
                  Text('기본공제'),
                  Checkbox(
                      value: _ischecked,
                      onChanged: (bool? value){
                        setState(() {
                          _ischecked = value!;
                        });
                      }
                  ),
                  Text('공동명의'),
                  Checkbox(
                      value: _ischecked,
                      onChanged: (bool? value){
                        setState(() {
                          _ischecked = value!;
                        });
                      }
                  ),
                  Text('다주택에서 전환'),
                  Checkbox(
                      value: _ischecked,
                      onChanged: (bool? value){
                        setState(() {
                          _ischecked = value!;
                        });
                      }
                  ),
                  Text('임대주택'),
                ],
              ),
              Row(

              )
            ],
          ),
        ),
      )
    );
  }

  Widget _customButton(String text){
    return ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: 100
        ),
      child: InkWell(
        onTap: (){},
        child: Container(
          padding: EdgeInsets.fromLTRB(2, 10, 2, 10),
          margin: EdgeInsets.fromLTRB(2, 0, 2, 0),
          child:Center(child:  Text(text, style: TextStyle(color: Colors.white),),),
          height: 50,
          decoration: BoxDecoration(
              color: Colors.black38
          ),
        ),
      )
    );
  }
}



class CapitalGainsTax{

}

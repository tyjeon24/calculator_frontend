import 'dart:convert';

import 'package:calculator_frontend/widgets/LargeText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class CapitalGainsTaxPage extends StatefulWidget {
  const CapitalGainsTaxPage({Key? key}) : super(key: key);

  @override
  State<CapitalGainsTaxPage> createState() => _CapitalGainsTaxPageState();
}

class _CapitalGainsTaxPageState extends State<CapitalGainsTaxPage> {

  List<List<String>> _sampleList = [["서울특별시 강남구 도곡로21길 7(역삼동)", "서울특별시 강남구 역삼동 795-25 역삼1동경로당", "1168010100107950025"], ["서울특별시 강남구 도곡로21길 15(역삼동, 역삼동월드메르디앙아파트)", "서울특별시 강남구 역삼동 795-41 역삼동월드메르디앙아파트", "1168010100107950041"], ["서울특별시 강남구 도곡로21길 18(역삼동)", "서울특별시 강남구 역삼동 796-26 삼정빌딩", "1168010100107960026"], ["서울특별시 강남구 도곡로21길 20(역삼동)", "서울특별시 강남구 역삼동 796-16 태양빌딩", "1168010100107960016"], ["서울특별시 강남구 도곡로21길 22(역삼동)", "서울특별시 강남구 역삼동 796-9", "1168010100107960009"], ["서울특별시 강남구 도곡로21길 23(역삼동, 역삼그린빌리지)", "서울특별시 강남구 역삼동 795-10 역삼그린빌리지", "1168010100107950010"], ["서울특별시 강남구 도곡로21길 24(역삼동)", "서울특별시 강남구 역삼동 796-8", "1168010100107960008"], ["서울특별시 강남구 도곡로21길 25(역삼동)", "서울특별시 강남구 역삼동 795-4", "1168010100107950004"], ["서울특별시 강남구 도곡로21길 26(역삼동)", "서울특별시 강남구 역삼동 796-7", "1168010100107960007"], ["서울특별시 강남구 도곡로21길 27(역삼동)", "서울특별시 강남구 역삼동 795-3", "1168010100107950003"], ["서울특별시 강남구 도곡로14길 21(도곡동, 도곡3차아이파크)", "서울특별시 강남구 도곡동 970 도곡3차아이파크", "1168011800109700000"], ["서울특별시 강남구 도곡로17길 21(역삼동)", "서울특별시 강남구 역삼동 793-50", "1168010100107930050"], ["서울특별시 강남구 도곡로19길 21(역삼동)", "서울특별시 강남구 역삼동 794-12", "1168010100107940012"], ["서울특별시 강남구 도곡로19길 21-1(역삼동)", "서울특별시 강남구 역삼동 794-10", "1168010100107940010"], ["서울특별시 강남구 도곡로27길 21(역삼동, 로얄펠리스)", "서울특별시 강남구 역삼동 782-7 로얄펠리스", "1168010100107820007"], ["서울특별시 강남구 도곡로33길 21(역삼동)", "서울특별시 강남구 역삼동 781-25", "1168010100107810025"], ["서울특별시 강남구 도곡로43길 21(역삼동, 래미안그레이튼)", "서울특별시 강남구 역삼동 762-3 래미안그레이튼", "1168010100107620000"], ["서울특별시 강남구 도곡로64길 21(대치동)", "서울특별시 강남구 대치동 1013", "1168010600110130003"], ["서울특별시 강남구 도곡로73길 21(대치동)", "서울특별시 강남구 대치동 926-35", "1168010600109260035"], ["서울특별시 송파구 도곡로62길 21(잠실동)", "서울특별시 송파구 잠실동 302", "1171010100103020000"], ["서울특별시 송파구 도곡로62길 21(잠실동)", "서울특별시 송파구 잠실동 302 새한장로교회", "1171010100103020000"], ["서울특별시 송파구 도곡로64길 21(잠실동)", "서울특별시 송파구 잠실동 298-11", "1171010100102980011"]];
  final mainColor = 0xff80cfd5;

  bool _ischecked = false;
  bool _isSearchedAddress = false; //flase 이면 주소 검색을 아직 안한 상태, 1이면 검색을 한 상태

  String sampleAddress = '서울특별시 서초구 반포대로 4(서초동)';
  Color color = Colors.black38;

  final TextEditingController _transferPriceTC = TextEditingController();
  final TextEditingController _acquisitionPriceTC = TextEditingController();
  final TextEditingController _neededPriceTC = TextEditingController();
  final TextEditingController _transferDateTC = TextEditingController();
  final TextEditingController _acquisitionDateTC = TextEditingController();
  final TextEditingController _startLivingDateTC = TextEditingController();
  final TextEditingController _endLivingDateTC = TextEditingController();
  final TextEditingController _findingAddressTC = TextEditingController();

  List<String> _typeOfTransfer = ["주택(주거용 오피스텔 포함)", "입주권", "분양권"];
  String _dropDownMenuForTypeOfTransfer = "주택(주거용 오피스텔 포함)";
  List<String> _typeOfAcquisition = ["주택", "재건축전 주택", "주거용 오피스텔", "조합원 입주권", "분양권(2021년 이전 취득)", "분양권(2022년 이후 취득)"];
  List<String> _reasonOfAquistition = ["매매", "증여", "상속", "자가신축"];



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
                largeTitle(),
                firstDivider(),
                Row(
                  children: [
                    _smallTitle('주소'),
                    Expanded(
                      child: GestureDetector(
                        onTap: ()async{
                          var a = await _findingAddressDialog(_findingAddressTC);

                          setState(() {
                            sampleAddress = a!;
                            color = Colors.black;
                          });
                        },
                        child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color:  Colors.black,
                                ),
                                borderRadius: const BorderRadius.all(Radius.circular(10))
                            ),
                            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                Text(
                                  sampleAddress,
                                  style:  TextStyle(fontSize: 17,color: color),
                                ),
                              ],
                            )
                        ),
                      )
                    )
                  ],
                ),
                Row(
                  children: [
                    _smallTitle('양도시 종류'),
                    DropdownButton(
                      // Initial Value
                      value: _dropDownMenuForTypeOfTransfer,
                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),
                      // Array list of items
                      items: _typeOfTransfer.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          _dropDownMenuForTypeOfTransfer = newValue!;
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.check_circle_outline_sharp),
                    const SizedBox(width: 5,),
                    const Text('거주정보', style: TextStyle(fontSize: 17),),
                    Expanded(
                      child:  Container(
                          margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: const Divider(
                            color: Colors.black,
                            height: 50,
                          )
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    _smallTitle('간편선택'),
                    Checkbox(
                        value: _ischecked,
                        onChanged: (bool? value){
                          setState(() {
                            _ischecked = value!;
                          });
                        }
                    ),
                    _optionText('보유기간과 동일'),
                    Checkbox(
                        value: _ischecked,
                        onChanged: (bool? value){
                          setState(() {
                            _ischecked = value!;
                          });
                        }
                    ),
                    _optionText('거주기간 없음'),
                  ],
                ),
                Row(
                  children: [
                    _smallTitle('취득일자'),
                    _textField2(_startLivingDateTC, '19980218'),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Icon(Icons.arrow_forward_rounded),
                    ),
                    _textField2(_endLivingDateTC, '20220725'),
                  ],
                ),
                Container(
                  height: 50,
                  margin: const EdgeInsets.fromLTRB(0, 50, 0, 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.redAccent
                    ),
                    onPressed: (){
                      if(_checkFormIsCompleted()){
                        setState(() {

                        });
                      }
                      else{
                        setState(() {

                        });
                      }
                    },
                    child: const Text(
                      '계산하기',style: TextStyle(fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }

  bool _checkFormIsCompleted(){

    return true;
  }
  Future<String> _findingAddressDialog(TextEditingController tc)async{
    var res = await showDialog(
        context: context,
        builder: (BuildContext context){
          return StatefulBuilder(
              builder: (context, setState){
                return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1),
                    ),
                    title: Text('주소검색'),
                    content:Container(
                      width: 600,
                      constraints: const BoxConstraints(
                        minHeight: 500,
                        maxHeight: 800,
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: double.maxFinite,
                            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: TextField(
                                controller: tc,
                                cursorColor: Colors.black,
                                textInputAction: TextInputAction.search,
                                style: const TextStyle(fontSize: 17),
                                decoration: InputDecoration(
                                    hintText: '반포대로',
                                    focusedBorder: _outlineInputBorder(),
                                    enabledBorder: _outlineInputBorder(),
                                    border: _outlineInputBorder(),
                                    suffixIcon: Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 10, 10),
                                      child: IconButton(
                                        icon: const Icon(Icons.search, size: 40),
                                        color: Colors.black,
                                        onPressed: () {
                                          setState((){
                                            _isSearchedAddress = true;
                                          });
                                        },
                                      ),
                                    )
                                )
                            ),
                          ),
                          _isSearchedAddress? _addressList(tc.text)
                              :Container(child: Center(child: Text('검색어를 입력해주세요'),))
                        ],
                      ),
                    )
                );
              }
          );
        }
    );

    return res;
  }

  Widget _addressList(String keyword){

    return Expanded(child: FutureBuilder(
        future: sampleFetchAddress(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Color(mainColor)),
              ),
            );
          }else if(snapshot.hasError){
            return Center(child: Text(snapshot.error.toString()));
          }
          List<List<String>> res = snapshot.data as List<List<String>>;
          return ListView.builder(
            itemCount: res.length,
            shrinkWrap: true,
            itemBuilder: (context, index){
              return _selectAddressBox(res[index][0],res[index][1],index);
            },
          );
        }
    ));
  }

  Widget _selectAddressBox(String newAddress, String oldAddress, int index){
    Color backgrouundColor;
    if(index.isEven){
      backgrouundColor = Colors.white;
    }else {backgrouundColor = Colors.black26;}

    return GestureDetector(
      onTap: (){Navigator.pop(context, newAddress);},
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
        decoration: BoxDecoration(
          color: backgrouundColor
        ),
        child: Column(
          children: [
            Text(newAddress),
            Text(oldAddress)
          ],
        ),
      ),
    );
  }

  Future<List<List<String>>> sampleFetchAddress()async{
    await Future.delayed(Duration(seconds: 2));
    return _sampleList;
  }


  Future<List<List<String>>> fetchAddress(String keyword) async{
    String baseURL = "https://wu26xy8cqj.execute-api.ap-northeast-2.amazonaws.com/default/juso_api?keyword=";

    final response = await http.get(Uri.parse(baseURL + keyword));

    if(response.statusCode == 200){
      print(response.body);

      var resJson = jsonDecode(response.body);

      List temp = List.from(resJson);

      List<List<String>> res = [];

      for(int i = 0 ; i < temp.length ; i++){
        List<String> a = List<String>.from(temp[i]);
        res.add(a);
      }

      return res;
    }
    else {
      print('헐랭');
      throw Exception("Fail to fetch address data");
    }
  }



  Widget _textField1(TextEditingController tc, String labelText){
    return Expanded(
        child: Container(
          margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: TextField(
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly
            ],
            controller: tc,
            cursorColor: Colors.black,
            textInputAction: TextInputAction.search,
            style: const TextStyle(fontSize: 17),
            decoration: InputDecoration(
              labelText: labelText,
              labelStyle: const TextStyle(color: Colors.black),
              focusedBorder: _outlineInputBorder(),
              enabledBorder: _outlineInputBorder(),
              border: _outlineInputBorder(),
            ),
          ),
        )
    );
  }
  Widget _textField2(TextEditingController tc, String hintText){
    return Expanded(
        child: Container(
          margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: TextField(
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly
            ],
            controller: tc,
            cursorColor: Colors.black,
            textInputAction: TextInputAction.search,
            style: const TextStyle(fontSize: 17),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(color: Colors.black38),
              focusedBorder: _outlineInputBorder(),
              enabledBorder: _outlineInputBorder(),
              border: _outlineInputBorder(),
            ),
          ),
        )
    );
  }



  OutlineInputBorder _outlineInputBorder() {
    return const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(10)));
  }

  Widget _optionText(String txt){
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: Text(txt,
        style: TextStyle(fontSize: 17),
      ),
    );
  }

  Widget _smallTitle(String txt){
    return Container(
      width: 120,
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Text(txt,style: const TextStyle(fontSize: 20),),
    );
  }

  Widget largeTitle(){
    return const Padding(
      padding:  EdgeInsets.only(left: 30, top: 40, bottom: 20),
      child: LargeText(
        text: '양도소득세 통합 계산',
        size: 25,
      )
    );
  }

  Widget firstDivider(){
    return Row(children: <Widget>[
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 30, right: 15),
            child: const Divider(
              color: Colors.red,
              height: 20,
            )),
      ),
      const Text(
        "2022년 7월 세법개정(안) 반영",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 15, right: 30),
            child: const Divider(
              color: Colors.red,
              height: 20,
            )),
      ),
    ]);
  }

}

class SearchAddress{
  String new_address;
  String old_address;
  String address_id;

  SearchAddress({
    required this.new_address,
    required this.old_address,
    required this.address_id,
  });
}

class CapitalGainsTax{

}

import 'dart:convert';

import 'package:calculator_frontend/widgets/LargeText.dart';
import 'package:calculator_frontend/widgets/MediumText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class Resume_HoldingTaxPage extends StatefulWidget {
  const Resume_HoldingTaxPage({Key? key}) : super(key: key);

  @override
  State<Resume_HoldingTaxPage> createState() => _Resume_HoldingTaxPageState();
}

class _Resume_HoldingTaxPageState extends State<Resume_HoldingTaxPage> {
  final List select_num_of_house = ['1세대 1주택', '1세대 2주택', '1세대 3주택 이상'];
  bool _is_house_1_Selected = false;
  bool _is_house_2_Selected = false;
  bool _is_house_3_Selected = false;
  final Color mainColor = Color(0xff80cfd5);
  String sampleaddr = '서울특별시 서초구 반포대로4(서초동)';
  Color samplecolor = Colors.black38;
  late int _stage;
  bool _isSearchedAddress = false;
  final TextEditingController _findingAddressTC = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _stage = 1;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _findingAddressTC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 1200,
            ),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 40, bottom: 20),
                  child: LargeText(
                    text: '보유세 통합 계산',
                    size: 25,
                  ),
                ),
                Diver_Title(),
                Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            MediumText(text: '주택수 선택'),
                            Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: [
                                ActionChip(
                                    onPressed: () {
                                      setState(() {
                                        _is_house_1_Selected =
                                            !_is_house_1_Selected;
                                      });
                                    },
                                    labelPadding: EdgeInsets.all(5),
                                    backgroundColor: _is_house_1_Selected
                                        ? mainColor
                                        : Colors.white,
                                    elevation: 2,
                                    avatar: CircleAvatar(
                                      backgroundColor: _is_house_1_Selected
                                          ? Colors.white60
                                          : mainColor.withOpacity(.6),
                                      child: Text((1).toString()),
                                    ),
                                    shadowColor: Colors.grey[100],
                                    padding: EdgeInsets.all(6),
                                    label: Text(
                                      select_num_of_house[0],
                                      style: TextStyle(
                                          color: _is_house_1_Selected
                                              ? Colors.white
                                              : Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17),
                                    )),
                                ActionChip(
                                    onPressed: () {
                                      setState(() {
                                        _is_house_2_Selected =
                                            !_is_house_2_Selected;
                                      });
                                    },
                                    labelPadding: EdgeInsets.all(5),
                                    backgroundColor: _is_house_2_Selected
                                        ? mainColor
                                        : Colors.white,
                                    elevation: 2,
                                    avatar: CircleAvatar(
                                      backgroundColor: _is_house_2_Selected
                                          ? Colors.white60
                                          : mainColor.withOpacity(.6),
                                      child: Text((2).toString()),
                                    ),
                                    shadowColor: Colors.grey[100],
                                    padding: EdgeInsets.all(6),
                                    label: Text(
                                      select_num_of_house[1],
                                      style: TextStyle(
                                          color: _is_house_2_Selected
                                              ? Colors.white
                                              : Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17),
                                    )),
                                ActionChip(
                                    onPressed: () {
                                      setState(() {
                                        _is_house_3_Selected =
                                            !_is_house_3_Selected;
                                      });
                                    },
                                    labelPadding: EdgeInsets.all(5),
                                    backgroundColor: _is_house_3_Selected
                                        ? mainColor
                                        : Colors.white,
                                    elevation: 2,
                                    avatar: CircleAvatar(
                                      backgroundColor: _is_house_3_Selected
                                          ? Colors.white60
                                          : mainColor.withOpacity(.6),
                                      child: Text('3+'),
                                    ),
                                    shadowColor: Colors.grey[100],
                                    padding: EdgeInsets.all(6),
                                    label: Text(
                                      select_num_of_house[2],
                                      style: TextStyle(
                                          color: _is_house_3_Selected
                                              ? Colors.white
                                              : Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17),
                                    )),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            MediumText(text: '주소'),
                            GestureDetector(
                              onTap: () async {
                                var a = await _findingAddressDialog(
                                    _findingAddressTC);

                                setState(() {
                                  sampleaddr != a;
                                  samplecolor = Colors.black;
                                  _stage = 2;
                                });
                              },
                              child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: mainColor.withOpacity(.7),
                                          blurRadius: 2.0,
                                          spreadRadius: 1.0,
                                        )
                                      ],
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10))),
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        sampleaddr,
                                        style: TextStyle(
                                            fontSize: 17, color: samplecolor),
                                      ),
                                    ],
                                  )),
                            )
                          ],
                        )
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder _outlineInputBorder() {
    return const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(10)));
  }

  Future<String> _findingAddressDialog(TextEditingController tc) async {
    setState(() {
      _isSearchedAddress = false;
    });
    var res = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1),
                ),
                title: Text('주소검색'),
                content: Container(
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
                            autofocus: true,
                            onSubmitted: (value) {
                              setState(() {
                                _isSearchedAddress = true;
                              });
                            },
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
                                      setState(() {
                                        _isSearchedAddress = true;
                                      });
                                    },
                                  ),
                                ))),
                      ),
                      _isSearchedAddress
                          ? _addressList(tc.text)
                          : const Center(
                              child: Text('검색어를 입력해주세요'),
                            )
                    ],
                  ),
                ));
          });
        });

    return res;
  }

  Widget _addressList(String keyword) {
    return Expanded(
        child: FutureBuilder(
            future: fetchAddress(keyword),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(mainColor),
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }
              List res = snapshot.data as List;
              return ListView.builder(
                itemCount: res.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return _selectAddressBox(res[index][0], res[index][1], index);
                },
              );
            }));
  }

  Future<List> fetchAddress(String keyword) async {
    String baseURL =
        "https://wu26xy8cqj.execute-api.ap-northeast-2.amazonaws.com/default/juso_api?keyword=";

    final response = await http.get(Uri.parse(baseURL + keyword));

    if (response.statusCode == 200) {
      List res = List.from(jsonDecode(utf8.decode(response.bodyBytes)));

      return res;
    } else {
      throw Exception("Fail to fetch address data");
    }
  }

  Widget _selectAddressBox(String newAddress, String oldAddress, int index) {
    Color backgrouundColor;
    if (index.isEven) {
      backgrouundColor = Colors.white;
    } else {
      backgrouundColor = Colors.black26;
    }

    return GestureDetector(
      onTap: () {
        Navigator.pop(context, newAddress);
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
        decoration: BoxDecoration(color: backgrouundColor),
        child: Column(
          children: [Text(newAddress), Text(oldAddress)],
        ),
      ),
    );
  }

  Widget Diver_Title() {
    return Row(children: <Widget>[
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 30, right: 30),
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

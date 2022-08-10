import 'package:calculator_frontend/widgets/LargeText.dart';
import 'package:calculator_frontend/widgets/NavigationBox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class LargeLayout extends StatefulWidget {
  const LargeLayout({Key? key}) : super(key: key);

  @override
  State<LargeLayout> createState() => _LargeLayoutState();
}

class _LargeLayoutState extends State<LargeLayout> {
  @override
  Widget build(BuildContext context) {
    var widgetSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: new AppBar(
        elevation: 0,
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        leading: Center(
          child: Image.asset(
            'assets/images/logo2.png',
            height: 130,
            width: 220,
            fit: BoxFit.fitWidth,
          ),
        ),
        leadingWidth: 220,
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            actions: <Widget>[Container()],
            backgroundColor: Colors.white38,
            expandedHeight: widgetSize.height * .55,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: EdgeInsets.only(
                    left: widgetSize.width / 10, right: widgetSize.width / 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    LargeText(
                      text: '세금 AI 계산기',
                    ),
                    SizedBox(
                      height: widgetSize.height / 40,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1),
                      ),
                      height: widgetSize.height * .25,
                      width: widgetSize.width * .8,
                      child: Center(child: Text('프로그램 설명')),
                    ),
                    SizedBox(
                      height: widgetSize.height / 40,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1),
                      ),
                      height: widgetSize.height * .05,
                      width: widgetSize.width * .8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [Text('개인정보처리방침/이용약관/제휴문의'), Text('특허출원 정보')],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                  left: widgetSize.width / 20,
                  right: widgetSize.width / 20,
                  bottom: widgetSize.height / 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LargeText(
                    text: 'AI 세금 계산',
                  ),
                  SizedBox(
                    height: widgetSize.height / 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NavigationBox(
                          isMedium: false,
                          pushNamed: '/capgain',
                          title_1: '양도소득세',
                          title_2: 'AI 판단 계산기'),
                      NavigationBox(
                          isMedium: false,
                          pushNamed: '/holding',
                          title_1: '보유세(종부세, 재산세)',
                          title_2: 'AI 판단 계산기'),
                      Opacity(
                          opacity: 0,
                          child: NavigationBox(
                              isMedium: false,
                              pushNamed: '/',
                              title_1: '',
                              title_2: '')),
                      Opacity(
                        opacity: 0,
                        child: NavigationBox(
                            isMedium: false,
                            pushNamed: '/',
                            title_1: '',
                            title_2: ''),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                  left: widgetSize.width / 20,
                  right: widgetSize.width / 20,
                  bottom: widgetSize.height / 3.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LargeText(
                    text: 'TAXAI 컨설팅',
                  ),
                  SizedBox(
                    height: widgetSize.height / 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NavigationBox(
                          isMedium: false,
                          pushNamed: '/',
                          title_1: '양도소득세 AI',
                          title_2: '컨설팅'),
                      NavigationBox(
                          isMedium: false,
                          pushNamed: '/',
                          title_1: '매도 관련',
                          title_2: 'AI 컨설팅'),
                      NavigationBox(
                          isMedium: false,
                          pushNamed: '/',
                          title_1: '양도소득세 AI',
                          title_2: '컨설팅'),
                      NavigationBox(
                          isMedium: false,
                          pushNamed: '/',
                          title_1: '매도 관련',
                          title_2: 'AI 컨설팅'),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: null,
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: AssetImage('assets/images/logo.png'),
                      fit: BoxFit.fitHeight)),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('TAXAI 소개'),
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('공지사항'),
            ),
            ListTile(
              leading: Icon(Icons.mail_sharp),
              title: Text('문의사항 메일 보내기'),
              onTap: () {
                _sendInquiryEmail();
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_mail_sharp),
              title: Text('제휴문의 메일 보내기'),
              onTap: () {
                _sendPartnerEmail();
              },
            )
          ],
        ),
      ),
    );
  }

  void _sendInquiryEmail() async {
    final Email email = Email(
      body: '',
      subject: 'TAXAI 문의사항',
      recipients: ['tech@taxai.co.kr'],
      cc: [''],
      bcc: [''],
      attachmentPaths: [''],
      isHTML: false,
    );

    try {
      await FlutterEmailSender.send(email);
    } catch (error) {
      showAlert('TAXAI 문의사항', 'tech@taxai.co.kr');
    }
  }

  void _sendPartnerEmail() async {
    final Email email = Email(
      body: '',
      subject: 'TAXAI 제휴문의',
      recipients: ['admin@taxai.co.kr'],
      cc: [''],
      bcc: [''],
      attachmentPaths: [''],
      isHTML: false,
    );

    try {
      await FlutterEmailSender.send(email);
    } catch (error) {
      showAlert('TAXAI 제휴문의', 'admin@taxai.co.kr');
    }
  }

  Future<void> showAlert(String title, String email) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            title: Text(title),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('현재 메일을 바로 보낼 수 없습니다.'),
                Text('아래 이메일로 문의주시면 감사하겠습니다.'),
                Text(
                  email,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('확인'))
            ],
          );
        });
  }
}

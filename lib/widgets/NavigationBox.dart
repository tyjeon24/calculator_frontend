import 'package:calculator_frontend/widgets/LargeText.dart';
import 'package:flutter/material.dart';

class NavigationBox extends StatefulWidget {
  final String pushNamed;
  final String title_1;
  final String title_2;
  final Color boxColor;
  final Color borderColor;
  final IconData? icon;
  final Color? iconColor;

  const NavigationBox(
      {Key? key,
      required this.pushNamed,
      required this.title_1,
      required this.title_2,
      this.boxColor = Colors.white,
      this.borderColor = Colors.black,
      this.icon = Icons.add_box_rounded,
      this.iconColor = Colors.black})
      : super(key: key);

  @override
  State<NavigationBox> createState() => _NavigationBoxState();
}

class _NavigationBoxState extends State<NavigationBox> {
  final mainColor = 0xff80cfd5;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if(widget.pushNamed == '/'){
          return;
        }else{
          final res = await Navigator.pushNamed(context, widget.pushNamed);
        }

      },
      child: Container(
        // padding left(150), right(150) 빼주고, container 간 사이 간격 (30) * 3 빼줘서
        // 총 390 빼줌
        width: 350,
        height: MediaQuery.of(context).size.height * .22,
        decoration: BoxDecoration(
          color: widget.boxColor,
          border: Border.all(width: 0.1, color: widget.borderColor),
        ),
        padding: const EdgeInsets.only(left: 20, right: 10, top: 8, bottom: 8),
        //padding 안쪽 여백
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    widget.icon,
                    size: 80,
                    color: widget.iconColor,
                  ),
                )
              ],
            ),
            LargeText(
              text: widget.title_1,
              size: 25,
            ),
            LargeText(
              text: widget.title_2,
              size: 25,
            )
          ],
        ),
      ),
    );
  }
}

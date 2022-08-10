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
  final bool isMedium;

  const NavigationBox(
      {Key? key,
      required this.isMedium,
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
        width: widget.isMedium == true
            ? MediaQuery.of(context).size.width / 2.5
            : MediaQuery.of(context).size.width / 5,
        height: widget.isMedium == true
            ? MediaQuery.of(context).size.width / 3.7
            : MediaQuery.of(context).size.width / 8,
        decoration: BoxDecoration(
          color: widget.boxColor,
          border: Border.all(width: 0.1, color: widget.borderColor),
        ),
        padding: widget.isMedium == true
            ? EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 80,
                right: MediaQuery.of(context).size.width / 80,
                top: MediaQuery.of(context).size.height / 100,
                bottom: MediaQuery.of(context).size.height / 130)
            : EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 90,
                right: MediaQuery.of(context).size.width / 90,
                top: MediaQuery.of(context).size.height / 100,
                bottom: MediaQuery.of(context).size.height / 110),
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
                    size: widget.isMedium == true
                        ? MediaQuery.of(context).size.width / 10
                        : MediaQuery.of(context).size.width / 20,
                    color: widget.iconColor,
                  ),
                )
              ],
            ),
            LargeText(
              text: widget.title_1,
              size: widget.isMedium == true
                  ? MediaQuery.of(context).size.width / 35
                  : MediaQuery.of(context).size.width / 70,
            ),
            LargeText(
              text: widget.title_2,
              size: widget.isMedium == true
                  ? MediaQuery.of(context).size.width / 35
                  : MediaQuery.of(context).size.width / 70,
            )
          ],
        ),
      ),
    );
  }
}

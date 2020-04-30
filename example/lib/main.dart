import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fradio/fradio.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FRadioPage(),
    );
  }
}

class FRadioPage extends StatefulWidget {
  @override
  _FRadioPageState createState() => _FRadioPageState();
}

class _FRadioPageState extends State<FRadioPage> {
  int groupValue_1 = 0;
  var enable_1 = true;

  int groupValue_2 = 0;

  int groupValue_3 = 0;

  int groupValue_4 = 0;

  int groupValue_5 = 0;

  int groupValue_6 = 0;

  int groupValue_7 = 0;

  List<String> list;

  @override
  void initState() {
    super.initState();
    list = [];
    list.add("Kicks");
    list.add("No Time To Die");
    list.add("Pavane in F-Sharp Minor");
    list.add("Get Stupid");
    list.add("AAA");
    list.add("Hostage");
    list.add("Boundaries");
    list.add("Broken");
    list.add("Lo Que Siento");
    list.add("Bored");
    list.add("Savage");
    list.add("Paris");
    list.add("Bad guy");
    list.add("My boy");
    list.add("I love you");
    list.add("Copycat");
    list.add("Lovely");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffffc900),
        title: const Text('FRadio'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            buildTitle("FRadio"),
            buildSmallMargin(),

            /// 基础用法
            baseDemo(),
            buildSmallMargin(),
            buildDesc('Creating a group of FRadio is very simple.'),
            buildMiddleMargin(),
            buildTitle("Enable & Toggleable"),
            buildSmallMargin(),

            /// Enable & Toggleable
            enableToggleableDemo(),
            buildSmallMargin(),
            RaisedButton(
              onPressed: () {
                setState(() {
                  enable_1 = !enable_1;
                });
              },
              color: Color(0xffffc900),
              child: Text(
                "Toggleable",
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),
            buildMiddleMargin(),
            buildTitle("Space & Corner & Border"),
            buildMiddleMargin(),

            /// Space & Corner
            spaceCornerDemo(),
            buildMiddleMargin(),
            buildTitle("Gradient"),
            buildMiddleMargin(),

            /// gradient
            gradientDemo(),

            buildMiddleMargin(),
            buildTitle("Child"),
            buildMiddleMargin(),

            /// Child
            childDemo(),

            buildMiddleMargin(),
            buildTitle("Custom 1"),

            /// Custom 1
            customDemo1(),
//            Transform.scale(scale: 1.0, child: customDemo(),),

            buildMiddleMargin(),
            buildTitle("Custom 2"),
            buildMiddleMargin(),

            /// Custom 2
            customDemo2(),
            buildMiddleMargin(),
            buildMiddleMargin(),
            buildMiddleMargin(),
            buildMiddleMargin(),
          ],
        ),
      ),
    );
  }

  Container customDemo2() {
    return Container(
      width: 250,
      height: 400,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Color(0xffBDBDBD),
          blurRadius: 5.0,
          offset: Offset(2.0, 2.0),
        )
      ]),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: list.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return FRadio.custom(
            value: index,
            groupValue: groupValue_7,
            onChanged: (value) {
              setState(() {
                groupValue_7 = value;
              });
            },
            normal: Container(
              width: 250,
              height: 100,
              color: Colors.white,
              padding: EdgeInsets.only(left: 12, right: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("${list[index]}"),
                ],
              ),
            ),
            hover: Container(
              width: 250,
              height: 100,
              color: Color(0xff212121).withOpacity(0.05),
              padding: EdgeInsets.only(left: 12, right: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("${list[index]}"),
                ],
              ),
            ),
            selected: Container(
              padding: EdgeInsets.only(left: 12, right: 12),
              color: Color(0xff607D8B).withOpacity(0.2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${list[index]}"),
                  Icon(
                    Icons.check,
                    size: 18,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget customDemo1() {
    int count = 3;
    return Stack(
      children: [
        Image.asset("assets/icon_radio.png"),
        Positioned(
          top: 230,
          left: 150,
          child: SizedBox(
            height: 30,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: count,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: index == count - 1 ? 0 : 1),
                    child: FRadio.custom(
                      width: 18,
                      height: 30,
                      value: index + 1,
                      groupValue: groupValue_6,
                      onChanged: (value) {
                        setState(() {
                          groupValue_6 = value;
                        });
                      },
                      toggleable: true,
                      normal: demo3d(Color(0xff686868)),
                      hover: demo3d(Color(0xff9e9e9e)),
                      selected: Transform.scale(
                        scale: 0.85,
                        alignment: Alignment.center,
                        child: Container(
                          child: demo3d(Color(0xffD84315)),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xffFFAB91),
                                blurRadius: 2.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }

  Widget demo3d(Color color) {
    return Stack(
      children: [
        /// top
        Positioned(
          top: 0,
          left: 3,
          child: Transform(
            transform: Matrix4.skewX(-pi / 6),
            child: Container(
              width: 15,
              height: 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(0)),
                gradient: LinearGradient(
                    colors: [color.withOpacity(0.8), color.withOpacity(0.3)],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter),
              ),
            ),
          ),
        ),

        /// positive
        Positioned(
          top: 5,
          child: Container(
              width: 15,
              height: 25,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.all(Radius.circular(0)),
              )),
        ),

        /// side
        Positioned(
          top: 5,
          left: 15,
          child: Transform(
            transform: Matrix4.skewY(-pi / 3),
            child: Container(
                width: 3,
                height: 25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                    gradient: LinearGradient(
                        colors: [
                          color.withOpacity(0.8),
                          color.withOpacity(0.5)
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight))),
          ),
        ),
      ],
    );
  }

  Widget gradientDemo() {
    return SizedBox(
      height: 50,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: index == 4 ? 0 : 10),
              child: FRadio(
                width: 50,
                height: 50,
                value: index + 1,
                groupValue: groupValue_4,
                onChanged: (value) {
                  setState(() {
                    groupValue_4 = value;
                  });
                },
                gradient: LinearGradient(
                  colors: [
                    Color(0xffFEFDBB),
                    Color(0xffFFE16C),
                    Color(0xffEA9D1C),
                    Color(0xffD46307),
                  ],
                  begin: Alignment(-0.1, -0.9),
                  end: Alignment(1.0, 1.0),
                  stops: [0.0, 0.2, 0.7, 1.0],
                ),
                selectedColor: Color(0xffffc900),
                hasSpace: false,
                border: 1.5,
                child: Text(
                  "\$${5 * (index + 1)}",
                  style: TextStyle(color: Color(0xffd9d9d9), fontSize: 13),
                ),
                hoverChild: Text(
                  "\$${5 * (index + 1)}",
                  style:
                      TextStyle(color: Colors.deepOrangeAccent, fontSize: 13),
                ),
                selectedChild: Text("\$${5 * (index + 1)}",
                    style: TextStyle(
                        color: Colors.deepOrangeAccent, fontSize: 13)),
              ),
            );
          }),
    );
  }

  Widget childDemo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text("EN.."),
            const SizedBox(height: 9),
            FRadio(
              width: 80,
              height: 80,
              value: 1,
              groupValue: groupValue_5,
              onChanged: (value) {
                setState(() {
                  groupValue_5 = value;
                });
              },
              child: Image.asset("assets/emoji_0.png", width: 50),
              hoverChild: Image.asset("assets/emoji_1.png", width: 50),
              selectedChild: Image.asset("assets/emoji_2.png", width: 50),
              hasSpace: false,
              toggleable: true,
              selectedColor: Color(0xffffc900),
              border: 1.5,
            ),
          ],
        ),
        const SizedBox(width: 56),
        Column(
          children: [
            Text("YA.."),
            const SizedBox(height: 9),
            FRadio(
              width: 80,
              height: 80,
              value: 2,
              groupValue: groupValue_5,
              onChanged: (value) {
                setState(() {
                  groupValue_5 = value;
                });
              },
              child: Image.asset("assets/emoji_3.png", width: 50),
              hoverChild: Image.asset("assets/emoji_4.png", width: 50),
              selectedChild: Image.asset("assets/emoji_5.png", width: 50),
              hasSpace: false,
              toggleable: true,
              selectedColor: Color(0xffffc900),
              border: 1.5,
            ),
          ],
        ),
      ],
    );
  }

  Widget spaceCornerDemo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FRadio(
          width: 100,
          height: 50,
          value: 1,
          groupValue: groupValue_3,
          onChanged: (value) {
            setState(() {
              groupValue_3 = value;
            });
          },
          selectedColor: Color(0xffffc900),
          corner: FRadioCorner(leftTopCorner: 6, leftBottomCorner: 6),
          border: 1,
          hasSpace: false,
          selectedChild:
              Text("FSuper", style: TextStyle(color: Color(0xff333333))),
          child: Text("FSuper", style: TextStyle(color: Color(0xff333333))),
        ),
        FRadio(
          width: 100,
          height: 50,
          value: 2,
          groupValue: groupValue_3,
          onChanged: (value) {
            setState(() {
              groupValue_3 = value;
            });
          },
          selectedColor: Color(0xffffc900),
          corner: FRadioCorner.all(0),
          hasSpace: false,
          border: 1,
          selectedChild:
              Text("FButton", style: TextStyle(color: Color(0xff333333))),
          child: Text("FButton", style: TextStyle(color: Color(0xff333333))),
        ),
        FRadio(
          width: 100,
          height: 50,
          value: 3,
          groupValue: groupValue_3,
          onChanged: (value) {
            setState(() {
              groupValue_3 = value;
            });
          },
          selectedColor: Color(0xffffc900),
          corner: FRadioCorner(rightTopCorner: 6, rightBottomCorner: 6),
          hasSpace: false,
          border: 1,
          selectedChild:
              Text("FRadio", style: TextStyle(color: Color(0xff333333))),
          child: Text("FRadio", style: TextStyle(color: Color(0xff333333))),
        ),
      ],
    );
  }

  Widget enableToggleableDemo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FRadio(
          value: 1,
          groupValue: groupValue_2,
          onChanged: (value) {
            setState(() {
              groupValue_2 = value;
            });
          },
          toggleable: true,
          selectedColor: Color(0xffffc900),
        ),
        const SizedBox(width: 5),
        Text("Android", style: TextStyle(fontSize: 16)),
        const SizedBox(width: 16),
        FRadio(
          value: 2,
          groupValue: groupValue_2,
          onChanged: (value) {
            setState(() {
              groupValue_2 = value;
            });
          },
          enable: enable_1,
          toggleable: true,
          selectedColor: Color(0xffffc900),
        ),
        const SizedBox(width: 5),
        Text("iOS", style: TextStyle(fontSize: 16)),
        const SizedBox(width: 16),
        FRadio(
          value: 3,
          groupValue: groupValue_2,
          onChanged: (value) {
            setState(() {
              groupValue_2 = value;
            });
          },
          toggleable: true,
          selectedColor: Color(0xffffc900),
        ),
        const SizedBox(width: 5),
        Text("Fuchsia", style: TextStyle(fontSize: 16)),
      ],
    );
  }

  Widget baseDemo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FRadio(
          value: 1,
          groupValue: groupValue_1,
          onChanged: (value) {
            setState(() {
              groupValue_1 = value;
            });
          },
        ),
        const SizedBox(width: 5),
        Text("A", style: TextStyle(fontSize: 18)),
        const SizedBox(width: 16),
        FRadio(
          value: 2,
          groupValue: groupValue_1,
          onChanged: (value) {
            setState(() {
              groupValue_1 = value;
            });
          },
        ),
        const SizedBox(width: 5),
        Text("B", style: TextStyle(fontSize: 18)),
        const SizedBox(width: 16),
        FRadio(
          value: 3,
          groupValue: groupValue_1,
          onChanged: (value) {
            setState(() {
              groupValue_1 = value;
            });
          },
        ),
        const SizedBox(width: 5),
        Text("C", style: TextStyle(fontSize: 18)),
      ],
    );
  }

  SizedBox buildMiddleMargin() {
    return const SizedBox(
      height: 26,
    );
  }

  SizedBox buildSmallMargin() {
    return const SizedBox(
      height: 18,
    );
  }

  void _showDialog(BuildContext context, String msg) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    msg,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
              backgroundColor: Colors.black45,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ));
  }

  Padding buildDesc(String desc) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          desc,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ));
  }

  Container buildTitle(String title) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(9),
      color: Color(0xffe0e0e0).withOpacity(0.38),
      child: Text(
        title,
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}

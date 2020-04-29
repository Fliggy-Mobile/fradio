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
  var groupValue_1 = 0;
  var enable_1 = true;

  var groupValue_2 = '1';

  var value_3 = '0';
  var text_3 = "未选中状态";

  var value_4 = '0';
  var text_4 = "未选中状态";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffffc900),
        title: const Text('FRadio Demo'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildTitle("FRadio"),
            _buildSmallMargin(),

            /// 基础用法
            baseDemo(),
            _buildDesc('FRadio 通过判断 value 属性和 groupValue 属性是否相等\n'
                '决定它是否处于选中状态'),
            _buildMiddleMargin(),
            _buildTitle("自定义 FRadio"),
            _buildSmallMargin(),
            _buildDesc('通过设置 "asCheckbox: true" FRadio 可以作为一个单选框\n'
                "同时 FRadio 支持完全自定义选中、未选中、不可用状态的样式"),
            StatefulBuilder(builder: (context, state) {
              return Column(
                children: <Widget>[
                  FRadio(
                    width: 100,
                    height: 100,
                    value: 2,
                    groupValue: groupValue_1,
                    onChanged: (int value) {
                      setState(() {
                        groupValue_1 = value;
                      });
                    },
                    toggleable: true,
                    enable: enable_1,
                    selectedColor: Color(0xffffc900),
                    fill: true,
                    hasSpace: true,
                    gradient: LinearGradient(
                        colors: [Colors.blue, Colors.cyanAccent]),
                    selectedChild: Icon(
                      Icons.check,
                      size: 50,
                      color: Colors.deepOrange,
                    ),
                    duration: Duration(milliseconds: 1000),
                  ),
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        enable_1 = !enable_1;
                      });
                    },
                    color: Color(0xffffc900),
                    child: Text(
                      "点击改变 FButton 可用状态",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  )
                ],
              );
            }),
            _buildMiddleMargin(),
            _buildTitle('Radio.style1'),
            _buildSmallMargin(),
            Container(
              padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
              margin: EdgeInsets.fromLTRB(12, 0, 12, 0),
              decoration: BoxDecoration(
                  color: Color(0xffffAc500),
                  borderRadius: BorderRadius.all(Radius.circular(6))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '快点击右侧 ✅ 试试啊！',
                    style: TextStyle(color: Colors.black),
                  ),
//                  FRadio.style1(
//                    value: '0',
//                    groupValue: '0',
//                    onChanged: (value) {},
//                    asCheckbox: true,
//                    color: Colors.white,
//                  ),
                ],
              ),
            ),
            _buildDesc("Radio.style1 是一种对勾样式的选择控件"),
            _buildMiddleMargin(),
            _buildTitle('Radio.style2'),
            _buildSmallMargin(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                StatefulBuilder(
                  builder: (context, state) {
                    return Column(
                      children: <Widget>[
                        Text(
                          text_3,
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                        const SizedBox(height: 6),
//                        FRadio.style2(
//                          value: value_3,
//                          groupValue: '1',
//                          onChanged: (value) {
//                            state(() {
//                              value_3 = (value_3 != "1") ? "1" : "0";
//                              text_3 = (value_3 == "1") ? "选中状态" : "未选中状态";
//                            });
//                          },
//                          asCheckbox: true,
//                        ),
                      ],
                    );
                  },
                ),
                Column(
                  children: <Widget>[
                    Text(
                      '不可用状态-选中',
                      style: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                    const SizedBox(height: 6),
//                    FRadio.style2(
//                      value: '2',
//                      groupValue: '2',
//                      onChanged: (value) {},
//                      asCheckbox: true,
//                      enable: false,
//                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      '不可用状态-未选中',
                      style: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                    const SizedBox(height: 6),
//                    FRadio.style2(
//                      value: '2',
//                      groupValue: '1',
//                      onChanged: (value) {},
//                      asCheckbox: true,
//                      enable: false,
//                    ),
                  ],
                ),
              ],
            ),
            _buildDesc("Radio.style2 是一种有边框的对勾样式"),
            _buildMiddleMargin(),
            _buildTitle('Radio.style3'),
            _buildSmallMargin(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    StatefulBuilder(builder: (context, state) {
                      return Column(
                        children: <Widget>[
                          Text(
                            text_4,
                            style: TextStyle(color: Colors.grey, fontSize: 10),
                          ),
                          const SizedBox(height: 6),
//                          FRadio.style3(
//                            value: value_4,
//                            groupValue: '1',
//                            onChanged: (value) {
//                              state(() {
//                                value_4 = (value_4 != "1") ? "1" : "0";
//                                text_4 = (value_4 == "1") ? "选中状态" : "未选中状态";
//                              });
//                            },
//                            asCheckbox: true,
//                          ),
                        ],
                      );
                    }),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          '不可用状态-选中',
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                        const SizedBox(height: 6),
//                        FRadio.style3(
//                          value: '2',
//                          groupValue: '2',
//                          onChanged: (value) {},
//                          asCheckbox: true,
//                          enable: false,
//                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          '不可用状态-未选中',
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                        const SizedBox(height: 6),
//                        FRadio.style3(
//                          value: '2',
//                          groupValue: '0',
//                          onChanged: (value) {},
//                          asCheckbox: true,
//                          enable: false,
//                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            _buildDesc("Radio.style3 是一种有圆形边框和渐变填充色的对勾样式\n"
                "通过 color1、color2 属性可以配置渐变色的起始和结束色"),
            _buildMiddleMargin(),
            _buildTitle('如何实现单选？'),
            _buildSmallMargin(),
            _buildDesc("通过一个公共变量 groupValue，可轻松实现单选！"),
            StatefulBuilder(builder: (context, state) {
              return Container(
                padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                child: Column(
                  children: <Widget>[
                    Divider(
                      height: 0.5,
                      color: Colors.grey[300],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '标题0',
                          style: TextStyle(color: Colors.black),
                        ),
//                        FRadio.style1(
//                          value: '0',
//                          groupValue: groupValue_2,
//                          onChanged: (value) {
//                            state(() {
//                              groupValue_2 = value;
//                            });
//                          },
//                          asCheckbox: true,
//                        ),
                      ],
                    ),
                    Divider(
                      height: 0.5,
                      color: Colors.grey[300],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '标题1',
                          style: TextStyle(color: Colors.black),
                        ),
//                        FRadio.style1(
//                          value: '1',
//                          groupValue: groupValue_2,
//                          onChanged: (value) {
//                            state(() {
//                              groupValue_2 = value;
//                            });
//                          },
//                          asCheckbox: true,
//                        ),
                      ],
                    ),
                    Divider(
                      height: 0.5,
                      color: Colors.grey[300],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '标题2',
                          style: TextStyle(color: Colors.black),
                        ),
//                        FRadio.style1(
//                          value: '2',
//                          groupValue: groupValue_2,
//                          onChanged: (value) {
//                            state(() {
//                              groupValue_2 = value;
//                            });
//                          },
//                          asCheckbox: true,
//                        ),
                      ],
                    ),
                    Divider(
                      height: 0.5,
                      color: Colors.grey[300],
                    ),
                  ],
                ),
              );
            }),
            _buildMiddleMargin(),
            _buildMiddleMargin(),
          ],
        ),
      ),
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

  SizedBox _buildMiddleMargin() {
    return const SizedBox(
      height: 18,
    );
  }

  SizedBox _buildSmallMargin() {
    return const SizedBox(
      height: 10,
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

  Padding _buildDesc(String desc) {
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

  Container _buildTitle(String title) {
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

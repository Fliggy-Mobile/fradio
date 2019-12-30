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

  var groupValue = '1';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 35),
              Text('自定义 Radio'),
              const SizedBox(height: 10),
              FRadio(
                value: '1',
                onChanged: (value) {},
                groupValue: '0',
                asCheckbox: true,
                width: 80,
                height: 30,
                unselectedChild: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.grey[300]),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Text(
                    '未选中',
                    style: TextStyle(color: Colors.redAccent),
                  ),
                ),
                selectedChild: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.grey[300]),
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  child: Text(
                    '选中',
                    style: TextStyle(color: Colors.greenAccent),
                  ),
                ),
              ),
              const SizedBox(height: 35),
              Text('Radio.style1'),
              const SizedBox(height: 10),
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
                    FRadio.style1(
                      value: '2',
                      groupValue: '2',
                      onChanged: (value) {},
                      asCheckbox: true,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 35),
              Text('Radio.style2'),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        '未选中状态',
                        style: TextStyle(color: Colors.grey, fontSize: 10),
                      ),
                      const SizedBox(height: 6),
                      FRadio.style2(
                        value: '2',
                        groupValue: '0',
                        onChanged: (value) {},
                        asCheckbox: true,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        '选中状态',
                        style: TextStyle(color: Colors.grey, fontSize: 10),
                      ),
                      const SizedBox(height: 6),
                      FRadio.style2(
                        value: '2',
                        groupValue: '2',
                        onChanged: (value) {},
                        asCheckbox: true,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        '不可用状态-选中',
                        style: TextStyle(color: Colors.grey, fontSize: 10),
                      ),
                      const SizedBox(height: 6),
                      FRadio.style2(
                        value: '2',
                        groupValue: '2',
                        onChanged: (value) {},
                        asCheckbox: true,
                        enable: false,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        '不可用状态-未选中',
                        style: TextStyle(color: Colors.grey, fontSize: 10),
                      ),
                      const SizedBox(height: 6),
                      FRadio.style2(
                        value: '2',
                        groupValue: '1',
                        onChanged: (value) {},
                        asCheckbox: true,
                        enable: false,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 35),
              Text('Radio.style3'),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            '未选中状态',
                            style: TextStyle(color: Colors.grey, fontSize: 10),
                          ),
                          const SizedBox(height: 6),
                          FRadio.style3(
                            value: '2',
                            groupValue: '0',
                            onChanged: (value) {},
                            asCheckbox: true,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            '选中状态',
                            style: TextStyle(color: Colors.grey, fontSize: 10),
                          ),
                          const SizedBox(height: 6),
                          FRadio.style3(
                            value: '2',
                            groupValue: '2',
                            onChanged: (value) {},
                            asCheckbox: true,
                          ),
                        ],
                      ),
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
                          FRadio.style3(
                            value: '2',
                            groupValue: '2',
                            onChanged: (value) {},
                            asCheckbox: true,
                            enable: false,
                          ),
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
                          FRadio.style3(
                            value: '2',
                            groupValue: '0',
                            onChanged: (value) {},
                            asCheckbox: true,
                            enable: false,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 35),
              Text('如何实现单选？'),
              Text(
                '通过一个公共变量 groupValue，可轻松实现单选！',
                style: TextStyle(fontSize: 10),
              ),
              const SizedBox(height: 10),
              Container(
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
                        FRadio.style1(
                          value: '0',
                          groupValue: groupValue,
                          onChanged: (value) {
                            setState(() {
                              groupValue = value;
                            });
                          },
                          asCheckbox: true,
                        ),
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
                        FRadio.style1(
                          value: '1',
                          groupValue: groupValue,
                          onChanged: (value) {
                            setState(() {
                              groupValue = value;
                            });
                          },
                          asCheckbox: true,
                        ),
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
                        FRadio.style1(
                          value: '2',
                          groupValue: groupValue,
                          onChanged: (value) {
                            setState(() {
                              groupValue = value;
                            });
                          },
                          asCheckbox: true,
                        ),
                      ],
                    ),
                    Divider(
                      height: 0.5,
                      color: Colors.grey[300],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

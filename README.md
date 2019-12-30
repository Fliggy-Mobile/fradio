# FRadio

# fapi/fradio

![](https://badgen.net/badge/tnpm/0.1.0/blue)

> [使用前请参考【Flutter组件开发使用文档】](https://yuque.antfin-inc.com/hummingbird/flutter-guide/sv9shr)

* 主理人：纽特 <coorchice.cb@alibaba-inc.com>

# 设计规范

<img src="https://gtms03.alicdn.com/tfs/TB1FJZ4RVXXXXXIXFXXXXXXXXXX-1554-340.png" />


<img src="https://gtms02.alicdn.com/tfs/TB1Yfn8RVXXXXcNXpXXXXXXXXXX-1586-334.png" />


# 使用指南

组件同时支持 **Radio 单选**、**Checkbox 多选** 两种模式。

通过传入 **Widget** 可自行定义**选中**、**未选中**、**不可用**状态的样式。

## 参数

### FRadio

![](https://gw.alicdn.com/tfs/TB1LLc5r9f2gK0jSZFPXXXsopXa-842-176.png)

|参数|类型|必要|默认值|说明|
|---|---|:---:|---|---|
|value|<T>|是|null|radio 的值|
|groupValue|<T>|是|null|radio 群组值。当该值等于 value 时，radio 为选中状态|
|onChanged|ValueChanged<T>|是|null|当 radio 状态发生变化时，会回调。如果 radio 为不可用状态，就接收不到回调|
|width|double|否|42|宽度|
|height|double|否|42|高度|
|enable|true|否|true|是否可用|
|asCheckbox|false|否|false|是否作为 Checkbox。radio 作为 Checkbox 可以自行处理状态切换|
|unselectedChild|Widget|是|null|未选中状态的样式|
|selectedChild|Widget|是|null|选中状态的样式|
|disableChild|Widget|当enable=false是为必要；反之，不必要|null|不可用状态的样式|


### FRadio.style1

![](https://gw.alicdn.com/tfs/TB1PEQ8r4D1gK0jSZFyXXciOVXa-844-210.png)

|参数|类型|必要|默认值|说明|
|---|---|:---:|---|---|
|value|<T>|是|null|radio 的值|
|groupValue|<T>|是|null|radio 群组值。当该值等于 value 时，radio 为选中状态|
|onChanged|ValueChanged<T>|是|null|当 radio 状态发生变化时，会回调。如果 radio 为不可用状态，就接收不到回调|
|width|double|否|42|宽度|
|height|double|否|42|高度|
|enable|true|否|true|是否可用|
|asCheckbox|false|否|false|是否作为 Checkbox。radio 作为 Checkbox 可以自行处理状态切换|
|color|Color|否|Color(0xffFCA500)|radio 颜色|



### FRadio.style2

![](https://gw.alicdn.com/tfs/TB12vE3r2b2gK0jSZK9XXaEgFXa-850-212.png)

|参数|类型|必要|默认值|说明|
|---|---|:---:|---|---|
|value|<T>|是|null|radio 的值|
|groupValue|<T>|是|null|radio 群组值。当该值等于 value 时，radio 为选中状态|
|onChanged|ValueChanged<T>|是|null|当 radio 状态发生变化时，会回调。如果 radio 为不可用状态，就接收不到回调|
|width|double|否|42|宽度|
|height|double|否|42|高度|
|enable|true|否|true|是否可用|
|asCheckbox|false|否|false|是否作为 Checkbox。radio 作为 Checkbox 可以自行处理状态切换|
|color|Color|否|Color(0xffFCA500)|radio 颜色|




### FRadio.style3


![](https://gw.alicdn.com/tfs/TB1P6GwrubviK0jSZFNXXaApXXa-850-258.png)


|参数|类型|必要|默认值|说明|
|---|---|:---:|---|---|
|value|<T>|是|null|radio 的值|
|groupValue|<T>|是|null|radio 群组值。当该值等于 value 时，radio 为选中状态|
|onChanged|ValueChanged<T>|是|null|当 radio 状态发生变化时，会回调。如果 radio 为不可用状态，就接收不到回调|
|width|double|否|42|宽度|
|height|double|否|42|高度|
|enable|true|否|true|是否可用|
|asCheckbox|false|否|false|是否作为 Checkbox。radio 作为 Checkbox 可以自行处理状态切换|
|color1|Color|否|Color(0xffFCA500)|radio 起始渐变色|
|color1|Color|否|Color(0xffFF9F02)|radio 结束渐变色|


## 使用示例

### 普通 FRadio

```
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
```

### FRadio.style1

```
FRadio.style1(
  value: '2',
  groupValue: '2',
  onChanged: (value) {},
  asCheckbox: true,
  color: Colors.white,
)
```

### FRadio.style2

```
FRadio.style2(
  value: '2',
  groupValue: '0',
  onChanged: (value) {},
  asCheckbox: true,
)
```


### FRadio.style3

```
FRadio.style3(
  value: '2',
  groupValue: '2',
  onChanged: (value) {},
  asCheckbox: true,
)
```


### 单选项（RadioGroup）的实现

![](https://gw.alicdn.com/tfs/TB14fE3r2b2gK0jSZK9XXaEgFXa-844-438.png)

```
// 通过一个公共 groupValue 标记当前选中那个 radio
var groupValue = '1';

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
              // 将选中的 radio 的 value 赋值给公共 groupValue
              // 调用 setState((){}) 刷新界面
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
              // 将选中的 radio 的 value 赋值给公共 groupValue
              // 调用 setState((){}) 刷新界面
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
              // 将选中的 radio 的 value 赋值给公共 groupValue
              // 调用 setState((){}) 刷新界面
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
```


[【传送门】Dartpad - button 演示](https://dartpad.dev/59912a98faaea148519f6416acc3b37c)

<iframe name="dartpad" width=90% height=1000 frameborder=0 src="https://dartpad.dev/59912a98faaea148519f6416acc3b37c"></iframe>


# 历史版本

[【传送门】组件历史版本](http://gitlab.alibaba-inc.com/fapi/radio/tags)


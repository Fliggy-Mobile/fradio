import 'package:flutter/material.dart';

class FRadio<T> extends StatefulWidget {
  final T value;

  T groupValue;

  final ValueChanged<T> onChanged;

  bool asCheckbox = false;

  Widget unselectedChild;

  Widget selectedChild;

  Widget disableChild;

  bool enable = true;

  double width;

  double height;

  T cacheGroupValue;

  FRadio({
    Key key,
    @required this.value,
    @required this.groupValue,
    @required this.onChanged,
    this.width = 42,
    this.height = 42,
    this.enable = true,
    this.asCheckbox = false,
    this.unselectedChild,
    this.selectedChild,
    this.disableChild,
  })  : cacheGroupValue = groupValue,
        assert(unselectedChild != null && selectedChild != null),
        assert(!(!enable && disableChild == null),
        "The 'disableChild' param can't be null when 'enable=false'."),
        super(key: key);

  FRadio.style1({
    Key key,
    @required this.value,
    @required this.groupValue,
    @required this.onChanged,
    this.width = 42,
    this.height = 42,
    this.enable = true,
    this.asCheckbox = false,
    Color color,
  })  : this.unselectedChild = Container(
    color: Colors.transparent,
    width: width,
    height: height,
  ),
        this.selectedChild = Container(
          width: width,
          height: height,
          child: Icon(
            Icons.check,
            color: color ?? Color(0xffFCA500),
            size: width.toDouble() / 42.toDouble() * 30.toDouble(),
          ),
        ),
        this.disableChild = Container(
          color: Colors.transparent,
          width: width,
          height: height,
        ),
        super(key: key);

  FRadio.style2({
    Key key,
    @required this.value,
    @required this.groupValue,
    @required this.onChanged,
    this.width = 42,
    this.height = 42,
    this.enable = true,
    this.asCheckbox = false,
    Color color,
  })  : this.unselectedChild = Container(
    decoration: BoxDecoration(
      // 设置边框
        border: Border.all(
            width: width / 42 * 2, color: color ?? Color(0xffE0E0E0)),
        // 设置圆角
        borderRadius: BorderRadius.all(Radius.circular(width / 42 * 6))),
  ),
        this.selectedChild = Container(
            decoration: BoxDecoration(
                color: Colors.white,
                // 设置边框
                border: Border.all(
                    width: width / 42 * 2, color: color ?? Color(0xffFCA500)),
                // 设置圆角
                borderRadius:
                BorderRadius.all(Radius.circular(width / 42 * 6))),
            child: Icon(
              Icons.check,
              color: color ?? Color(0xffFCA500),
              size: width.toDouble() / 42.toDouble() * 30.toDouble(),
            )),
        this.disableChild = Container(
          decoration: BoxDecoration(
              color: Color(0xffE0E0E0),
              // 设置边框
              border:
              Border.all(width: width / 42 * 2, color: Color(0xffCCCCCC)),
              // 设置圆角
              borderRadius: BorderRadius.all(Radius.circular(width / 42 * 6))),
          child: value == groupValue
              ? Icon(
            Icons.check,
            color: Color(0xffCCCCCC),
            size: width.toDouble() / 42.toDouble() * 30.toDouble(),
          )
              : null,
        ),
        super(key: key);

  FRadio.style3({
    Key key,
    @required this.value,
    @required this.groupValue,
    @required this.onChanged,
    this.width = 42,
    this.height = 42,
    this.enable = true,
    this.asCheckbox = false,
    Color color1,
    Color color2,
  })  : this.unselectedChild = Container(
    decoration: BoxDecoration(
      // 设置边框
        border: Border.all(
            width: width / 42 * 2, color: color1 ?? Color(0xffFF9F02)),
        // 设置圆角
        borderRadius: BorderRadius.all(Radius.circular(width / 2))),
  ),
        this.selectedChild = Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      color1 ?? Color(0xffFCD71E),
                      color2 ?? Color(0xffFF9F02)
                    ]),
                // 设置圆角
                borderRadius: BorderRadius.all(Radius.circular(width / 2))),
            child: Icon(
              Icons.check,
              color: Color(0xffffffff),
              size: width.toDouble() / 42.toDouble() * 30.toDouble(),
            )),
        this.disableChild = Container(
          decoration: BoxDecoration(
              color: Color(0xffE0E0E0),
              // 设置边框
              border:
              Border.all(width: width / 42 * 2, color: Color(0xffCCCCCC)),
              // 设置圆角
              borderRadius: BorderRadius.all(Radius.circular(width / 2))),
          child: value == groupValue
              ? Icon(
            Icons.check,
            color: Color(0xffCCCCCC),
            size: width.toDouble() / 42.toDouble() * 30.toDouble(),
          )
              : null,
        ),
        super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Radio<T>();
  }
}

class _Radio<T> extends State<FRadio<T>> {
  bool get _enabled => widget.enable && widget.onChanged != null;

  bool get _selected => widget.value == widget.groupValue;

  _handOnTap() {
    if (widget.asCheckbox) {
      setState(() {
        if (widget.groupValue == widget.value) {
          widget.groupValue = widget.cacheGroupValue;
        } else {
          widget.groupValue = widget.value;
        }
      });
    }
    widget.onChanged(widget.value);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _enabled ? _handOnTap : null,
      child: Container(
//        color: Colors.grey,
        width: widget.width,
        height: widget.height,
        child: _buildChild(),
      ),
    );
  }

  _buildChild() {
    if (widget.enable) {
      return _selected ? widget.selectedChild : widget.unselectedChild;
    } else {
      return widget.disableChild;
    }
  }
}

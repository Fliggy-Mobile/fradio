import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FRadio<T> extends StatefulWidget {
  final T value;

  final T groupValue;

  final ValueChanged<T> onChanged;

  final bool enable;

  final bool toggleable;

  final double width;

  final double height;

  final FocusNode focusNode;

  final bool autofocus;

  Widget normal;

  Widget selected;

  Widget disableNormal;

  Widget disableSelected;

  Widget hover;

  T _cacheGroupValue;

  FRadio({
    Key key,
    @required this.value,
    @required this.groupValue,
    @required this.onChanged,
    this.width = 27,
    this.height = 27,
    this.enable = true,
    this.toggleable = false,
    this.normal,
    this.focusNode,
    this.autofocus = false,
    Color selectedColor = const Color(0xff2593fc),
    Color normalColor = const Color(0xffd9d9d9),
    Gradient selectedGradient,
    double corner,
    bool hasSpace = true,
    double border,
    Widget child,
    Widget selectedChild,
    Widget hoverChild,
    Gradient gradient,
    Duration duration = const Duration(milliseconds: 180),
    bool fill = true,
  }) : super(key: key) {
    corner = corner ?? width / 2;
    border = border ?? width * 0.075;
    selected = AnimatedContainer(
      duration: duration,
      decoration: BoxDecoration(
        border: (hasSpace || !fill)
            ? Border.all(color: selectedColor, width: border)
            : null,
        borderRadius: BorderRadius.all(Radius.circular(corner)),
      ),
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        child: AnimatedContainer(
          duration: duration,
          width: hasSpace ? width * 0.518 : width,
          height: hasSpace ? height * 0.518 : height,
          decoration: fill
              ? BoxDecoration(
                  color: selectedColor,
                  borderRadius: BorderRadius.all(Radius.circular(corner)),
                  gradient: gradient,
                )
              : null,
        ),
      ),
    );
    selected = Stack(
      alignment: Alignment.center,
      children: [
        selected,
        selectedChild ?? Container(),
      ],
    );
    normal = AnimatedContainer(
      duration: duration,
      decoration: BoxDecoration(
        border: Border.all(color: normalColor, width: border),
        borderRadius: BorderRadius.all(Radius.circular(corner)),
      ),
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        child: AnimatedContainer(
          duration: duration,
          width: 0,
          height: 0,
          decoration: BoxDecoration(
            color: normalColor,
            borderRadius: BorderRadius.all(Radius.circular(corner)),
          ),
        ),
      ),
    );
    normal = Stack(
      alignment: Alignment.center,
      children: [
        normal,
        child ?? Container(),
      ],
    );
    disableSelected = ColorFiltered(
      colorFilter: ColorFilter.mode(
          Color(0xfff1f1f1).withOpacity(0.6), BlendMode.srcATop),
      child: selected,
    );
    disableNormal = ColorFiltered(
      colorFilter: ColorFilter.mode(
          Color(0xfff1f1f1).withOpacity(0.6), BlendMode.srcATop),
      child: normal,
    );
    hover = AnimatedContainer(
      duration: duration,
      decoration: BoxDecoration(
        border: Border.all(color: selectedColor, width: border),
        borderRadius: BorderRadius.all(Radius.circular(corner)),
      ),
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        child: AnimatedContainer(
          duration: duration,
          width: 0,
          height: 0,
          decoration: fill
              ? BoxDecoration(
                  color: selectedColor,
                  borderRadius: BorderRadius.all(Radius.circular(corner)),
                  gradient: gradient,
                )
              : null,
        ),
      ),
    );
    hover = Stack(
      alignment: Alignment.center,
      children: [
        hover,
        hoverChild ?? Container(),
      ],
    );
  }

  FRadio.custom({
    Key key,
    this.value,
    this.groupValue,
    this.onChanged,
    this.normal,
    this.selected,
    this.disableNormal,
    this.disableSelected,
    this.hover,
    this.enable,
    this.toggleable,
    this.width,
    this.height,
    this.focusNode,
    this.autofocus,
  }) : super(key: key) {}

  @override
  State<StatefulWidget> createState() {
    return _Radio<T>();
  }
}

class _Radio<T> extends State<FRadio<T>> {
  bool get enabled => widget.enable;

  bool get selected => widget.value == widget.groupValue;

  T cacheGroupValue;

  bool hover = false;

  @override
  void initState() {
    super.initState();
  }

  void _handOnTap() {
    if (widget.onChanged != null) {
      if (widget.toggleable) {
        widget.onChanged(selected ? null : widget.value);
      } else {
        widget.onChanged(widget.value);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    cacheGroupValue = widget.groupValue;
    Widget child = Container(
      width: widget.width,
      height: widget.height,
      child: _buildChild(),
    );
    if (enabled) {
      child = GestureDetector(
        onTap: enabled ? _handOnTap : null,
        child: child,
      );
    }
    return FocusableActionDetector(
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
      onShowFocusHighlight: _handleHighlightChanged,
      onShowHoverHighlight: _handleHoverChanged,
      child: child,
    );
  }

  _buildChild() {
    if (widget.enable) {
      Widget normal = widget.normal ?? buildDefaultNormalWidget();
      if (hover) {
        normal = widget.hover ?? normal;
      }
      return selected
          ? widget.selected ?? buildDefaultSelectedWidget()
          : normal;
    } else {
      return selected
          ? widget.disableSelected ?? buildDefaultDisableSelectedWidget()
          : widget.disableNormal ?? buildDefaultDisableNormalWidget();
    }
  }

  Widget buildDefaultSelectedWidget() {
    var duration = Duration(milliseconds: 100);
    return AnimatedContainer(
      duration: duration,
      decoration: BoxDecoration(
        border: Border.all(
            color: Color(0xff2593fc), width: widget.width * 0.2 * 0.2),
        borderRadius: BorderRadius.all(Radius.circular(widget.width)),
      ),
      child: Container(
        width: widget.width,
        height: widget.height,
        alignment: Alignment.center,
        child: AnimatedContainer(
          duration: duration,
          width: widget.width * 0.8,
          height: widget.height * 0.8,
          decoration: BoxDecoration(
            color: Color(0xff2593fc),
            borderRadius: BorderRadius.all(Radius.circular(widget.width)),
          ),
          child: Container(),
        ),
      ),
    );
  }

  Widget buildDefaultNormalWidget() {
    var duration = Duration(milliseconds: 100);
    return AnimatedContainer(
      duration: duration,
      decoration: BoxDecoration(
          border: Border.all(
              color: Color(0xffd9d9d9), width: widget.width * 0.2 * 0.2),
          borderRadius: BorderRadius.all(Radius.circular(widget.width))),
      child: Container(
        width: widget.width,
        height: widget.height,
        alignment: Alignment.center,
        child: AnimatedContainer(
          duration: duration,
          width: 0,
          height: 0,
          decoration: BoxDecoration(
            color: Color(0xffd9d9d9),
            borderRadius: BorderRadius.all(Radius.circular(widget.width)),
          ),
          child: Container(),
        ),
      ),
    );
  }

  Widget buildDefaultDisableSelectedWidget() {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
          Color(0xfff1f1f1).withOpacity(0.6), BlendMode.srcATop),
      child: buildDefaultSelectedWidget(),
    );
  }

  Widget buildDefaultDisableNormalWidget() {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
          Color(0xfff1f1f1).withOpacity(0.6), BlendMode.srcATop),
      child: buildDefaultNormalWidget(),
    );
  }

  void _handleHighlightChanged(bool value) {}

  void _handleHoverChanged(bool value) {
    setState(() {
      hover = value;
    });
  }
}

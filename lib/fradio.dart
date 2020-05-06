import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// [FRadio] 灵活精美的单选组件，使用 [FRadio] 可以快速构建出丰富而精彩的单选视图。
/// [FRadio] 允许开发者为整个单选组件的交互周期状态进行精准的配置，这对于现代应用程序是十分重要的。
/// 现在，我们用户总是期待自己的每一次交互都能获得反馈。而 [FRadio] 使得这种复杂的状态变化带来的视图变化的构建，变得异常简单。
///
/// [FRadio] Flexible and beautiful radio components, using [FRadio] can quickly build a rich and wonderful radio view.
/// [FRadio] allows developers to accurately configure the interaction cycle state of the entire radio component, which is very important for modern applications.
/// Now, our users always expect feedback from each interaction. And [FRadio] makes the construction of the view changes brought by such complex state changes extremely simple.
class FRadio<T> extends StatefulWidget {
  /// [FRadio] 所代表的的值。当 [groupValue] == [value] 时，进入选中状态。
  ///
  /// The value represented by [FRadio]. When [groupValue] == [value], enter the selected state.
  final T value;

  /// 单选组当前选中的值。当 [groupValue] == [value] 时，进入选中状态。
  ///
  /// The currently selected value of the radio group. When [groupValue] == [value], enter the selected state.
  final T groupValue;

  /// 当 [FRadio] 被变为选中时会回调
  ///
  /// Callback when [FRadio] is selected
  final ValueChanged<T> onChanged;

  /// 是否可用。不可用的 [FRadio] 将无法通过点击改变当前状态。
  /// 通过 [disableNormal] 和 [disableSelected] 可以自定义不可用状态下的样式。
  ///
  /// Usable？ Unavailable [FRadio] will not be able to change the current state with a click.
  /// Through [disableNormal] and [disableSelected] you can customize the style in the unavailable state.
  final bool enable;

  /// 是否可以取消选中。
  ///
  /// Is it possible to uncheck it.
  final bool toggleable;

  /// 宽度。
  ///
  /// width
  final double width;

  /// 高度。
  ///
  /// height.
  final double height;

  /// 焦点
  ///
  /// focusNode
  final FocusNode focusNode;

  /// 是否允许自动获取焦点
  ///
  /// Whether to allow automatic focus
  final bool autofocus;

  /// 未选中状态样式
  ///
  /// Unchecked state style
  Widget normal;

  /// 选中状态样式
  ///
  /// Selected state style
  Widget selected;

  /// 未选中状态时的不可用样式
  ///
  /// Unavailable style when unchecked
  Widget disableNormal;

  /// 选中状态样式不可用样式
  ///
  /// Unavailable styles selected
  Widget disableSelected;

  /// 鼠标进入时的样式
  ///
  /// The style when the mouse enters
  Widget hover;

  T _cacheGroupValue;

  /// 默认情况下，[FRadio] 有一套十分灵活的样式风格。
  /// 开发者无需自己配置 [normal]、[selected]、[disableNormal]、[disableSelected] 以及 [hover]。
  /// [FRadio] 提供了丰富的配置选项，以帮助开发者快速完成视图的构建。
  /// 如果在应用中有独特的设计，可以使用 [FRadio.custom] 来完成特殊样式的构建。[FRadio] 将帮助开发者完成状态管理的构建。
  ///
  /// By default, [FRadio] has a very flexible style.
  /// Developers do not need to configure [normal], [selected], [disableNormal], [disableSelected], and [hover] themselves.
  /// [FRadio] provides a wealth of configuration options to help developers quickly complete the construction of the view.
  /// If you have a unique design in your application, you can use [FRadio.custom] to complete the construction of special styles.
  /// [FRadio] will help developers complete the construction of state management.
  ///
  /// 一般参数 (General parameters)：
  ///
  /// [selectedColor] 选中状态下的颜色 (Selected color)
  ///
  /// [normalColor] 未选中状态下的颜色 (Unselected color)
  ///
  /// [hasSpace] 内部填充和边缘是否有间距。
  ///   默认为 true。间距由 [FSuper] 提供黄金比例，开发者无需关心。
  ///   (Is there a gap between the inner padding and the edges.
  ///   The default is true. The spacing is provided by [FSuper] the golden ratio, developers do not need to care.)
  ///
  /// [border] 边框宽。默认由 [FSuper] 提供黄金比例，开发者无需关心。
  ///   (The border is wide.
  ///   The default is true. The spacing is provided by [FSuper] the golden ratio, developers do not need to care.)
  ///
  /// [child] 未选中状态下的装饰组件，处于最上层级。
  ///   (The decoration components in the unselected state are at the top level.)
  ///
  /// [selectedChild] 选中状态下的装饰组件，处于最上层级。
  ///   (The decorative component in the selected state is at the top level.)
  ///
  /// [hoverChild] 鼠标悬停时的装饰组件，处于最上层级。
  ///   (The decoration component when hovering the mouse is at the top level.)
  ///
  /// [gradient] 该属性允许配置选中状态下的渐变效果，会覆盖 [selectedColor] 。
  ///   (This property allows to configure the gradient effect in the selected state, which will override [selectedColor].)
  ///
  /// [duration] 状态切换动画时长。默认 150ms。 (Duration of state switching animation. The default is 150ms.)
  ///
  /// [fill] 选中时，是否允许内部填充。默认为 true。
  ///   (When selected, whether to allow internal filling. The default is true.)
  ///
  /// [corner] 边角。默认 [FRadio] 为圆形。 (Corner. The default [FRadio] is round.)
  FRadio({
    Key key,
    @required this.value,
    @required this.groupValue,
    @required this.onChanged,
    this.width = 27,
    this.height = 27,
    this.enable = true,
    this.toggleable = false,
    this.focusNode,
    this.autofocus = false,
    Color selectedColor = const Color(0xff2593fc),
    Color normalColor = const Color(0xffd9d9d9),
    bool hasSpace = true,
    double border,
    Widget child,
    Widget selectedChild,
    Widget hoverChild,
    Gradient gradient,
    Duration duration = const Duration(milliseconds: 150),
    bool fill = true,
    FRadioCorner corner,
  }) : super(key: key) {
    if (hoverChild == null) {
      hoverChild = selectedChild;
    }
    border = border ?? width * 0.075;
    BorderRadius borderRadius = corner == null
        ? BorderRadius.all(Radius.circular(width / 2.0))
        : BorderRadius.only(
            topLeft: Radius.circular(corner.leftTopCorner),
            topRight: Radius.circular(corner.rightTopCorner),
            bottomRight: Radius.circular(corner.rightBottomCorner),
            bottomLeft: Radius.circular(corner.leftBottomCorner),
          );
    selected = AnimatedContainer(
      duration: duration,
      decoration: BoxDecoration(
        border: Border.all(
            color: (hasSpace || !fill) ? selectedColor : Colors.transparent,
            width: (hasSpace || !fill) ? border : 0),
        borderRadius: borderRadius,
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
                  borderRadius: borderRadius,
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
        borderRadius: borderRadius,
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
                  color: normalColor,
                  borderRadius: borderRadius,
                )
              : null,
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
    if (kIsWeb == true) {
      disableSelected = Container(
        foregroundDecoration: BoxDecoration(color: Color(0xfff1f1f1).withOpacity(0.6)),
        child: selected,
      );
      disableNormal = Container(
        foregroundDecoration: BoxDecoration(color: Color(0xfff1f1f1).withOpacity(0.6)),
        child: normal,
      );
    } else {
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
    }

    hover = AnimatedContainer(
      duration: duration,
      decoration: BoxDecoration(
        border: Border.all(color: selectedColor, width: border),
        borderRadius: borderRadius,
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
                  borderRadius: borderRadius,
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

  /// [FRadio.custom] 构造函数允许用户自定义配置 [normal]、[selected]、[disableNormal]、[disableSelected] 以及 [hover]。
  ///
  /// The [FRadio.custom] constructor allows users to customize the configuration [normal], [selected], [disableNormal], [disableSelected] and [hover].
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
    this.width = 27,
    this.height = 27,
    this.enable = true,
    this.toggleable = false,
    this.focusNode,
    this.autofocus = false,
  }) : super(key: key);

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
      Widget normal = widget.normal ?? buildDefault();
      if (hover) {
        normal = widget.hover ?? normal;
      }
      return selected ? widget.selected ?? buildDefault() : normal;
    } else {
      return selected
          ? widget.disableSelected ?? buildDefault()
          : widget.disableNormal ?? buildDefault();
    }
  }

  Widget buildDefault() {
    return Container(color: Colors.transparent);
  }

  void _handleHighlightChanged(bool value) {}

  void _handleHoverChanged(bool value) {
    setState(() {
      hover = value;
    });
  }
}

/// 为 [FRadio] 设置圆角。详见 [FRadio] 默认构造函数中的 [corner] 参数
///
/// Set rounded corners for [FRadio]. See the [corner] parameter in the default constructor of [FRadio] for details
class FRadioCorner {
  final double leftTopCorner;
  final double rightTopCorner;
  final double rightBottomCorner;
  final double leftBottomCorner;

  const FRadioCorner({
    this.leftTopCorner = 0,
    this.rightTopCorner = 0,
    this.rightBottomCorner = 0,
    this.leftBottomCorner = 0,
  });

  FRadioCorner.all(double radius)
      : leftTopCorner = radius,
        rightTopCorner = radius,
        rightBottomCorner = radius,
        leftBottomCorner = radius;
}

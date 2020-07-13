import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
 * 原自定义：拥有渐变色的button
 * 本人添加了个功能-》由于需求，增加修改阴影颜色
 */
class GradientButton extends StatelessWidget {
  GradientButton({
    this.colors,
    this.shadow,
    this.width,
    this.height,
    this.onPressed,
    this.borderRadius,
    this.border,
    @required this.child,
  });

  // 渐变色数组
  final List<Color> colors;

  // 按钮宽高
  final double width;
  final double height;

  final Widget child;
  final BorderRadius borderRadius;
  final Border border;

  //阴影颜色
  Color shadow;

  //点击回调
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    //确保colors数组不空
    List<Color> _colors = colors ??
        [theme.primaryColor, theme.primaryColorDark ?? theme.primaryColor];

    return DecoratedBox(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: _colors),
          borderRadius: borderRadius, // 圆角设置
          border: border, // 边框设置
          backgroundBlendMode: BlendMode.srcOver,
          // 阴影的设置
          boxShadow: [
            BoxShadow(
              color: shadow == null ? Colors.white : shadow,
              offset: Offset(1.0, 4.0),
              blurRadius: 5.0,
              // spreadRadius: 2.0,
            ),
          ]),
      child: Material(
        type: MaterialType.transparency,
        child: InkResponse(
          splashColor: _colors.last,
          highlightColor: Colors.transparent,
          radius: 0.0,
          borderRadius: borderRadius,
          onTap: onPressed,
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(height: height, width: width),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DefaultTextStyle(
                  style: TextStyle(fontWeight: FontWeight.bold),
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

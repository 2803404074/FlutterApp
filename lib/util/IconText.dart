import 'package:flutter/material.dart';

/**
 * 自定义文字图标混排组件
 * 作者：黄仕豪
 * 备注：改造https://www.cnblogs.com/yangyxd/p/13223134.html这篇博客的组件
 * 增加: 可以根据position文字和图片分别放置左、上、右、下的功能。
 * 增加：可以判断是用icon作图标还是图片资源做图标
 * 
 * 关键字：position，0、1、2、3分别表示，文字在左图标在右，文字在上图标在下，文字在右图标在左，文字在下图标在上。
 */
class IconText extends StatelessWidget {
  final String text;
  final Icon icon;
  final double iconSize;
  final Axis direction;

  final int position; //文字位置
  final String imgPath; //加载资源图片
  final double imgWidth; //资源图片宽度大小

  /// icon padding
  final EdgeInsetsGeometry padding;
  final TextStyle style;
  final int maxLines;
  final bool softWrap;
  final TextOverflow overflow;
  final TextAlign textAlign;

  const IconText(this.text,
      {Key key,
      this.icon,
      this.iconSize,
      this.direction = Axis.horizontal,
      this.position,
      this.imgPath,
      this.imgWidth,
      this.style,
      this.maxLines,
      this.softWrap,
      this.padding,
      this.textAlign,
      this.overflow = TextOverflow.ellipsis})
      : assert(direction != null),
        assert(overflow != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (position == 0) {}
    return icon == null
        ? Text(text ?? '', style: style)
        : text == null || text.isEmpty
            ? (padding == null ? icon : Padding(padding: padding, child: icon))
            : getWidget(position);
  }

//先用笨方法实现，控制图标文字位置
  Widget getWidget(int position) {
    switch (position) {
      case 0:
        return _getLeftText();
      case 1:
        return _getTopText();
      case 2:
        return _getRightText();
      case 3:
        return _getBottomText();
    }
  }

  Widget _getLeftText() {
    return RichText(
      text: TextSpan(style: style, children: [
        TextSpan(text: text),
        WidgetSpan(
            child: IconTheme(
          data: IconThemeData(
              size: iconSize ??
                  (style == null || style.fontSize == null
                      ? 16
                      : style.fontSize + 1),
              color: style == null ? null : style.color),
          child: padding == null
              ? icon
              : Padding(
                  padding: padding,
                  child: icon,
                ),
        )),
      ]),
      maxLines: maxLines,
      softWrap: softWrap ?? true,
      overflow: overflow ?? TextOverflow.clip,
      textAlign: textAlign ??
          (direction == Axis.horizontal ? TextAlign.start : TextAlign.center),
    );
  }

  Widget _getTopText() {
    return RichText(
      text: TextSpan(style: style, children: [
        TextSpan(text: "$text\n"),
        WidgetSpan(
            child: IconTheme(
          data: IconThemeData(
              size: iconSize ??
                  (style == null || style.fontSize == null
                      ? 16
                      : style.fontSize + 1),
              color: style == null ? null : style.color),
          child: padding == null
              ? icon
              : Padding(
                  padding: padding,
                  child: icon,
                ),
        )),
      ]),
      maxLines: maxLines,
      softWrap: softWrap ?? true,
      overflow: overflow ?? TextOverflow.clip,
      textAlign: textAlign ??
          (direction == Axis.horizontal ? TextAlign.start : TextAlign.center),
    );
  }

  Widget _getRightText() {
    return RichText(
      text: TextSpan(style: style, children: [
        WidgetSpan(
            child: IconTheme(
          data: IconThemeData(
              size: iconSize ??
                  (style == null || style.fontSize == null
                      ? 16
                      : style.fontSize + 1),
              color: style == null ? null : style.color),
          child: judgeImgAndIcon(),
        )),
        TextSpan(text: text),
      ]),
      maxLines: maxLines,
      softWrap: softWrap ?? true,
      overflow: overflow ?? TextOverflow.clip,
      textAlign: textAlign ??
          (direction == Axis.horizontal ? TextAlign.start : TextAlign.center),
    );
  }

  Widget _getBottomText() {
    return RichText(
      text: TextSpan(style: style, children: [
        WidgetSpan(
            child: IconTheme(
          data: IconThemeData(
              size: iconSize ??
                  (style == null || style.fontSize == null
                      ? 16
                      : style.fontSize + 1),
              color: style == null ? null : style.color),
          child: padding == null
              ? icon
              : Padding(
                  padding: padding,
                  child: icon,
                ),
        )),
        TextSpan(text: "\n$text"),
      ]),
      maxLines: maxLines,
      softWrap: softWrap ?? true,
      overflow: overflow ?? TextOverflow.clip,
      textAlign: textAlign ??
          (direction == Axis.horizontal ? TextAlign.start : TextAlign.center),
    );
  }

/**
 * 判断是用icon作图标还是图片资源做图标
 */
  Widget judgeImgAndIcon() {
    if (padding == null) {
      if (icon != null) {
        return icon;
      } else {
        Image.asset(imgPath);
      }
    } else {
      return Padding(
        padding: padding,
        child: icon == null
            ? Image.asset(
                imgPath,
                width: imgWidth,
              )
            : icon,
      );
    }
  }
}

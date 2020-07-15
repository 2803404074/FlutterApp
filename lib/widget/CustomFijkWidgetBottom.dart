import 'dart:async';
import 'dart:math';

import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';

typedef clickCallback = void Function(bool value);

class CustomFijkWidgetBottom extends StatefulWidget {
  final clickCallback onClick;
  final FijkPlayer player;
  final BuildContext buildContext;
  final Size viewSize;
  final Rect texturePos;

  CustomFijkWidgetBottom({
    @required this.player,
    this.buildContext,
    this.viewSize,
    this.texturePos,
    this.onClick,
  });

  @override
  _CustomFijkWidgetBottomState createState() =>
      _CustomFijkWidgetBottomState(onClick: this.onClick);
}

class _CustomFijkWidgetBottomState extends State<CustomFijkWidgetBottom> {
  final clickCallback onClick;
  _CustomFijkWidgetBottomState({
    this.onClick,
  });

  FijkPlayer get player => widget.player;

  bool isShowBefor = true;

  /// 播放状态
  bool _playing = false;

  /// 是否显示状态栏+菜单栏
  bool isPlayShowCont = true;

  //是否显示清晰度
  bool isShowQua = false;

  //当前清晰度,0标清，1高清，2超清
  int quaStatus = 0;

  //清晰度高度控制，窗口220和播放器高度一样，全屏模式下高度撑满。
  bool isFull = false;

  /// 总时长
  String duration = "00:00:00";

  /// 已播放时长
  String durrentPos = "00:00:00";

  /// 进度条总长度
  double maxDurations = 0.0;

  /// 流监听器
  StreamSubscription _currentPosSubs;

  /// 定时器
  Timer _timer;

  /// 进度条当前进度
  double sliderValue = 0.0;

  @override
  void initState() {
    /// 提前加载
    /// 进行监听
    widget.player.addListener(_playerValueChanged);

    /// 接收流
    _currentPosSubs = widget.player.onCurrentPosUpdate.listen((v) {
      setState(() {
        /// 实时获取当前播放进度（进度条）
        this.sliderValue = v.inMilliseconds.toDouble();

        /// 实时获取当前播放进度（数字展示）
        durrentPos = v.toString().substring(0, v.toString().indexOf("."));
      });
    });

    /// 初始化
    super.initState();
  }

  /// 监听器
  void _playerValueChanged() {
    FijkValue value = player.value;

    /// 获取进度条总时长
    maxDurations = value.duration.inMilliseconds.toDouble();

    /// 获取展示的时长
    duration = value.duration
        .toString()
        .substring(0, value.duration.toString().indexOf("."));

    /// 播放状态
    bool playing = (value.state == FijkState.started);
    if (playing != _playing) setState(() => _playing = playing);

    print("状态${value.state}");
    //播放完成
    if (value.state == FijkState.completed) {
      print('回调啦1111111111');
      this.onClick(true);
      //显示重播按钮

    }
  }

  @override
  Widget build(BuildContext context) {
    Rect rect = Rect.fromLTRB(
      max(0.0, widget.texturePos.left),
      max(0.0, widget.texturePos.top),
      min(widget.viewSize.width, widget.texturePos.right),
      min(widget.viewSize.height, widget.texturePos.bottom),
    );

    return Positioned.fromRect(
      rect: rect,
      child: GestureDetector(
        onTap: () {
          setState(() {
            /// 显示 、隐藏  进度条+标题栏
            isPlayShowCont = !isPlayShowCont;

            /// 如果显示了  , 3秒后 隐藏进度条+标题栏
            if (isPlayShowCont)
              _timer =
                  Timer(Duration(seconds: 3), () => isPlayShowCont = false);

            //隐藏清晰度视图
            isShowQua = false;
          });
        },
        child: Container(
            color: Color.fromRGBO(0, 0, 0, 0.0),
            alignment: Alignment.bottomRight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                /// 标题栏
                !isPlayShowCont
                    ? SizedBox()
                    : Container(
                        color: Color.fromRGBO(0, 0, 0, 0.45),
                        height: 40,
                        child: Row(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                if (player.value.fullScreen == false) {
                                  Navigator.pop(context);
                                } else {
                                  widget.player.pause().then((value) =>
                                      widget.player.exitFullScreen());
                                  // 延时1s执行返回
                                  Future.delayed(Duration(milliseconds: 200),
                                      () {
                                    widget.player.start();
                                  });

                                  setState(() {
                                    isShowBefor = !isShowBefor;
                                  });
                                }
                              },
                              child: Icon(
                                Icons.navigate_before,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "标题",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),

                //清晰度
                !isShowQua
                    ? SizedBox()
                    : Container(
                        height: widget.player.value.fullScreen == false
                            ? 220
                            : MediaQuery.of(context).size.height,
                        width: 100,
                        color: Color.fromRGBO(0, 0, 0, 0.45),
                        child: Column(
                          children: <Widget>[
                            Expanded(child: Text('')),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    quaStatus = 0;
                                  });
                                },
                                child: Center(
                                  child: Text(
                                    '标清',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: quaStatus == 0
                                            ? Colors.red
                                            : Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    quaStatus = 1;
                                  });
                                },
                                child: Center(
                                  child: Text(
                                    '高清',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: quaStatus == 1
                                            ? Colors.red
                                            : Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    quaStatus = 2;
                                  });
                                },
                                child: Center(
                                  child: Text(
                                    '超清',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: quaStatus == 2
                                            ? Colors.red
                                            : Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(child: Text('')),
                          ],
                        ),
                      ),

                /// 控制条
                !isPlayShowCont
                    ? SizedBox()
                    : Container(
                        color: Color.fromRGBO(0, 0, 0, 0.65),
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(
                                _playing ? Icons.pause : Icons.play_arrow,
                                color: Colors.white,
                              ),
                              onPressed: () => _playing
                                  ? widget.player.pause()
                                  : widget.player.start(),
                            ),
                            Text(
                              "${durrentPos} / ${duration}",
                              style: TextStyle(color: Colors.white),
                            ),

                            /// 进度条 使用Slider滑动组件实现
                            Expanded(
                              child: SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                  //已拖动的颜色
                                  activeTrackColor: Colors.redAccent,
                                  //未拖动的颜色
                                  inactiveTrackColor: Colors.grey,
                                  //提示进度的气泡的背景色
                                  valueIndicatorColor: Colors.redAccent,
                                  //提示进度的气泡文本的颜色
                                  valueIndicatorTextStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  //滑块中心的颜色
                                  thumbColor: Colors.redAccent,
                                  //滑块边缘的颜色
                                  overlayColor: Colors.white,
                                  //对进度线分割后，断续线中间间隔的颜色
                                  inactiveTickMarkColor: Colors.white,
                                ),
                                child: Slider(
                                  value: this.sliderValue,
                                  label:
                                      '${int.parse((this.sliderValue / 3600000).toStringAsFixed(0)) < 10 ? '0' + (this.sliderValue / 3600000).toStringAsFixed(0) : (this.sliderValue / 3600000).toStringAsFixed(0)}:${int.parse(((this.sliderValue % 3600000) / 60000).toStringAsFixed(0)) < 10 ? '0' + ((this.sliderValue % 3600000) / 60000).toStringAsFixed(0) : ((this.sliderValue % 3600000) / 60000).toStringAsFixed(0)}:${int.parse(((this.sliderValue % 60000) / 1000).toStringAsFixed(0)) < 10 ? '0' + ((this.sliderValue % 60000) / 1000).toStringAsFixed(0) : ((this.sliderValue % 60000) / 1000).toStringAsFixed(0)}',
                                  min: 0.0,
                                  max: maxDurations,
                                  divisions: 1000,
                                  onChanged: (val) {
                                    ///转化成double
                                    setState(() =>
                                        this.sliderValue = val.floorToDouble());

                                    /// 设置进度
                                    player.seekTo(this.sliderValue.toInt());
//                            print(this.sliderValue);
                                  },
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (player.value.fullScreen == false) {
                                  widget.player.pause().then((value) =>
                                      widget.player.enterFullScreen());
                                } else {
                                  widget.player.pause().then((value) =>
                                      widget.player.exitFullScreen());
                                }
                                // 延时1s执行返回
                                Future.delayed(Duration(milliseconds: 200), () {
                                  widget.player.start();
                                });

                                setState(() {
                                  isShowBefor = !isShowBefor;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 10, right: 5),
                                child: Image.asset(
                                  'images/play_rotation.png',
                                  width: 30,
                                  height: 30,
                                ),
                              ),
                            ),

                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isPlayShowCont = false;
                                  isShowQua = !isShowQua;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 5, right: 10),
                                child: Text(
                                  quaStatus == 0
                                      ? "标清"
                                      : quaStatus == 1
                                          ? "高清"
                                          : quaStatus == 2 ? "超清" : "蓝光",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
              ],
            )),
      ),
    );
  }

  @override
  void dispose() {
    /// 关闭监听
    player.removeListener(_playerValueChanged);

    /// 关闭流回调
    _currentPosSubs?.cancel();
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterapp/http/CMApi.dart';
import 'package:flutterapp/http/CMMethod.dart';
import 'package:flutterapp/http/DioManager.dart';
import 'package:flutterapp/model/UserMo.dart';
import 'dart:ui';

import 'package:flutterapp/user/find_pass_page.dart';
import 'package:flutterapp/user/register_page.dart';
import 'package:toast/toast.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var height;

  //焦点
  FocusNode _focusNodeUserName = FocusNode();
  FocusNode _focusNodePassWord = FocusNode();

  //用户名输入框控制器，此控制器可以监听用户名输入框操作
  TextEditingController _userNameController = new TextEditingController();

  //表单状态
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var _password = ''; //用户名
  var _username = ''; //密码
  var _isShowPwd = false; //是否显示密码
  var _isShowClear = false; //是否显示输入框尾部的清除按钮

  @override
  void initState() {
    // TODO: implement initState
    //设置焦点监听
    _focusNodeUserName.addListener(_focusNodeListener);
    _focusNodePassWord.addListener(_focusNodeListener);
    //监听用户名框的输入改变
    _userNameController.addListener(() {
      print(_userNameController.text);

      // 监听文本框输入变化，当有内容的时候，显示尾部清除按钮，否则不显示
      if (_userNameController.text.length > 0) {
        _isShowClear = true;
      } else {
        _isShowClear = false;
      }
      setState(() {});
    });

    height = new MediaQueryData.fromWindow(window).padding.top;
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // 移除焦点监听
    _focusNodeUserName.removeListener(_focusNodeListener);
    _focusNodePassWord.removeListener(_focusNodeListener);
    _userNameController.dispose();
    super.dispose();
  }

  // 监听焦点
  Future<Null> _focusNodeListener() async {
    if (_focusNodeUserName.hasFocus) {
      print("用户名框获取焦点");
      // 取消密码框的焦点状态
      _focusNodePassWord.unfocus();
    }
    if (_focusNodePassWord.hasFocus) {
      print("密码框获取焦点");
      // 取消用户名框焦点状态
      _focusNodeUserName.unfocus();
    }
  }

  /**
   * 验证用户名
   */
  String validateUserName(value) {
    // 正则匹配手机号
    RegExp exp = RegExp(
        r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');
    if (value.isEmpty) {
      return '用户名不能为空!';
    } else if (!exp.hasMatch(value)) {
      return '请输入正确手机号';
    }
    return null;
  }

  /**
   * 验证密码
   */
  String validatePassWord(value) {
    if (value.isEmpty) {
      return '密码不能为空';
    } else if (value.trim().length < 6 || value.trim().length > 18) {
      return '密码长度不正确';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    // logo 图片区域
    Widget logoImageArea = Container(
      margin: EdgeInsets.only(
          left: ScreenUtil().setWidth(82),
          top: ScreenUtil().setHeight(219) - height),
      // alignment: Alignment.topLeft,
      // 设置图片为圆形
      child: Text(
        '登录',
        style: TextStyle(
            fontSize: ScreenUtil().setSp(48), fontWeight: FontWeight.w600),
      ),
    );

    //输入文本框区域
    Widget inputTextArea = Container(
      margin: EdgeInsets.only(
          left: ScreenUtil().setWidth(80),
          right: ScreenUtil().setWidth(80),
          top: ScreenUtil().setHeight(100)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.white),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              controller: _userNameController,
              focusNode: _focusNodeUserName,
              //设置键盘类型
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(20),
                labelText: "用户名",
                hintText: "请输入手机号",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(15),
                  child: Image.asset(
                    'images/cellphone.png',
                    width: ScreenUtil().setWidth(24),
                    height: ScreenUtil().setWidth(30),
                  ),
                ),
                //尾部添加清除按钮
                suffixIcon: (_isShowClear)
                    ? IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          // 清空输入框内容
                          _userNameController.clear();
                        },
                      )
                    : null,
              ),
              //验证用户名
              validator: validateUserName,
              //保存数据
              onSaved: (String value) {
                _username = value;
              },
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: TextFormField(
                focusNode: _focusNodePassWord,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    labelText: "密码",
                    hintText: "请输入密码",
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(15),
                      child: Image.asset(
                        'images/password.png',
                        width: ScreenUtil().setWidth(24),
                        height: ScreenUtil().setWidth(30),
                      ),
                    ),
                    // 是否显示密码
                    suffixIcon: IconButton(
                      icon: ImageIcon((_isShowPwd)
                          ? AssetImage('images/visibility.png')
                          : AssetImage('images/visibility_off.png')),
                      // 点击改变显示或隐藏密码
                      onPressed: () {
                        setState(() {
                          _isShowPwd = !_isShowPwd;
                        });
                      },
                    )),
                obscureText: !_isShowPwd,
                //密码验证
                validator: validatePassWord,
                //保存数据
                onSaved: (String value) {
                  _password = value;
                },
              ),
            ),
          ],
        ),
      ),
    );

    // 登录按钮区域
    Widget loginButtonArea = Container(
        margin: EdgeInsets.only(
            left: ScreenUtil().setWidth(80),
            right: ScreenUtil().setWidth(80),
            top: ScreenUtil().setHeight(100)),
        alignment: Alignment(0, 0),
        height: ScreenUtil().setHeight(88),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: RaisedButton(
            elevation: 10,
            color: Colors.red[300],
            child: Text(
              "登录",
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(28),
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
            ),
            // 设置按钮圆角
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(ScreenUtil().setHeight(44))),
            onPressed: () {
              //点击登录按钮，解除焦点，回收键盘
              _focusNodePassWord.unfocus();
              _focusNodeUserName.unfocus();

              if (_formKey.currentState.validate()) {
                //只有输入通过验证，才会执行这里
                _formKey.currentState.save();
                //todo 登录操作
                DioManager().request<UserMo>(CMMethod.GET, CMApi.loginPath,
                    params: {'phone': _username, 'pass': _password},
                    success: (data) {
                  Toast.show("返回数据:${data.u_name},${data.u_pass}", context,
                      duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);

                  //print('返回数据:' + data.);
                }, error: (message) {});

                print("$_username + $_password");
              }
            },
          ),
        ));

    // 注册按钮区域
    Widget registButtonArea = Container(
      margin: EdgeInsets.only(
          left: ScreenUtil().setWidth(80),
          right: ScreenUtil().setWidth(80),
          top: ScreenUtil().setHeight(50)),
      //设置 child 居中
      alignment: Alignment(0, 0),
      height: ScreenUtil().setHeight(88),

      //边框设置
      decoration: new BoxDecoration(
        //背景
        color: Colors.white,
        //设置四周圆角 角度
        borderRadius:
            BorderRadius.all(Radius.circular(ScreenUtil().setHeight(44))),
        //设置四周边框
        border: new Border.all(width: 1, color: Colors.red),
      ),
      child: Text(
        "注册",
        style: TextStyle(
            color: Colors.red,
            fontSize: ScreenUtil().setSp(28),
            fontWeight: FontWeight.w400),
      ),
    );

    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        // 外层添加一个手势，用于点击空白部分，回收键盘
        body: GestureDetector(
            onTap: () {
              // 点击空白区域，回收键盘
              print("点击了空白区域");
              _focusNodePassWord.unfocus();
              _focusNodeUserName.unfocus();
            },
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.white, // 绘制背景颜色,否则点击事件不起作用
              padding: EdgeInsets.only(top: height),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    child: Icon(
                      Icons.navigate_before,
                      color: Colors.grey,
                      size: 45,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  logoImageArea,
                  inputTextArea,
                  loginButtonArea,
                  GestureDetector(
                    child: registButtonArea,
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return RegisterPage();
                      }));
                    },
                  ),
                  Expanded(child: Text('')),
                  Container(
                      margin: EdgeInsets.only(bottom: 10),
                      width: double.infinity,
                      child: GestureDetector(
                        child: Text(
                          '忘记密码?',
                          textAlign: TextAlign.center,
                        ),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return FindPassPage();
                          }));
                        },
                      ))
                ],
              ),
            )));
  }
}

import 'package:flutter/material.dart';
import 'dart:ui';

class FindPassPage extends StatefulWidget {
  @override
  _FindPassPageState createState() => _FindPassPageState();
}

class _FindPassPageState extends State<FindPassPage> {
  //发送验证码按钮状态标识
  var isEnableSendMessage = false;

  var height;

  //焦点
  FocusNode _focusNodeUserName = FocusNode();
  FocusNode _focusNodeUserCode = FocusNode();
  FocusNode _focusNodePassWord = FocusNode();

  //用户名输入框控制器，此控制器可以监听用户名输入框操作
  TextEditingController _userNameController = new TextEditingController();

  //表单状态
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var _password = ''; //用户名
  var _username = ''; //密码
  var _usercode = ''; //验证码
  var _isShowPwd = false; //是否显示密码
  var _isShowClear = false; //是否显示输入框尾部的清除按钮

  @override
  void initState() {
    // TODO: implement initState
    //设置焦点监听
    _focusNodeUserName.addListener(_focusNodeListener);
    _focusNodePassWord.addListener(_focusNodeListener);
    _focusNodeUserCode.addListener(_focusNodeListener);
    //监听用户名框的输入改变
    _userNameController.addListener(() {
      print(_userNameController.text);

      // 监听文本框输入变化，当有内容的时候，显示尾部清除按钮，否则不显示
      if (_userNameController.text.length > 0) {
        _isShowClear = true;
      } else {
        _isShowClear = false;
      }

      //当手机号正常时，发送验证码按钮应该改变颜色，并且可以点击状态
      setState(() {
        if (validateUserName(_userNameController.text) == null) {
          isEnableSendMessage = true;
        } else {
          isEnableSendMessage = false;
        }
      });
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
    _focusNodeUserCode.removeListener(_focusNodeListener);
    _userNameController.dispose();
    super.dispose();
  }

  // 监听焦点
  Future<Null> _focusNodeListener() async {
    if (_focusNodeUserName.hasFocus) {
      print("用户名框获取焦点");
      // 取消密码框的焦点状态
      _focusNodePassWord.unfocus();
      //取消验证码焦点
      _focusNodeUserCode.unfocus();
    }
    if (_focusNodePassWord.hasFocus) {
      print("密码框获取焦点");
      // 取消用户名框焦点状态
      _focusNodeUserName.unfocus();
      //取消验证码焦点
      _focusNodeUserCode.unfocus();
    }

    if (_focusNodeUserCode.hasFocus) {
      print("验证码框获取焦点");
      // 取消用户名框焦点状态
      _focusNodeUserName.unfocus();
      // 取消密码框的焦点状态
      _focusNodePassWord.unfocus();
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
    //标题
    Widget logoImageArea = Container(
      margin: EdgeInsets.only(left: 20, top: 50),
      alignment: Alignment.topLeft,
      child: Text(
        '重设密码',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
      ),
    );

    //输入文本框区域
    Widget inputTextArea = Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 50),
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
                prefixIcon: Icon(Icons.phone_android),
                //尾部添加清除按钮
                suffixIcon: (_isShowClear)
                    ? IconButton(
                        icon: Icon(Icons.security),
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

            //验证码
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: TextFormField(
                focusNode: _focusNodeUserCode,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  labelText: "验证码",
                  hintText: "请输入验证码",
                  prefixIcon: Icon(Icons.save),
                  suffixIcon: Padding(
                    padding: EdgeInsets.all(5),
                    child: RaisedButton(
                      elevation: 0,
                      color: isEnableSendMessage ? Colors.red : Colors.grey,
                      child: Text(
                        "发送验证码",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      // 设置按钮圆角
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      onPressed: () {
                        //手机号正确
                        if (validateUserName(_username) == null) {
                          //todo 获取验证码操作
                          print("获取验证码");
                        }
                      },
                    ),
                  ),
                ),

                obscureText: false, //是否是密码
                //密码验证
                validator: validatePassWord,
                //保存数据
                onSaved: (String value) {
                  _usercode = value;
                },
              ),
            ),

            //密码
            TextFormField(
              focusNode: _focusNodePassWord,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  labelText: "密码",
                  hintText: "请输入密码",
                  prefixIcon: Icon(Icons.lock),
                  // 是否显示密码
                  suffixIcon: IconButton(
                    icon: Icon(
                        (_isShowPwd) ? Icons.visibility : Icons.visibility_off),
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
            )
          ],
        ),
      ),
    );

    // 登录按钮区域
    Widget loginButtonArea = Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 50),
        alignment: Alignment(0, 0),
        height: 45,
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: RaisedButton(
            elevation: 10,

            color: Colors.red[300],
            child: Text(
              "注册",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            // 设置按钮圆角
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
            onPressed: () {
              //点击登录按钮，解除焦点，回收键盘
              _focusNodePassWord.unfocus();
              _focusNodeUserName.unfocus();
              _focusNodeUserCode.unfocus();

              if (_formKey.currentState.validate()) {
                //只有输入通过验证，才会执行这里
                _formKey.currentState.save();
                //todo 登录操作
                print("$_username + $_password");
              }
            },
          ),
        ));

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
              _focusNodeUserCode.unfocus();
            },
            child: Container(
              height: double.infinity,
              width: double.infinity,
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
                      }),
                  logoImageArea,
                  inputTextArea,
                  loginButtonArea,
                ],
              ),
            )));
  }
}

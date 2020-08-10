//数据基类，返回的参数为 {“code”: 0, “message”: “”, “data”: {}}

import 'EntityFactory.dart';

class BaseEntity<T> {
  int code;
  String msg;
  T result;

  BaseEntity({this.code, this.msg, this.result});

  factory BaseEntity.fromJson(json) {
    return BaseEntity(
      code: json["code"],
      msg: json["msg"],
      // data值需要经过工厂转换为我们传进来的类型
      result: EntityFactory.generateOBJ<T>(json["result"]),
    );
  }
}

//json转换辅助工厂，把json转为T
import 'package:flutterapp/model/UserMo.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (json == null) {
      return null;
    }
//可以在这里加入任何需要并且可以转换的类型，例如下面
    else if (T.toString() == "UserMo") {
      return UserMo.fromJson(json) as T;
    } else {
      return json as T;
    }
  }
}

class UserMo {
  String u_name;
  String u_pass;
  String u_icon;
  UserMo({String u_name, String u_pass, String u_icon}) {
    this.u_icon = u_icon;
    this.u_name = u_name;
    this.u_pass = u_pass;
  }

  factory UserMo.fromJson(json) {
    return UserMo(
      u_name: json["u_name"],
      u_pass: json["u_pass"],
      // data值需要经过工厂转换为我们传进来的类型
      u_icon: json["u_icon"],
    );
  }
}

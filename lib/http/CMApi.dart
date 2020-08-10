class CMApi {
  static final baseApi = "http://192.168.43.117:8082/";
  static final loginPath = "api/user/login";
  static final queryListPath =
      "/query/list"; //接口返回：{"code": ing, "message": "String", "data": [int, int, String, int, String, int]}
  static final queryListJsonPath =
      "/query/listjson"; //接口返回：{"code": int, "message": "String", "data": [{"account": "String", "password": "String"}， {"account": "String", "password": "String"}]}
}

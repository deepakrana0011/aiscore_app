class LoginResponse {
  bool success;
  String message;
  Data? data;
  String token;

  LoginResponse(
      {required this.success,
      required this.message,
      required this.data,
      required this.token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] != null ? Data.fromJson(json["data"]) : null,
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data!.toJson(),
        "token": token,
      };
}

class Data {
  String id;
  String studentName;
  String studentNo;
  int status;
  int v;
  String token;

  Data(
      {required this.id,
      required this.studentName,
      required this.studentNo,
      required this.status,
      required this.v,
      required this.token});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
      id: json["id"],
      studentName: json["studentName"],
      studentNo: json["studentNo"],
      status: json["status"],
      v: json["v"],
      token: json["token"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "studentName": studentName,
        "studentNo": studentNo,
        "status": status,
        "v": v,
        "token": token
      };
}

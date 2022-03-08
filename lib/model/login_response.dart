class LoginResponse {
  bool success;
  String message;
  Data? data;

  LoginResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] != null ? Data.fromJson(json["data"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data!.toJson(),
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
      id: json["_id"],
      studentName: json["studentName"],
      studentNo: json["studentNo"],
      status: json["status"],
      v: json["__v"],
      token: json["token"]);

  Map<String, dynamic> toJson() => {
        "_id": id,
        "studentName": studentName,
        "studentNo": studentNo,
        "status": status,
        "__v": v,
        "token": token
      };
}

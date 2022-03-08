class SignUpResponse {
  bool success;
  String message;
  Data? data;

  SignUpResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
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

  String ID;

  Data(
      {required this.id,
      required this.studentName,
      required this.studentNo,
      required this.status,
      required this.v,
      required this.ID});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
      id: json["_id"],
      studentName: json["studentName"],
      studentNo: json["studentNo"],
      status: json["status"],
      v: json["__v"],
      ID: json['id']);

  Map<String, dynamic> toJson() => {
        "_id": id,
        "studentName": studentName,
        "studentNo": studentNo,
        "status": status,
        "__v": v,
        "id": ID,
      };
}

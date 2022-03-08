import 'dart:ffi';

class GetScore {
  bool success;
  List<GetScoreData> data;

  GetScore({required this.success, required this.data});

  factory GetScore.fromJson(Map<String, dynamic> json) => GetScore(
        success: json["success"],
        data: List<GetScoreData>.from(
            json["data"].map((x) => GetScoreData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class GetScoreData {
  String id;
  String studentId;
  Double category;
  int testType;
  int time;
  int angleScore;
  int totalScore;
  int v;
  GetScoreData(
      {required this.id,
      required this.studentId,
      required this.category,
      required this.testType,
      required this.time,
      required this.angleScore,
      required this.totalScore,
      required this.v});

  factory GetScoreData.fromJson(Map<String, dynamic> json) => GetScoreData(
      id: json["_id"],
      studentId: json["studentId"],
      category: json["category"],
      testType: json["testType"],
      time: json["time"],
      angleScore: json["angleScore"],
      totalScore: json["totalScore"],
      v: json["__v"]);

  Map<String, dynamic> toJson() => {
        "_id": id,
        "student": studentId,
        "category": category,
        "testType": testType,
        "time": time,
        "angleScore": angleScore,
        "totalScore": totalScore,
        "__v": v,
      };
}

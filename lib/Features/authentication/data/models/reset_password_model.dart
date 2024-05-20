/// status : 1
/// message : "changed password"

class ResetPasswordModel {
  ResetPasswordModel({
      this.status, 
      this.message,});

  ResetPasswordModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
  }
  int? status;
  String? message;
ResetPasswordModel copyWith({  int? status,
  String? message,
}) => ResetPasswordModel(  status: status ?? this.status,
  message: message ?? this.message,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    return map;
  }

}
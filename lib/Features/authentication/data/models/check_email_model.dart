/// status : 1
/// message : "correct email"
/// access_token : "2|DIfPgH2wK6XIVitrj3hcOg4InjnPRDw73JprFpsu17eed463"

class CheckEmailModel {
  CheckEmailModel({
      this.status, 
      this.message, 
      this.accessToken,});

  CheckEmailModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    accessToken = json['access_token'];
  }
  int? status;
  String? message;
  String? accessToken;
CheckEmailModel copyWith({  int? status,
  String? message,
  String? accessToken,
}) => CheckEmailModel(  status: status ?? this.status,
  message: message ?? this.message,
  accessToken: accessToken ?? this.accessToken,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['access_token'] = accessToken;
    return map;
  }

}
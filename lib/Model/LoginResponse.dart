
class LoginResponseList {
  final List<LoginResponse> details;

  LoginResponseList({
    this.details,
  });

  factory LoginResponseList.fromJson(
      List<dynamic> parsedJson) {
    List<LoginResponse> details =
    new List<LoginResponse>();
    details = parsedJson
        .map((i) => LoginResponse.fromJson(i))
        .toList();

    return new LoginResponseList(details: details);
  }
}





class LoginResponse {
  String user;
  String success;
  String message;

  LoginResponse({this.user, this.success, this.message});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    user = json['User'];
    success = json['Success'];
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['User'] = this.user;
    data['Success'] = this.success;
    data['Message'] = this.message;
    return data;
  }
}

class BoxSaveResponseList {
  final List<BOXSaveDetails> details;

  BoxSaveResponseList({
    this.details,
  });

  factory BoxSaveResponseList.fromJson(
      List<dynamic> parsedJson) {
    List<BOXSaveDetails> details =
    new List<BOXSaveDetails>();
    details = parsedJson
        .map((i) => BOXSaveDetails.fromJson(i))
        .toList();

    return new BoxSaveResponseList(details: details);
  }
}



class BOXSaveDetails {
  String user;
  String box;
  String bin;
  String success;
  String message;

  BOXSaveDetails({this.user, this.box, this.bin, this.success, this.message});

  BOXSaveDetails.fromJson(Map<String, dynamic> json) {
    user = json['User'];
    box = json['Box'];
    bin = json['Bin'];
    success = json['Success'];
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['User'] = this.user;
    data['Box'] = this.box;
    data['Bin'] = this.bin;
    data['Success'] = this.success;
    data['Message'] = this.message;
    return data;
  }
}
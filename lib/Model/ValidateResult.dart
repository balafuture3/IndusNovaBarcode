class ValidateResultModelList {
  final List<ValidateResultModel> details;

  ValidateResultModelList({
    this.details,
  });

  factory ValidateResultModelList.fromJson(
      List<dynamic> parsedJson) {
    List<ValidateResultModel> details =
    new List<ValidateResultModel>();
    details = parsedJson
        .map((i) => ValidateResultModel.fromJson(i))
        .toList();

    return new ValidateResultModelList(details: details);
  }
}





class ValidateResultModel {
  String invoice;
  String boxnumber;
  String success;
  String message;

  ValidateResultModel(
      {this.invoice, this.boxnumber, this.success, this.message});

  ValidateResultModel.fromJson(Map<String, dynamic> json) {
    invoice = json['Invoice'];
    boxnumber = json['Boxnumber'];
    success = json['Success'];
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Invoice'] = this.invoice;
    data['Boxnumber'] = this.boxnumber;
    data['Success'] = this.success;
    data['Message'] = this.message;
    return data;
  }
}
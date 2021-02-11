
class GetOBDList {
  final List<GetOBD> details;

  GetOBDList({
    this.details,
  });

  factory GetOBDList.fromJson(
      List<dynamic> parsedJson) {
    List<GetOBD> details =
    new List<GetOBD>();
    details = parsedJson
        .map((i) => GetOBD.fromJson(i))
        .toList();

    return new GetOBDList(details: details);
  }
}




class GetOBD {
  String delivery;
  String customer;
  String customername;
  String createdon;
  String deliverydate;
  String success;
  String message;

  GetOBD(
      {this.delivery,
        this.customer,
        this.customername,
        this.createdon,
        this.deliverydate,
        this.success,
        this.message});

  GetOBD.fromJson(Map<String, dynamic> json) {
    delivery = json['Delivery'];
    customer = json['Customer'];
    customername = json['Customername'];
    createdon = json['Createdon'];
    deliverydate = json['Deliverydate'];
    success = json['Success'];
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Delivery'] = this.delivery;
    data['Customer'] = this.customer;
    data['Customername'] = this.customername;
    data['Createdon'] = this.createdon;
    data['Deliverydate'] = this.deliverydate;
    data['Success'] = this.success;
    data['Message'] = this.message;
    return data;
  }
}
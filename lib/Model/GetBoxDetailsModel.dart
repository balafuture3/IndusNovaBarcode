class GetCustomerDetailsList {
  final List<GetCustomerDetails> details;

  GetCustomerDetailsList({
    this.details,
  });

  factory GetCustomerDetailsList.fromJson(
      List<dynamic> parsedJson) {
    List<GetCustomerDetails> details =
    new List<GetCustomerDetails>();
    details = parsedJson
        .map((i) => GetCustomerDetails.fromJson(i))
        .toList();

    return new GetCustomerDetailsList(details: details);
  }
}



class GetCustomerDetails {
  String delivery;
  String customer;
  String customername;
  String createdon;
  String deliverydate;
  String material;
  String materialdescription;
  String pendingquantity;
  String requirementsegment;
  String success;
  String message;

  GetCustomerDetails(
      {this.delivery,
        this.customer,
        this.customername,
        this.createdon,
        this.deliverydate,
        this.material,
        this.materialdescription,
        this.pendingquantity,
        this.requirementsegment,
        this.success,
        this.message});

  GetCustomerDetails.fromJson(Map<String, dynamic> json) {
    delivery = json['Delivery'];
    customer = json['Customer'];
    customername = json['Customername'];
    createdon = json['Createdon'];
    deliverydate = json['Deliverydate'];
    material = json['Material'];
    materialdescription = json['Materialdescription'];
    pendingquantity = json['Pendingquantity'];
    requirementsegment = json['Requirementsegment'];
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
    data['Material'] = this.material;
    data['Materialdescription'] = this.materialdescription;
    data['Pendingquantity'] = this.pendingquantity;
    data['Requirementsegment'] = this.requirementsegment;
    data['Success'] = this.success;
    data['Message'] = this.message;
    return data;
  }
}
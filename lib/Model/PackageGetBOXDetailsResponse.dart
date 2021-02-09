
class PackageGetBOXList {
  final List<PackageGetBOXDetails> details;

  PackageGetBOXList({
    this.details,
  });

  factory PackageGetBOXList.fromJson(
      List<dynamic> parsedJson) {
    List<PackageGetBOXDetails> details =
    new List<PackageGetBOXDetails>();
    details = parsedJson
        .map((i) => PackageGetBOXDetails.fromJson(i))
        .toList();

    return new PackageGetBOXList(details: details);
  }
}



class PackageGetBOXDetails {
  String qpnumber;
  String postingdate;
  String packno;
  String documentdate;
  String boxnumber;
  String plant;
  String material;
  String materialname;
  String oldmaterial;
  String stocksegment;
  String yield;
  String confunit;
  String qcpending;
  String success;
  String message;

  PackageGetBOXDetails(
      {this.qpnumber,
        this.postingdate,
        this.packno,
        this.documentdate,
        this.boxnumber,
        this.plant,
        this.material,
        this.materialname,
        this.oldmaterial,
        this.stocksegment,
        this.yield,
        this.confunit,
        this.qcpending,
        this.success,
        this.message});

  PackageGetBOXDetails.fromJson(Map<String, dynamic> json) {
    qpnumber = json['Qpnumber'];
    postingdate = json['Postingdate'];
    packno = json['Packno'];
    documentdate = json['Documentdate'];
    boxnumber = json['Boxnumber'];
    plant = json['Plant'];
    material = json['Material'];
    materialname = json['Materialname'];
    oldmaterial = json['Oldmaterial'];
    stocksegment = json['Stocksegment'];
    yield = json['Yield'];
    confunit = json['Confunit'];
    qcpending = json['Qcpending'];
    success = json['Success'];
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Qpnumber'] = this.qpnumber;
    data['Postingdate'] = this.postingdate;
    data['Packno'] = this.packno;
    data['Documentdate'] = this.documentdate;
    data['Boxnumber'] = this.boxnumber;
    data['Plant'] = this.plant;
    data['Material'] = this.material;
    data['Materialname'] = this.materialname;
    data['Oldmaterial'] = this.oldmaterial;
    data['Stocksegment'] = this.stocksegment;
    data['Yield'] = this.yield;
    data['Confunit'] = this.confunit;
    data['Qcpending'] = this.qcpending;
    data['Success'] = this.success;
    data['Message'] = this.message;
    return data;
  }
}
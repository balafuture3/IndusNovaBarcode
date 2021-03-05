
class Page2BoxDetailModelList {
  final List<Page2BoxDetailModel> details;

  Page2BoxDetailModelList({
    this.details,
  });

  factory Page2BoxDetailModelList.fromJson(
      List<dynamic> parsedJson) {
    List<Page2BoxDetailModel> details =
    new List<Page2BoxDetailModel>();
    details = parsedJson
        .map((i) => Page2BoxDetailModel.fromJson(i))
        .toList();

    return new Page2BoxDetailModelList(details: details);
  }
}



class Page2BoxDetailModel {
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
  String grossweight;
  String bin;
  String success;
  String message;

  Page2BoxDetailModel(
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
        this.grossweight,
        this.bin,
        this.success,
        this.message});

  Page2BoxDetailModel.fromJson(Map<String, dynamic> json) {
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
    grossweight = json['Grossweight'];
    bin = json['Bin'];
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
    data['Grossweight'] = this.grossweight;
    data['Bin'] = this.bin;
    data['Success'] = this.success;
    data['Message'] = this.message;
    return data;
  }
}
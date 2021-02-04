class PackageGetBOXDetails {
  D d;

  PackageGetBOXDetails({this.d});

  PackageGetBOXDetails.fromJson(Map<String, dynamic> json) {
    d = json['d'] != null ? new D.fromJson(json['d']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.d != null) {
      data['d'] = this.d.toJson();
    }
    return data;
  }
}

class D {
  List<Results> results;

  D({this.results});

  D.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = new List<Results>();
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  Metadata mMetadata;
  String qPNumber;
  String postingDate;
  String packNo;
  String documentDate;
  String boxNumber;
  String plant;
  String material;
  String materialName;
  String oldMaterial;
  String stockSegment;
  String yield;
  String confUnit;
  String qCPending;

  Results(
      {this.mMetadata,
        this.qPNumber,
        this.postingDate,
        this.packNo,
        this.documentDate,
        this.boxNumber,
        this.plant,
        this.material,
        this.materialName,
        this.oldMaterial,
        this.stockSegment,
        this.yield,
        this.confUnit,
        this.qCPending});

  Results.fromJson(Map<String, dynamic> json) {
    mMetadata = json['__metadata'] != null
        ? new Metadata.fromJson(json['__metadata'])
        : null;
    qPNumber = json['QPNumber'];
    postingDate = json['PostingDate'];
    packNo = json['PackNo'];
    documentDate = json['DocumentDate'];
    boxNumber = json['BoxNumber'];
    plant = json['Plant'];
    material = json['Material'];
    materialName = json['MaterialName'];
    oldMaterial = json['OldMaterial'];
    stockSegment = json['StockSegment'];
    yield = json['Yield'];
    confUnit = json['ConfUnit'];
    qCPending = json['QCPending'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mMetadata != null) {
      data['__metadata'] = this.mMetadata.toJson();
    }
    data['QPNumber'] = this.qPNumber;
    data['PostingDate'] = this.postingDate;
    data['PackNo'] = this.packNo;
    data['DocumentDate'] = this.documentDate;
    data['BoxNumber'] = this.boxNumber;
    data['Plant'] = this.plant;
    data['Material'] = this.material;
    data['MaterialName'] = this.materialName;
    data['OldMaterial'] = this.oldMaterial;
    data['StockSegment'] = this.stockSegment;
    data['Yield'] = this.yield;
    data['ConfUnit'] = this.confUnit;
    data['QCPending'] = this.qCPending;
    return data;
  }
}

class Metadata {
  String id;
  String uri;
  String type;

  Metadata({this.id, this.uri, this.type});

  Metadata.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uri = json['uri'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uri'] = this.uri;
    data['type'] = this.type;
    return data;
  }
}
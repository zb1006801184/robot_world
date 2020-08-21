class MineApplyRobotModel {
  List<Records> records;
  int total;
  int size;
  int current;
  List<String> orders;
  bool optimizeCountSql;
  bool hitCount;
  bool searchCount;
  int pages;

  MineApplyRobotModel(
      {this.records,
      this.total,
      this.size,
      this.current,
      this.orders,
      this.optimizeCountSql,
      this.hitCount,
      this.searchCount,
      this.pages});

  MineApplyRobotModel.fromJson(Map<String, dynamic> json) {
    if (json['records'] != null) {
      records = new List<Records>();
      json['records'].forEach((v) {
        records.add(new Records.fromJson(v));
      });
    }
    total = json['total'];
    size = json['size'];
    current = json['current'];
    orders = json['orders'].cast<String>();
    optimizeCountSql = json['optimizeCountSql'];
    hitCount = json['hitCount'];
    searchCount = json['searchCount'];
    pages = json['pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.records != null) {
      data['records'] = this.records.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['size'] = this.size;
    data['current'] = this.current;
    data['orders'] = this.orders;
    data['optimizeCountSql'] = this.optimizeCountSql;
    data['hitCount'] = this.hitCount;
    data['searchCount'] = this.searchCount;
    data['pages'] = this.pages;
    return data;
  }
}

class Records {
  int id;
  int identity;

  String createdTime;
  String updatedTime;
  String robotName;
  String welcomes;
  String profile;
  String uniqueId;
  String applicationIndustry;
  String applicationScenarios;
  String customAnswers;
  String accountId;
  String workStatus;
  String subTitle;

  Records(
      {this.id,
      this.identity,
      this.createdTime,
      this.updatedTime,
      this.robotName,
      this.welcomes,
      this.profile,
      this.uniqueId,
      this.applicationIndustry,
      this.applicationScenarios,
      this.customAnswers,
      this.accountId,
      this.workStatus,
      this.subTitle,
      });

  Records.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdTime = json['createdTime'];
    updatedTime = json['updatedTime'];
    robotName = json['robotName'];
    identity = json['identity'];
    welcomes = json['welcomes'];
    profile = json['profile'];
    uniqueId = json['uniqueId'];
    applicationIndustry = json['applicationIndustry'];
    applicationScenarios = json['applicationScenarios'];
    customAnswers = json['customAnswers'];
    accountId = json['accountId'];
    workStatus = json['workStatus'];
    subTitle = '应用机器人';
  if (identity == 3) {
    subTitle = "帮助有能力凭借自身能力完…";
  }
  if (identity == 4) {
    subTitle = '我是BP机器人';
  }


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdTime'] = this.createdTime;
    data['updatedTime'] = this.updatedTime;
    data['robotName'] = this.robotName;
    data['welcomes'] = this.welcomes;
    data['profile'] = this.profile;
    data['uniqueId'] = this.uniqueId;
    data['applicationIndustry'] = this.applicationIndustry;
    data['applicationScenarios'] = this.applicationScenarios;
    data['customAnswers'] = this.customAnswers;
    data['accountId'] = this.accountId;
    data['workStatus'] = this.workStatus;
    data['identity'] = identity;

    return data;
  }
}

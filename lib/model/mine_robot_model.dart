class MineRobotModel {
  int id;
  String createdTime;
  String updatedTime;
  String robotName;
  String welcomes;
  String profile;
  String uniqueId;
  String applicationIndustry;
  String applicationScenarios;
  String customAnswers;
  int accountId;
  int workStatus;

  MineRobotModel(
      {this.id,
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
      this.workStatus});

  MineRobotModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdTime = json['createdTime'];
    updatedTime = json['updatedTime'];
    robotName = json['robotName'];
    welcomes = json['welcomes'];
    profile = json['profile'];
    uniqueId = json['uniqueId'];
    applicationIndustry = json['applicationIndustry'];
    applicationScenarios = json['applicationScenarios'];
    customAnswers = json['customAnswers'];
    accountId = json['accountId'];
    workStatus = json['workStatus'];
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
    return data;
  }
}
class FormListModel {
  int id;
  String bpNum;
  String projectName;
  String createdTime;
  int replyNum;

  FormListModel(
      {this.id, this.bpNum, this.projectName, this.createdTime, this.replyNum});

  FormListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bpNum = json['bpNum'];
    projectName = json['projectName'];
    createdTime = json['createdTime'];
    replyNum = json['replyNum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bpNum'] = this.bpNum;
    data['projectName'] = this.projectName;
    data['createdTime'] = this.createdTime;
    data['replyNum'] = this.replyNum;
    return data;
  }
}
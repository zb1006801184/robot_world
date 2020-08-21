class UserModel {
  String headImgUrl;
  String mobile;
  String nickname;
  int sex;
  String username;
  int robotId;
  UserModel(
      {this.headImgUrl, this.mobile, this.nickname, this.sex, this.username,this.robotId});

  UserModel.fromJson(Map<String, dynamic> json) {
    headImgUrl = json['headImgUrl'];
    mobile = json['mobile'];
    nickname = json['nickname'];
    sex = json['sex'];
    username = json['username'];
    robotId = json['robotId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['headImgUrl'] = this.headImgUrl;
    data['mobile'] = this.mobile;
    data['nickname'] = this.nickname;
    data['sex'] = this.sex;
    data['username'] = this.username;
    data['robotId'] = this.robotId;
    return data;
  }
}
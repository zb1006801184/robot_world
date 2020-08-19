class RobotModel {
  int applicationIndustry;
  int applicationScenarios;
  int id;
  String lat;
  String lng;
  String profile;
  List<QuestionVos> questionVos;
  String robotName;
  String uniqueId;
  String welcomes;

  RobotModel(
      {this.applicationIndustry,
      this.applicationScenarios,
      this.id,
      this.lat,
      this.lng,
      this.profile,
      this.questionVos,
      this.robotName,
      this.uniqueId,
      this.welcomes});

  RobotModel.fromJson(Map<String, dynamic> json) {
    applicationIndustry = json['applicationIndustry'];
    applicationScenarios = json['applicationScenarios'];
    id = json['id'];
    lat = json['lat'];
    lng = json['lng'];
    profile = json['profile'];
    if (json['questionVos'] != null) {
      questionVos = new List<QuestionVos>();
      json['questionVos'].forEach((v) {
        questionVos.add(new QuestionVos.fromJson(v));
      });
    }
    robotName = json['robotName'];
    uniqueId = json['uniqueId'];
    welcomes = json['welcomes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['applicationIndustry'] = this.applicationIndustry;
    data['applicationScenarios'] = this.applicationScenarios;
    data['id'] = this.id;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['profile'] = this.profile;
    if (this.questionVos != null) {
      data['questionVos'] = this.questionVos.map((v) => v.toJson()).toList();
    }
    data['robotName'] = this.robotName;
    data['uniqueId'] = this.uniqueId;
    data['welcomes'] = this.welcomes;
    return data;
  }
}

class QuestionVos {
  List<Answers> answers;
  String createdTime;
  int id;
  String question;
  String scene;
  String tag;
  String updatedTime;

  QuestionVos(
      {this.answers,
      this.createdTime,
      this.id,
      this.question,
      this.scene,
      this.tag,
      this.updatedTime});

  QuestionVos.fromJson(Map<String, dynamic> json) {
    if (json['answers'] != null) {
      answers = new List<Answers>();
      json['answers'].forEach((v) {
        answers.add(new Answers.fromJson(v));
      });
    }
    createdTime = json['createdTime'];
    id = json['id'];
    question = json['question'];
    scene = json['scene'];
    tag = json['tag'];
    updatedTime = json['updatedTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.answers != null) {
      data['answers'] = this.answers.map((v) => v.toJson()).toList();
    }
    data['createdTime'] = this.createdTime;
    data['id'] = this.id;
    data['question'] = this.question;
    data['scene'] = this.scene;
    data['tag'] = this.tag;
    data['updatedTime'] = this.updatedTime;
    return data;
  }
}

class Answers {
  String answer;
  String audioUrl;
  String hyperlinkUrl;
  int id;
  String imgUrl;
  String videoUrl;

  Answers(
      {this.answer,
      this.audioUrl,
      this.hyperlinkUrl,
      this.id,
      this.imgUrl,
      this.videoUrl});

  Answers.fromJson(Map<String, dynamic> json) {
    answer = json['answer'];
    audioUrl = json['audioUrl'];
    hyperlinkUrl = json['hyperlinkUrl'];
    id = json['id'];
    imgUrl = json['imgUrl'];
    videoUrl = json['videoUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['answer'] = this.answer;
    data['audioUrl'] = this.audioUrl;
    data['hyperlinkUrl'] = this.hyperlinkUrl;
    data['id'] = this.id;
    data['imgUrl'] = this.imgUrl;
    data['videoUrl'] = this.videoUrl;
    return data;
  }
}
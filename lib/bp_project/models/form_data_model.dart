class FormDataModel {
  int id;
  String bpNum;
  String projectName;
  String projectDescribe;
  String industry;
  String projectType;
  String projectCity;
  String username;
  String companyName;
  String reportTime;
  String painDescribe;
  String painOtherScheme;
  List<String> painProjectScheme;
  String painProjectSchemeDescribe;
  String technologicalInnovation;
  String patentState;
  String patentType;
  String patentNum;
  String patentPicture;
  String modeInnovation;
  List<String> projectPicture;
  String projectUrl;
  List<String> profitItems;
  String profitModelDescribe;
  String profitModelPicture;
  String projectStage;
  String projectStory;
  BpFounder bpFounder;
  String teamPicture;
  String teamMembers;
  String projectValuation;
  String valuationReasons;
  String financingAmount;
  String transferEquity;
  String financingDescribe;
  List<String> integrationWisdom;
  String integrationWisdomDescribe;
  List<String> fundPlan;
  String fundPlanDescribe;
  List<ProjectDebriefs> projectDebriefs;
  String futureDescribe;
  List<CoFounderList> coFounderList;

  FormDataModel(
      {this.id,
      this.bpNum,
      this.projectName,
      this.projectDescribe,
      this.industry,
      this.projectType,
      this.projectCity,
      this.username,
      this.companyName,
      this.reportTime,
      this.painDescribe,
      this.painOtherScheme,
      this.painProjectScheme,
      this.painProjectSchemeDescribe,
      this.technologicalInnovation,
      this.patentState,
      this.patentType,
      this.patentNum,
      this.patentPicture,
      this.modeInnovation,
      this.projectPicture,
      this.projectUrl,
      this.profitItems,
      this.profitModelDescribe,
      this.profitModelPicture,
      this.projectStage,
      this.projectStory,
      this.bpFounder,
      this.teamPicture,
      this.teamMembers,
      this.projectValuation,
      this.valuationReasons,
      this.financingAmount,
      this.transferEquity,
      this.financingDescribe,
      this.integrationWisdom,
      this.integrationWisdomDescribe,
      this.fundPlan,
      this.fundPlanDescribe,
      this.projectDebriefs,
      this.futureDescribe,
      this.coFounderList});

  FormDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bpNum = json['bpNum'];
    projectName = json['projectName'];
    projectDescribe = json['projectDescribe'];
    industry = json['industry'];
    projectType = json['projectType'];
    projectCity = json['projectCity'];
    username = json['username'];
    companyName = json['companyName'];
    reportTime = json['reportTime'];
    painDescribe = json['painDescribe'];
    painOtherScheme = json['painOtherScheme'];
    painProjectScheme = json['painProjectScheme'].cast<String>();
    painProjectSchemeDescribe = json['painProjectSchemeDescribe'];
    technologicalInnovation = json['technologicalInnovation'];
    patentState = json['patentState'];
    patentType = json['patentType'];
    patentNum = json['patentNum'];
    patentPicture = json['patentPicture'];
    modeInnovation = json['modeInnovation'];
    projectPicture = json['projectPicture'].cast<String>();
    projectUrl = json['projectUrl'];
    profitItems = json['profitItems'].cast<String>();
    profitModelDescribe = json['profitModelDescribe'];
    profitModelPicture = json['profitModelPicture'];
    projectStage = json['projectStage'];
    projectStory = json['projectStory'];
    bpFounder = json['bpFounder'] != null
        ? new BpFounder.fromJson(json['bpFounder'])
        : null;
    teamPicture = json['teamPicture'];
    teamMembers = json['teamMembers'];
    projectValuation = json['projectValuation'];
    valuationReasons = json['valuationReasons'];
    financingAmount = json['financingAmount'];
    transferEquity = json['transferEquity'];
    financingDescribe = json['financingDescribe'];
    integrationWisdom = json['integrationWisdom'].cast<String>();
    integrationWisdomDescribe = json['integrationWisdomDescribe'];
    fundPlan = json['fundPlan'].cast<String>();
    fundPlanDescribe = json['fundPlanDescribe'];
    if (json['projectDebriefs'] != null) {
      projectDebriefs = new List<ProjectDebriefs>();
      json['projectDebriefs'].forEach((v) {
        projectDebriefs.add(new ProjectDebriefs.fromJson(v));
      });
    }
    futureDescribe = json['futureDescribe'];
    if (json['coFounderList'] != null) {
      coFounderList = new List<CoFounderList>();
      json['coFounderList'].forEach((v) {
        coFounderList.add(new CoFounderList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bpNum'] = this.bpNum;
    data['projectName'] = this.projectName;
    data['projectDescribe'] = this.projectDescribe;
    data['industry'] = this.industry;
    data['projectType'] = this.projectType;
    data['projectCity'] = this.projectCity;
    data['username'] = this.username;
    data['companyName'] = this.companyName;
    data['reportTime'] = this.reportTime;
    data['painDescribe'] = this.painDescribe;
    data['painOtherScheme'] = this.painOtherScheme;
    data['painProjectScheme'] = this.painProjectScheme;
    data['painProjectSchemeDescribe'] = this.painProjectSchemeDescribe;
    data['technologicalInnovation'] = this.technologicalInnovation;
    data['patentState'] = this.patentState;
    data['patentType'] = this.patentType;
    data['patentNum'] = this.patentNum;
    data['patentPicture'] = this.patentPicture;
    data['modeInnovation'] = this.modeInnovation;
    data['projectPicture'] = this.projectPicture;
    data['projectUrl'] = this.projectUrl;
    data['profitItems'] = this.profitItems;
    data['profitModelDescribe'] = this.profitModelDescribe;
    data['profitModelPicture'] = this.profitModelPicture;
    data['projectStage'] = this.projectStage;
    data['projectStory'] = this.projectStory;
    if (this.bpFounder != null) {
      data['bpFounder'] = this.bpFounder.toJson();
    }
    data['teamPicture'] = this.teamPicture;
    data['teamMembers'] = this.teamMembers;
    data['projectValuation'] = this.projectValuation;
    data['valuationReasons'] = this.valuationReasons;
    data['financingAmount'] = this.financingAmount;
    data['transferEquity'] = this.transferEquity;
    data['financingDescribe'] = this.financingDescribe;
    data['integrationWisdom'] = this.integrationWisdom;
    data['integrationWisdomDescribe'] = this.integrationWisdomDescribe;
    data['fundPlan'] = this.fundPlan;
    data['fundPlanDescribe'] = this.fundPlanDescribe;
    if (this.projectDebriefs != null) {
      data['projectDebriefs'] =
          this.projectDebriefs.map((v) => v.toJson()).toList();
    }
    data['futureDescribe'] = this.futureDescribe;
    if (this.coFounderList != null) {
      data['coFounderList'] =
          this.coFounderList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BpFounder {
  int id;
  String name;
  String gender;
  String birthday;
  String graduatedFrom;
  String educationalBackground;
  String marriageState;
  List<String> workHistory;
  String personalDescribe;
  String lifePicture;
  int weight;

  BpFounder(
      {this.id,
      this.name,
      this.gender,
      this.birthday,
      this.graduatedFrom,
      this.educationalBackground,
      this.marriageState,
      this.workHistory,
      this.personalDescribe,
      this.lifePicture,
      this.weight});

  BpFounder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    gender = json['gender'];
    birthday = json['birthday'];
    graduatedFrom = json['graduatedFrom'];
    educationalBackground = json['educationalBackground'];
    marriageState = json['marriageState'];
    workHistory = json['workHistory'].cast<String>();
    personalDescribe = json['personalDescribe'];
    lifePicture = json['lifePicture'];
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['birthday'] = this.birthday;
    data['graduatedFrom'] = this.graduatedFrom;
    data['educationalBackground'] = this.educationalBackground;
    data['marriageState'] = this.marriageState;
    data['workHistory'] = this.workHistory;
    data['personalDescribe'] = this.personalDescribe;
    data['lifePicture'] = this.lifePicture;
    data['weight'] = this.weight;
    return data;
  }
}

class ProjectDebriefs {
  Null timeNode;
  String described;

  ProjectDebriefs({this.timeNode, this.described});

  ProjectDebriefs.fromJson(Map<String, dynamic> json) {
    timeNode = json['timeNode'];
    described = json['described'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timeNode'] = this.timeNode;
    data['described'] = this.described;
    return data;
  }
}

class CoFounderList {
  int id;
  String name;
  String gender;
  String birthday;
  String graduatedFrom;
  String educationalBackground;
  String marriageState;
  List<String> workHistory;
  String personalDescribe;
  String lifePicture;
  int weight;

  CoFounderList(
      {this.id,
      this.name,
      this.gender,
      this.birthday,
      this.graduatedFrom,
      this.educationalBackground,
      this.marriageState,
      this.workHistory,
      this.personalDescribe,
      this.lifePicture,
      this.weight});

  CoFounderList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    gender = json['gender'];
    birthday = json['birthday'];
    graduatedFrom = json['graduatedFrom'];
    educationalBackground = json['educationalBackground'];
    marriageState = json['marriageState'];
    workHistory = json['workHistory'].cast<String>();
    personalDescribe = json['personalDescribe'];
    lifePicture = json['lifePicture'];
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['birthday'] = this.birthday;
    data['graduatedFrom'] = this.graduatedFrom;
    data['educationalBackground'] = this.educationalBackground;
    data['marriageState'] = this.marriageState;
    data['workHistory'] = this.workHistory;
    data['personalDescribe'] = this.personalDescribe;
    data['lifePicture'] = this.lifePicture;
    data['weight'] = this.weight;
    return data;
  }
}


class UserQueryEntity {
  Null activityCreateTime;
  int activityDisplayType;
  Null activityRuleContent;
  Null activityTagTheme;
  int activityType;
  Null createTime;
  int enable;
  Null endTime;
  Null id;
  Null lastUpdatetime;
  String respCode;
  String respDesc;
  Null startTime;
  int status;

  UserQueryEntity(
      {this.activityCreateTime,
        this.activityDisplayType,
        this.activityRuleContent,
        this.activityTagTheme,
        this.activityType,
        this.createTime,
        this.enable,
        this.endTime,
        this.id,
        this.lastUpdatetime,
        this.respCode,
        this.respDesc,
        this.startTime,
        this.status});

  UserQueryEntity.fromJson(Map<String, dynamic> json) {
    activityCreateTime = json['activityCreateTime'];
    activityDisplayType = json['activityDisplayType'];
    activityRuleContent = json['activityRuleContent'];
    activityTagTheme = json['activityTagTheme'];
    activityType = json['activityType'];
    createTime = json['createTime'];
    enable = json['enable'];
    endTime = json['endTime'];
    id = json['id'];
    lastUpdatetime = json['lastUpdatetime'];
    respCode = json['respCode'];
    respDesc = json['respDesc'];
    startTime = json['startTime'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['activityCreateTime'] = this.activityCreateTime;
    data['activityDisplayType'] = this.activityDisplayType;
    data['activityRuleContent'] = this.activityRuleContent;
    data['activityTagTheme'] = this.activityTagTheme;
    data['activityType'] = this.activityType;
    data['createTime'] = this.createTime;
    data['enable'] = this.enable;
    data['endTime'] = this.endTime;
    data['id'] = this.id;
    data['lastUpdatetime'] = this.lastUpdatetime;
    data['respCode'] = this.respCode;
    data['respDesc'] = this.respDesc;
    data['startTime'] = this.startTime;
    data['status'] = this.status;
    return data;
  }

}

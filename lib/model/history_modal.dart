class MeetingScheduleModal {
  Body body;
  String status;

  MeetingScheduleModal({this.body, this.status});

  MeetingScheduleModal.fromJson(Map<String, dynamic> json) {
    body = json['body'] != null ? new Body.fromJson(json['body']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.body != null) {
      data['body'] = this.body.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Body {
  List<Histories> histories;

  Body({this.histories});

  Body.fromJson(Map<String, dynamic> json) {
    if (json['histories'] != null) {
      histories = <Histories>[];
      json['histories'].forEach((v) {
        histories.add(new Histories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.histories != null) {
      data['histories'] = this.histories.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Histories {
  String name;
  String startTime;
  String endTime;

  Histories({this.name, this.startTime, this.endTime});

  Histories.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    startTime = json['start_time'];
    endTime = json['end_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    return data;
  }
}
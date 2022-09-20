import 'schudlemeetmodal.dart';
class LeaveCallModal {
  List<Body> body;
  String status;

  LeaveCallModal({this.body, this.status});

  LeaveCallModal.fromJson(Map<String, dynamic> json) {
    if (json['body'] != null) {
      body = <Null>[];
      json['body'].forEach((v) {
        body.add(new Body.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.body != null) {
      data['body'] = this.body.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

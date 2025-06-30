class SecureResponse {
  bool? status;
  String? message;
  Data? data;

  SecureResponse({this.status, this.message, this.data});

  SecureResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? secret;
  String? url;
  List<String>? recoveryCodes;

  Data({this.secret, this.url, this.recoveryCodes});

  Data.fromJson(Map<String, dynamic> json) {
    secret = json['secret'];
    url = json['url'];
    recoveryCodes = json['recoveryCodes'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['secret'] = this.secret;
    data['url'] = this.url;
    data['recoveryCodes'] = this.recoveryCodes;
    return data;
  }
}

class SecureResponse {
  bool? status;
  String? message;
  Data? data;

  SecureResponse({this.status, this.message, this.data});

  SecureResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['secret'] = secret;
    data['url'] = url;
    data['recoveryCodes'] = recoveryCodes;
    return data;
  }
}

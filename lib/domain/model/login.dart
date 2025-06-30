class LoginResponse {
  String? status;
  String? email;
  Data? data;

  LoginResponse({this.email,this.status, this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    //status = json['status'];
    status = json['status'];
    email = json['email'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? email;
  String? password;
  String? fullname;
  String? level;
  bool? isEmailVerified;
  bool? isSuspended;
  bool? isBanned;
  bool? isVerified;
  List<Null>? referralPath;
  String? referralCode;
  String? privateKey;
  String? depositWalletAddress;
  List<String>? role;
  List<Null>? withdrawalWallets;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? token;

  Data(
      {this.sId,
        this.email,
        this.password,
        this.fullname,
        this.level,
        this.isEmailVerified,
        this.isSuspended,
        this.isBanned,
        this.isVerified,
        this.referralPath,
        this.referralCode,
        this.privateKey,
        this.depositWalletAddress,
        this.role,
        this.withdrawalWallets,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.token});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    password = json['password'];
    fullname = json['fullname'];
    level = json['level'];
    isEmailVerified = json['isEmailVerified'];
    isSuspended = json['isSuspended'];
    isBanned = json['isBanned'];
    isVerified = json['isVerified'];
    // if (json['referralPath'] != null) {
    //   referralPath = <Null>[];
    //   json['referralPath'].forEach((v) {
    //     referralPath!.add(new Null.fromJson(v));
    //   });
    // }
    referralCode = json['referralCode'];
    privateKey = json['privateKey'];
    depositWalletAddress = json['depositWalletAddress'];
    role = json['role'].cast<String>();
    // if (json['withdrawalWallets'] != null) {
    //   withdrawalWallets = <Null>[];
    //   json['withdrawalWallets'].forEach((v) {
    //     withdrawalWallets!.add(new Null.fromJson(v));
    //   });
    // }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['password'] = this.password;
    data['fullname'] = this.fullname;
    data['level'] = this.level;
    data['isEmailVerified'] = this.isEmailVerified;
    data['isSuspended'] = this.isSuspended;
    data['isBanned'] = this.isBanned;
    data['isVerified'] = this.isVerified;
    // if (this.referralPath != null) {
    //   data['referralPath'] = this.referralPath!.map((v) => v.toJson()).toList();
    // }
    data['referralCode'] = this.referralCode;
    data['privateKey'] = this.privateKey;
    data['depositWalletAddress'] = this.depositWalletAddress;
    data['role'] = this.role;
    // if (this.withdrawalWallets != null) {
    //   data['withdrawalWallets'] =
    //       this.withdrawalWallets!.map((v) => v.toJson()).toList();
    // }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['token'] = this.token;
    return data;
  }
}

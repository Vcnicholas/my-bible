class UserResponse {
  bool? status;
  String? message;
  Data? data;

  UserResponse({this.status, this.message, this.data});

  UserResponse.fromJson(Map<String, dynamic> json) {
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
  Null? fifthUpLiner;
  Null? firstUpLiner;
  Null? fourthUpLiner;
  Null? secondUpLiner;
  Null? thirdUpLiner;
  int? unClaimedReferralEarnings;
  int? walletBalance;
  LevelAchievements? levelAchievements;
  bool? mfaIsVerified;
  bool? mfaIsSetup;
  bool? mfaIsEnabled;

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
        this.fifthUpLiner,
        this.firstUpLiner,
        this.fourthUpLiner,
        this.secondUpLiner,
        this.thirdUpLiner,
        this.unClaimedReferralEarnings,
        this.walletBalance,
        this.levelAchievements,
        this.mfaIsVerified,
        this.mfaIsSetup,
        this.mfaIsEnabled});

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
    fifthUpLiner = json['fifthUpLiner'];
    firstUpLiner = json['firstUpLiner'];
    fourthUpLiner = json['fourthUpLiner'];
    secondUpLiner = json['secondUpLiner'];
    thirdUpLiner = json['thirdUpLiner'];
    unClaimedReferralEarnings = json['unClaimedReferralEarnings'];
    walletBalance = json['walletBalance'];
    levelAchievements = json['levelAchievements'] != null
        ? new LevelAchievements.fromJson(json['levelAchievements'])
        : null;
    mfaIsVerified = json['mfaIsVerified'];
    mfaIsSetup = json['mfaIsSetup'];
    mfaIsEnabled = json['mfaIsEnabled'];
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
    data['fifthUpLiner'] = this.fifthUpLiner;
    data['firstUpLiner'] = this.firstUpLiner;
    data['fourthUpLiner'] = this.fourthUpLiner;
    data['secondUpLiner'] = this.secondUpLiner;
    data['thirdUpLiner'] = this.thirdUpLiner;
    data['unClaimedReferralEarnings'] = this.unClaimedReferralEarnings;
    data['walletBalance'] = this.walletBalance;
    if (this.levelAchievements != null) {
      data['levelAchievements'] = this.levelAchievements!.toJson();
    }
    data['mfaIsVerified'] = this.mfaIsVerified;
    data['mfaIsSetup'] = this.mfaIsSetup;
    data['mfaIsEnabled'] = this.mfaIsEnabled;
    return data;
  }
}

class LevelAchievements {
  Unranked? unranked;
  Unranked? sergent;
  Unranked? commander;
  Unranked? major;
  Unranked? general;
  Unranked? globalAmbassador;

  LevelAchievements(
      {this.unranked,
        this.sergent,
        this.commander,
        this.major,
        this.general,
        this.globalAmbassador});

  LevelAchievements.fromJson(Map<String, dynamic> json) {
    unranked = json['Unranked'] != null
        ? new Unranked.fromJson(json['Unranked'])
        : null;
    sergent =
    json['Sergent'] != null ? new Unranked.fromJson(json['Sergent']) : null;
    commander = json['Commander'] != null
        ? new Unranked.fromJson(json['Commander'])
        : null;
    major = json['Major'] != null ? new Unranked.fromJson(json['Major']) : null;
    general =
    json['General'] != null ? new Unranked.fromJson(json['General']) : null;
    globalAmbassador = json['Global Ambassador'] != null
        ? new Unranked.fromJson(json['Global Ambassador'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.unranked != null) {
      data['Unranked'] = this.unranked!.toJson();
    }
    if (this.sergent != null) {
      data['Sergent'] = this.sergent!.toJson();
    }
    if (this.commander != null) {
      data['Commander'] = this.commander!.toJson();
    }
    if (this.major != null) {
      data['Major'] = this.major!.toJson();
    }
    if (this.general != null) {
      data['General'] = this.general!.toJson();
    }
    if (this.globalAmbassador != null) {
      data['Global Ambassador'] = this.globalAmbassador!.toJson();
    }
    return data;
  }
}

class Unranked {
  int? teamSize;
  int? totalTeamDeposits;
  int? levelAchievmentCashPrize;
  int? teamAchievmentCashPrize;
  Null? additionalPrize;
  bool? fulfilled;

  Unranked(
      {this.teamSize,
        this.totalTeamDeposits,
        this.levelAchievmentCashPrize,
        this.teamAchievmentCashPrize,
        this.additionalPrize,
        this.fulfilled});

  Unranked.fromJson(Map<String, dynamic> json) {
    teamSize = json['teamSize'];
    totalTeamDeposits = json['totalTeamDeposits'];
    levelAchievmentCashPrize = json['levelAchievmentCashPrize'];
    teamAchievmentCashPrize = json['teamAchievmentCashPrize'];
    additionalPrize = json['additionalPrize'];
    fulfilled = json['fulfilled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['teamSize'] = this.teamSize;
    data['totalTeamDeposits'] = this.totalTeamDeposits;
    data['levelAchievmentCashPrize'] = this.levelAchievmentCashPrize;
    data['teamAchievmentCashPrize'] = this.teamAchievmentCashPrize;
    data['additionalPrize'] = this.additionalPrize;
    data['fulfilled'] = this.fulfilled;
    return data;
  }
}

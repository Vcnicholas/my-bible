import 'dart:convert';
import 'dart:math';

import 'package:bible/data/services/user_services.dart';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import '../../domain/model/auth_response.dart';
import '../../domain/model/login.dart';
import '../../domain/model/secure.dart';
import '../../domain/model/users.dart';
import '../../domain/model/verify.dart';
import '../../domain/model/wallet_response.dart';
import '../../locator.dart';
import '../core/config.dart';
import '../core/network/error_handler.dart';
import '../core/network/urlPath.dart';
import 'app_cache.dart';

/// This calls implements the UserRemote logic
class RemoteServices {
  final UserServices userServices;
  AppCache cache = getIt<AppCache>();
  final Dio dio;

  RemoteServices(
    this.dio,
    this.userServices,
  );



  Future<AuthResponse?> login(String email, String password) async {
    final box = GetStorage();
    try {
      // the required parameters
      var dataBody = {
        'email': email,
        'password': password,
      };
      Dio _dio = Dio();
      var response = await dio.post("${Config.BASEURL}${UrlPath.login}",
          data: dataBody,
          options: Options(followRedirects: true, headers: {
            "Accept": "application/json",
            //"Api-Key": UrlPath.apiKey,
          }));
      final responseData = AuthResponse.fromJson(response.data);
      // trying to get the token from the response and storing using secureStoragee
      final token = responseData.data;
      snackBars(token!, true);
      box.write('token', token.toString());
      return responseData;
    } on DioError catch (err) {
      handleError(err);
      rethrow;
    }
  }


  @override
  Future<LoginResponse?> register(String email,) async {
    final box = GetStorage();
    try {
      // the required parameters
      var dataBody = {
        'email': email,
        'type':'emailVerification'
      };
      Dio _dio = Dio();
      var response = await dio.post("${Config.BASEURL}${UrlPath.register}",
          data: dataBody,
          options: Options(followRedirects: true, headers: {
            "Accept": "application/json",
            //"Api-Key": UrlPath.apiKey,
          }));
      final responseData = LoginResponse.fromJson(response.data);
      // trying to get the token from the response and storing using secureStorage
      // final token = responseData.data?.token;
      // box.write('token', token.toString());
      return responseData;
    } on DioError catch (err) {
      handleError(err);
      rethrow;
    }
  }

@override
  Future<Response> verifyUnboardedEmail(String code, String email) async {
  final box = GetStorage();
  String? userToken = box.read('token');
    try {
      // the required parameters
      var dataBody = {
        'otp': code,
        'email': email
      };
      Dio _dio = Dio();
      var response = await dio.post("${Config.BASEURL}${UrlPath.verifyUnboardedEmail}",
          data: dataBody,
          options: Options(followRedirects: true, headers: {
            "Accept": "application/json",
            //"Api-Key": UrlPath.apiKey,
            //'Authorization': "Bearer $userToken",
          }));
      return response;
    } on DioError catch (err) {
      handleError(err);
      rethrow;
    }
  }

  @override
  Future<Response> resendVerificationOtp(String email) async {
    final box = GetStorage();
    String? userToken = box.read('token');
    try {
      // the required parameters
      var dataBody = {
        'email': email,
        'type': 'emailVerification'
      };
      Dio _dio = Dio();
      var response = await dio.post("${Config.BASEURL}${UrlPath.resendVerificationOtp}",
          data: dataBody,
          options: Options(followRedirects: true, headers: {
            "Accept": "application/json",
            //"Api-Key": UrlPath.apiKey,
            //'Authorization': "Bearer $userToken",
          }));
      return response;
    } on DioError catch (err) {
      handleError(err);
      rethrow;
    }
  }

  @override
  Future<Response> updateBiodata(String email, String firstname, String lastname, String country, String accountType, String phonenumber) async {
    final box = GetStorage();
    String? userToken = box.read('token');
    try {
      // the required parameters
      var dataBody = {
        'email': email,
        'firstname': firstname,
        'lastname': lastname,
        'country': country,
        'accountType': accountType,
        'phone': phonenumber


      };
      Dio _dio = Dio();
      var response = await dio.post("${Config.BASEURL}${UrlPath.updateBiodata}",
          data: dataBody,
          options: Options(followRedirects: true, headers: {
            "Accept": "application/json",
            //"Api-Key": UrlPath.apiKey,
            //'Authorization': "Bearer $userToken",
          }));
      return response;
    } on DioError catch (err) {
      handleError(err);
      rethrow;
    }
  }

  @override
  Future<Response> verifyAccessCode(String email, String accessCode) async {
    final box = GetStorage();
    String? userToken = box.read('token');
    try {
      // the required parameters
      var dataBody = {
        'email': email,
        'code': accessCode,
      };
      Dio _dio = Dio();
      var response = await dio.post("${Config.BASEURL}${UrlPath.verifyAccessCode}",
          data: dataBody,
          options: Options(followRedirects: true, headers: {
            "Accept": "application/json",
            //"Api-Key": UrlPath.apiKey,
            //'Authorization': "Bearer $userToken",
          }));
      return response;
    } on DioError catch (err) {
      handleError(err);
      rethrow;
    }
  }

  @override
  Future<Response> storePassword(String email, String accessCode, String password) async {
    final box = GetStorage();
    String? userToken = box.read('token');
    try {
      // the required parameters
      var dataBody = {
        'email': email,
        'password': password,
        'accessCode': accessCode,
      };
      Dio _dio = Dio();
      var response = await dio.post("${Config.BASEURL}${UrlPath.storePassword}",
          data: dataBody,
          options: Options(followRedirects: true, headers: {
            "Accept": "application/json",
            //"Api-Key": UrlPath.apiKey,
            //'Authorization': "Bearer $userToken",
          }));
      return response;
    } on DioError catch (err) {
      handleError(err);
      rethrow;
    }
  }

  @override
  Future<KycResponse> getKycLinks(String token, String idempotencyKey) async {
    final box = GetStorage();
    String? userToken = box.read(Boxes.userToken);
    try {
      var dataBody = {
        'idempotency_key': idempotencyKey,
      };
      Dio _dio = Dio();
      var response = await dio.get("${Config.BASEURL}${UrlPath.getKycLinks}",
          //data: dataBody,
          queryParameters: dataBody,
          options: Options(followRedirects: true, headers: {
            "Accept": "application/json",
            //"Api-Key": UrlPath.apiKey,
            'authorization': "Bearer $token",
          }));
      //print(${Config.BASEURL}${UrlPath.getKycLinks})
      print('thr response is');
      print(response..toString());
      await box.write(Boxes.kycDetails, jsonEncode(KycResponse.fromJson(response.data)));
      final responseData = KycResponse.fromJson(response.data);
      print('the kyc details arw stiored');
      return responseData;
    } on DioError catch (err) {
      handleError(err);
      rethrow;
    }
  }

@override
Future<Response> verifyOTP (String email, String code) async{
    try{
      var dataBody = {
        'email': email,
        'otp' : code
  };
      var response = await dio.post("${Config.BASEURL}${UrlPath.verifyUnboardedEmail}",
          data: dataBody,
          options: Options(followRedirects: true, headers: {
            "Accept": "application/json",
  }
  ));
      return response;
  }catch(err){
      handleError(err);
      rethrow;
  }
}

@override
  Future<VerifyResponse?> resendOTP(String email) async {
    final box = GetStorage();
    try {
      // the required parameters
      var dataBody = {
        'email': email,
      };
      var response = await dio.post("${Config.BASEURL}${UrlPath.resendOTP}",
          data: dataBody,
          options: Options(followRedirects: true, headers: {
            "Accept": "application/json",
            //"Api-Key": UrlPath.apiKey,
          }));
      final responseData = VerifyResponse.fromJson(response.data);
      // trying to get the token from the response and storing using secureStorage
      final token = responseData.data?.token;
      box.write('token', token.toString());
      return responseData;
    } on DioError catch (err) {
      handleError(err);
      rethrow;
    }
  }
//
@override
  Future<VerifyResponse?> requestPassword(String email) async {
    final box = GetStorage();
    try {
      // the required parameters
      var dataBody = {
        'email': email,
      };
      Dio _dio = Dio();
      var response = await dio.post("${Config.BASEURL}${UrlPath.requestPassword}",
          data: dataBody,
          options: Options(followRedirects: true, headers: {
            "Accept": "application/json",
            //"Api-Key": UrlPath.apiKey,
          }));
      final responseData = VerifyResponse.fromJson(response.data);
      // trying to get the token from the response and storing using secureStorage
      final token = responseData.data?.token;
      box.write('token', token.toString());
      return responseData;
    } on DioError catch (err) {
      handleError(err);
      rethrow;
    }
  }

  @override
  Future<VerifyResponse?> resendPasswordOTP(String email) async {
    final box = GetStorage();
    try {
      // the required parameters
      var dataBody = {
        'email': email,
      };
      Dio _dio = Dio();
      var response = await dio.post("${Config.BASEURL}${UrlPath.resendPasswordOTP}",
          data: dataBody,
          options: Options(followRedirects: true, headers: {
            "Accept": "application/json",
            //"Api-Key": UrlPath.apiKey,
          }));
      final responseData = VerifyResponse.fromJson(response.data);
      // trying to get the token from the response and storing using secureStorage
      final token = responseData.data?.token;
      box.write('token', token.toString());
      return responseData;
    } on DioError catch (err) {
      handleError(err);
      rethrow;
    }
  }
//
  @override
  Future<VerifyResponse?> resetPassword(code,String password,) async {
    final box = GetStorage();
    String? userToken = box.read('token');
    try {
      // the required parameters
      var dataBody = {
        'otp':code,
        'password': password,
      };
      Dio _dio = Dio();
      var response = await dio.post("${Config.BASEURL}${UrlPath.resetPassword}",
          data: dataBody,
          options: Options(followRedirects: true, headers: {
            "Accept": "application/json",
            //"Api-Key": UrlPath.apiKey,
            'Authorization': "Bearer $userToken",
          }));
      final responseData = VerifyResponse.fromJson(response.data);
      // trying to get the token from the response and storing using secureStorage
      final token = responseData.data?.token;
      box.write('token', token.toString());
      return responseData;
    } on DioError catch (err) {
      handleError(err);
      rethrow;
    }
  }

  @override
  Future<SecureResponse?> secureAuth() async {
    final box = GetStorage();
    String? userToken = box.read('token');
    try {
      Dio _dio = Dio();
      var response = await dio.post("${Config.BASEURL}${UrlPath.secureAuth}",
          options: Options(followRedirects: true, headers: {
            "Accept": "application/json",
            //"Api-Key": UrlPath.apiKey,
            'Authorization': "Bearer $userToken",
          }));
      final responseData = SecureResponse.fromJson(response.data);
      if(responseData.data!=null){
        userServices.secureAth(responseData);
      }
      return responseData;
    } on DioError catch (err) {
      handleError(err);
      rethrow;
    }
  }

@override
  Future<String?> updateProfile(String fullname) async {
    final box = GetStorage();
    String? userToken = box.read('token');
    try {
      var dataBody = {
        'fullname': fullname,
      };
      Dio _dio = Dio();
      var response = await dio.put("${Config.BASEURL}${UrlPath.user}",
          data: dataBody,
          options: Options(followRedirects: true, headers: {
            "Accept": "application/json",
            //"Api-Key": UrlPath.apiKey,
            'Authorization': "Bearer $userToken",
          }));

      return response.data.toString();
    } on DioError catch (err) {
      handleError(err);
      rethrow;
    }
  }

@override
  Future<String?> changePassword(String old_password,String password,) async {
    final box = GetStorage();
    String? userToken = box.read('token');
    try {
      var dataBody = {
        'old_password': old_password,
        'password': password,
      };
      Dio _dio = Dio();
      var response = await dio.put("${Config.BASEURL}${UrlPath.changePassword}",
          data: dataBody,
          options: Options(followRedirects: true, headers: {
            "Accept": "application/json",
            //"Api-Key": UrlPath.apiKey,
            'Authorization': "Bearer $userToken",
          }));

      return response.data.toString();
    } on DioError catch (err) {
      handleError(err);
      rethrow;
    }
  }


  @override
  Future<Wallet?> getUserWalletDetails(String token) async {
    final box = GetStorage();
    String? userToken = box.read(Boxes.userToken);

    try {
      Dio dio = Dio();
      var response = await dio.get(
        "${Config.BASEURL}${UrlPath.getWallet}",
        options: Options(
          followRedirects: true,
          headers: {
            "Accept": "application/json",
            'authorization': "Bearer $userToken",
          },
        ),
      );

      print('User wallet fetched successfully. Data:');
      print(response.data);

      final jsonData = response.data;

      try {
        // Try parsing full Wallet
        final wallet = Wallet.fromJson(jsonData);
        await box.write(Boxes.walletDetails, jsonEncode(wallet.toJson()));
        print('Stored full wallet: ${wallet.solWallet.toJson()}');
        return wallet;
      } catch (e) {
        // Fall back to storing only solWallet if full Wallet fails
        if (jsonData['solWallet'] != null) {
          final solWallet = SolWallet.fromJson(jsonData['solWallet']);
          await box.write(Boxes.walletDetails, jsonEncode({'solWallet': solWallet.toJson()}));
          print('Stored only solWallet: ${solWallet.toJson()}');
          return null; // Or return a partial Wallet wrapper if needed
        } else {
          print("Neither wallet nor solWallet present in response");
          return null;
        }
      }
    } on DioError catch (err) {
      handleError(err);
      rethrow;
    }
  }


  Future<Response> getBalance(String token)async{
    final box = GetStorage();
    try {
      Dio _dio = Dio();
      var response = await dio.get("${Config.BASEURL}${UrlPath.getWalletBalance}",
          options: Options(followRedirects: true, headers: {
            "Accept": "application/json",
            'authorization': "Bearer $token",
          }));
      print('the user balance is gotten successfully abd below is the data');
      print(response.data);
      return response;
    } on DioError catch (err) {
      handleError(err);
      rethrow;
    }
  }

  Future<Response> getTransactionsHistory(String token)async{
    final box = GetStorage();
    try {
      Dio _dio = Dio();
      var response = await dio.get("${Config.BASEURL}${UrlPath.getTransactionHistory}",
          options: Options(followRedirects: true, headers: {
            "Accept": "application/json",
            'authorization': "Bearer $token",
          }));
      return response;
    } on DioError catch (err) {
      handleError(err);
      rethrow;
    }
  }

  @override
  Future<Response> bucxtobank(String token) async {
    final box = GetStorage();
    String? userToken = box.read(Boxes.userToken);
    var dataBody = {
      'sender': {
        'rail': 'BRIDGE_PAYMENT_RAIL',
        'customerId': 'someCustomerId',
        'walletAddress': 'someWalletAddress',
        'currency': 'BRIDGE_CURRENCY',
      },
      'receiver': {
        'rail': 'BRIDGE_PAYMENT_RAIL',
        'external_account_id': 'someExternalAccountId',
        'currency': 'BRIDGE_CURRENCY',
        'nickname': 'optionalNickname', // you can remove if null
      },
      'amount': '1000', // or your dynamic value
      'idempotency_key': 'uniqueKey123' // generate uniquely each time if needed
    };
    try {
      Dio dio = Dio();
      var response = await dio.post(
        "${Config.BASEURL}${UrlPath.getWallet}",
        data: dataBody, // ✅ pass the body here
        options: Options(
          followRedirects: true,
          headers: {
            "Accept": "application/json",
            'Authorization': "Bearer $userToken",
          },
        ),
      );
      return response;
    } on DioError catch (err) {
      handleError(err);
      rethrow;
    }
  }
  @override
  Future<Response> bucxtobucx(String token, String receiverEmail, String nickname, String amount, String idempotencyKey) async {
    final box = GetStorage();
    String? userToken = box.read(Boxes.userToken);
    var dataBody = {
      'type' : 'bucxtobucx',
      'data': {'sender': {
        'currency': 'usdc',
      },
        'receiver': {
          'email': receiverEmail,
          'currency': 'usdc',
          'nickname': nickname
        },
        'amount': amount,
        'idempotency_key': idempotencyKey,}
    };

    try {
      Dio dio = Dio();
      var response = await dio.post(
        "${Config.BASEURL}${UrlPath.initiateTransfer}",
        data: dataBody, // ✅ pass the body here
        options: Options(
          followRedirects: true,
          headers: {
            "Accept": "application/json",
            'Authorization': "Bearer $userToken",
          },
        ),
      );
      return response;
    } on DioError catch (err) {
      handleError(err);
      rethrow;
    }
  }
  @override
  Future<Response> bucxtocrypto(String token, String customerId, String senderWalletAddress, String amount, String idempotencyKey,String nickname, String receiverAddress) async {
    final box = GetStorage();
    String? userToken = box.read(Boxes.userToken);
    var dataBody = {
    'type' : 'tokentotoken',
    'data':{  'sender': {
    'rail': 'solana',
    'customerId': customerId,
    'walletAddress': senderWalletAddress,
    'currency': 'usdc',
    },
    'receiver': {
    'rail': 'solana',
    'walletAddress': receiverAddress,
    'currency': 'usdc',
    'nickname': nickname, // you can remove if null
    },
    'amount': amount, // or your dynamic value
    'idempotency_key': idempotencyKey // generate uniquely each time if needed}
    }};
    try {
      Dio dio = Dio();
      var response = await dio.post(
        "${Config.BASEURL}${UrlPath.initiateTransfer}",
        data: dataBody, // ✅ pass the body here
        options: Options(
          followRedirects: true,
          headers: {
            "Accept": "application/json",
            'Authorization': "Bearer $userToken",
          },
        ),
      );
      return response;
    } on DioError catch (err) {
      handleError(err);
      rethrow;
    }
  }
  @override
  Future<Response> fiattotoken(String token) async {
    final box = GetStorage();
    String? userToken = box.read(Boxes.userToken);
    var dataBody = {
      'sender': {
        'rail': 'BRIDGE_PAYMENT_RAIL',
        'customerId': 'someCustomerId',
        'walletAddress': 'someWalletAddress',
        'currency': 'BRIDGE_CURRENCY',
      },
      'receiver': {
        'rail': 'BRIDGE_PAYMENT_RAIL',
        'external_account_id': 'someExternalAccountId',
        'currency': 'BRIDGE_CURRENCY',
        'nickname': 'optionalNickname', // you can remove if null
      },
      'amount': '1000', // or your dynamic value
      'idempotency_key': 'uniqueKey123' // generate uniquely each time if needed
    };
    try {
      Dio dio = Dio();
      var response = await dio.post(
        "${Config.BASEURL}${UrlPath.getWallet}",
        data: dataBody, // ✅ pass the body here
        options: Options(
          followRedirects: true,
          headers: {
            "Accept": "application/json",
            'Authorization': "Bearer $userToken",
          },
        ),
      );
      return response;
    } on DioError catch (err) {
      handleError(err);
      rethrow;
    }
  }







}

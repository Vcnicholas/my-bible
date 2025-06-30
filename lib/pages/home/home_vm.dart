import 'dart:convert';

import 'package:bucx/data/core/network/error_handler.dart';
import 'package:bucx/domain/model/transactions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';

import '../../data/core/storage/get_boxes.dart';
import '../../data/services/remote_service.dart';
import '../../data/services/user_services.dart';
import '../../domain/model/kyc_response.dart';
import '../../domain/model/users.dart';
import '../../utils/snack_message.dart';
import '../base/base.vm.dart';

class HomeViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  late RemoteServices _remoteServices;
  final TextEditingController amount = TextEditingController();
  final box = GetStorage();
  var viewBalance = true;
  double balance = 0.00;
  final String currency = "USD";
  List<Transactions> transactions = [];
  String kycStatus = '';
  String kycLink = '';

  HomeViewModel() {
    _updateFormattedBalance();
  }

  String _formattedBalance = "";
  List<String> _parts = [];

  String get formattedBalance => _formattedBalance;
  List<String> get parts => _parts;

  void _updateFormattedBalance() {
    _formattedBalance = NumberFormat("#,##0.00").format(balance);
    _parts = _formattedBalance.split('.');
    notifyListeners();
  }

  Future<void> getWalletDetails() async {
    try {
      isLoading = true;
      notifyListeners();
      final token = await box.read(Boxes.userToken);
      final response = await remoteServices.getUserWalletDetails(token);
      print('wallet is this');
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      notifyListeners();
      print('wallet failed');
    }
  }

  void getCachedHistory() {
    final raw = box.read(Boxes.transactionHistory);
    print(raw);
    if (raw != null) {
      try {
        final decoded = jsonDecode(raw); // Convert JSON string to Map
        final rawList = decoded['list'] as List;
        transactions = rawList
            .map((e) => Transactions.fromJson(Map<String, dynamic>.from(e)))
            .toList();
        notifyListeners();
      } catch (e) {
        print("Error parsing cached transactions: $e");
      }
    }
  }


  Future<void> getTransactionHistory() async {
    try {
      final _dio = Dio();
      _remoteServices = RemoteServices(_dio, UserServices());
      isLoading = true;
      notifyListeners();

      final token = await box.read(Boxes.userToken);
      final response = await _remoteServices.getTransactionsHistory(token);

      // 1. Parse the response
      final rawJson = response.data;
      final jsonList = rawJson['list'] as List;
      transactions = jsonList.map((e) => Transactions.fromJson(e)).toList();

      // ✅ 2. Now save parsed transactions
      final transactionJsonList = transactions.map((tx) => tx.toJson()).toList();
      await box.write(Boxes.transactionHistory, jsonEncode({'list': transactionJsonList}));

      // Debug print
      print("Parsed transactions:");
      for (var tx in transactions) {
        print('ID: ${tx.id}, Amount: ${tx.amount}, State: ${tx.state}');
      }

      isLoading = false;
      notifyListeners();
    } catch (err) {
      isLoading = false;
      notifyListeners();
      print("Error fetching transactions: $err");
    }
  }

  void loadCachedTransactions() {
    final storedList = box.read<List>(Boxes.transactionHistory);
    if (storedList != null) {
      transactions = storedList
          .map((e) => Transactions.fromJson(Map<String, dynamic>.from(e)))
          .toList();
      notifyListeners();
    }
  }



  AutovalidateMode get autovalidateMode => _autovalidateMode;
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  void setValidateMode(AutovalidateMode autovalidateMode) {
    _autovalidateMode = autovalidateMode;
    notifyListeners();
  }

  void togglePasswordView() {
    viewBalance = !viewBalance;
    notifyListeners();
  }

  Future<void> copyToClipboard(String refer) async {
    await Clipboard.setData(ClipboardData(text: 'Use My Referral code \n$refer'));
    snackBars("Copied to clipboard!!", true);
  }
  void loadCachedBalance() async{
    final rawBalance = await box.read(Boxes.balance) ?? 0.0;
    balance = double.tryParse(rawBalance?.toString() ?? '') ?? 0.00;
    _updateFormattedBalance();
  }


  Future<void> getWalletBalance() async {
    try {
      final _dio = Dio();
      _remoteServices = RemoteServices(_dio, UserServices());
      isLoading = true;
      notifyListeners();
      final token = await box.read(Boxes.userToken);
      final response = await _remoteServices.getBalance(token);
      if (response.statusCode == 200) {
        print('the balance is below');
        print(response.data);
        await box.write(Boxes.balance, response.data['balance']);
        print('baaaaal ');
        final rawBalance = await box.read(Boxes.balance);
        balance = double.tryParse(rawBalance?.toString() ?? '') ?? 0.00;
        print('rawBalance');
        _updateFormattedBalance();
        notifyListeners();
      }
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getKycLinks() async {
    try {
      final _dio = Dio();
      _remoteServices = RemoteServices(_dio, UserServices());
      isLoading = true;
      notifyListeners();
      final email = await box.read(Boxes.regEmail);
      final idempotencyKey = Uuid().v4();
      final token = await box.read(Boxes.userToken);
      final response = await _remoteServices.getKycLinks(token, idempotencyKey);
      print(response);
      await box.write(Boxes.fullName, response.fullName);
      await box.write(Boxes.kycStatus, response.kycStatus);
      print(response.kycStatus);
      print(response.fullName);
      snackBars('fully', true);
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      notifyListeners();
    }
  }
  void loadCachedKycStatus (){
    kycStatus = box.read(Boxes.kycStatus)?? '';
    notifyListeners();
    print('the status is');
    print(kycStatus);
  }
  void launchInBrowser(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication, // Opens in browser
    )) {
      throw 'Could not launch $url';
    }
  }
  void onInit() {
    final savedJson = GetStorage().read(Boxes.kycDetails);
    if (savedJson != null) {
      final data = KycResponse.fromJson(jsonDecode(savedJson));
      kycLink = data.kycLink;
      notifyListeners();
     // tosLink = data.tosLink;
    }
  }
}

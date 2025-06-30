import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
//import 'package:local_auth/local_auth.dart';


import '../../base/base.vm.dart';

class ProfilesViewModel extends BaseViewModel {
  final FocusNode emailverifyFN = FocusNode();

  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  final formKey = GlobalKey<FormState>();
  final box = GetStorage();
  //final LocalAuthentication auth = LocalAuthentication();
  bool pushNotification = false;
  bool useFingerprint = false;
  String email = '';
  String fullName = 'A A';

  AutovalidateMode get autovalidateMode => _autovalidateMode;

  setValidateMode(AutovalidateMode autovalidateMode) {
    _autovalidateMode = autovalidateMode;
    notifyListeners();
  }


}

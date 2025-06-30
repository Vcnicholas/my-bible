
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:uuid/uuid.dart';

import '../../data/services/remote_service.dart';

import '../base/base.vm.dart';

class HomeViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  late RemoteServices _remoteServices;
  final TextEditingController amount = TextEditingController();
  final box = GetStorage();

  AutovalidateMode get autovalidateMode => _autovalidateMode;
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  void setValidateMode(AutovalidateMode autovalidateMode) {
    _autovalidateMode = autovalidateMode;
    notifyListeners();
  }

}

import 'package:bucx/data/core/storage/get_boxes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:local_auth/local_auth.dart';


import '../../base/base.vm.dart';

class ProfilesViewModel extends BaseViewModel {
  final FocusNode emailverifyFN = FocusNode();

  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  final formKey = GlobalKey<FormState>();
  final box = GetStorage();
  final LocalAuthentication auth = LocalAuthentication();
  bool pushNotification = false;
  bool useFingerprint = false;
  String email = '';
  String fullName = 'A A';

  AutovalidateMode get autovalidateMode => _autovalidateMode;

  setValidateMode(AutovalidateMode autovalidateMode) {
    _autovalidateMode = autovalidateMode;
    notifyListeners();
  }
  Future<void> authenticate() async {
    try {
      bool authenticated = await auth.authenticate(
        localizedReason: 'Scan your fingerprint (or face) to authenticate',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );
      useFingerprint = authenticated;
      notifyListeners();
      // Update reactive variable
    } on PlatformException catch (e) {
      print(e);
    }
  }

  void loadUserData () {
    email = box.read(Boxes.email) ?? '';
    fullName = box.read(Boxes.fullName) ?? '';
    notifyListeners();
  }
  // String getInitials(String fullName) {
  //   List<String> names = fullName.trim().split(' ');
  //   if (names.length == 1) return names[0][0].toUpperCase();
  //   return names.map((name) => name[0]).take(2).join().toUpperCase();
  // }

  String getInitials(String? fullName) {
    if (fullName == null || fullName.trim().isEmpty) return '';

    List<String> names = fullName.trim().split(' ');
    if (names.isEmpty) return '';
    if (names.length == 1) {
      return names[0].isNotEmpty ? names[0][0].toUpperCase() : '';
    }

    return names
        .where((name) => name.isNotEmpty)
        .map((name) => name[0])
        .take(2)
        .join()
        .toUpperCase();
  }

}

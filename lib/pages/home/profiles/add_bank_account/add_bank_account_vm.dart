import 'package:bucx/pages/base/base.vm.dart';
import 'package:flutter/cupertino.dart';

class AddBankAccountViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  final TextEditingController bankController = TextEditingController();
  final TextEditingController accountNumberController = TextEditingController();
  final TextEditingController accountNameController = TextEditingController();
}
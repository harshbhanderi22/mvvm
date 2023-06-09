import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/repository/auth_repo.dart';
import 'package:mvvm/utils/general_utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  void setLoading(bool value) {
    _isLoading = value;
  }

  Future loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).timeout(const Duration(seconds: 10)).then((value) {
      setLoading(false);
      GeneralUtils.flushbar(context, "Login Successfull");
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}

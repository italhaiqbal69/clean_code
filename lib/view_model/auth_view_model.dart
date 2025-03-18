import 'package:clean_code_architechture/repository/auth_repository.dart';
import 'package:clean_code_architechture/utils/routes/routes_name.dart';
import 'package:clean_code_architechture/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AuthViewModel with ChangeNotifier {
  bool _loading = false;

  bool get loading => _loading;

  bool _signupLoading = false;

  bool get signupLoading => _signupLoading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setSignupLoading(bool value) {
    _signupLoading = value;
    notifyListeners();
  }

  final _authRepo = AuthRepository();

  Future<void> LoginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _authRepo.loginApi(data).then((value) {
      setLoading(false);
      Navigator.pushReplacementNamed(context, RouteNames.home);

      Utils.flushBarErrorMessage('LogIn Successfully', context);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError(
      (error, stackTrace) {
        setLoading(false);
        Utils.flushBarErrorMessage(error.toString(), context);
        if (kDebugMode) {
          print(error.toString());
        }
      },
    );
  }

  Future<void> SignUpApi(dynamic data, BuildContext context) async {
    setSignupLoading(true);
    _authRepo.signupApi(data).then((value) {
      setSignupLoading(false);

      Utils.flushBarErrorMessage('Signup Successfully', context);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError(
      (error, stackTrace) {
        setSignupLoading(false);
        Utils.flushBarErrorMessage(error.toString(), context);
        if (kDebugMode) {
          print(error.toString());
        }
      },
    );
  }
}

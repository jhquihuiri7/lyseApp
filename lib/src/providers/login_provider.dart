import 'package:flutter/material.dart';
import 'package:lyse_app/src/models/login_model.dart';

class LoginProvider extends ChangeNotifier{

  final LoginModel _loginModel = LoginModel(phone: "", code: "123456", status: "NO");
  LoginModel get loginModel => _loginModel;
  set loginModel(model){
    if (model.phone != ""){
      loginModel.phone = model.phone;
    }else if (model.code != ""){
      loginModel.code = model.code;
    }else if (model.status != ""){
      loginModel.status = model.status;
    }
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(value){
    _isLoading = value;
    notifyListeners();
  }
}
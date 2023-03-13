import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/login_provider.dart';

class LoginLogic {

  FirebaseAuth _auth = FirebaseAuth.instance;

  String? ValidatorTextFormField(String? value) {
    if(value!.isEmpty){
      return "Ingrese su número de celular";
    }else if (value.length < 10){
      return "Número de celular incompleto";
    }else if (value[0] != "0"){
      return "Número de celular inválido";
    }
    return null;
  }

  Future VerifyPhoneNumber (BuildContext context, String phoneNumber) async {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    await _auth.verifyPhoneNumber(
        timeout: Duration(seconds: 60),
        phoneNumber: phoneNumber,
        verificationCompleted: (phoneAuthCredential) async {
          print(phoneAuthCredential.smsCode);
          print(phoneNumber);
          loginProvider.isLoading = false;
          Navigator.pushNamed(context, "verificacion");
        },
        verificationFailed: (verificationFailed) async {
          print(phoneNumber);
          loginProvider.isLoading = false;
          Navigator.pushNamed(context, "verificacion");
        },
        codeSent: (verificationId, resendingToken) async {
          print(resendingToken);
          loginProvider.isLoading = false;
          Navigator.pushNamed(context, "verificacion");
        },
        codeAutoRetrievalTimeout: (verificationId) async {
          loginProvider.isLoading = false;
        }
    );
  }

}
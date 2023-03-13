import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lyse_app/src/logic/login_logic.dart';
import 'package:lyse_app/src/login_animation_widget.dart';
import 'package:lyse_app/src/providers/login_provider.dart';
import 'package:provider/provider.dart';
import '../models/login_model.dart';
import '../styles/login_styles.dart';
class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            LoginAnimationWidget(),
            const SizedBox(height: 20,),
            Container(width: double.infinity, alignment: Alignment.center, child: Text("Inicio de Sesión", style: LoginStyles().style1)),
            const SizedBox(height: 15,),
            Container(width: double.infinity, alignment: Alignment.center, child: Text("Por favor ingrese su número de célular", style: LoginStyles().style2,)),
            const SizedBox(height: 40,),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _controller,
                    validator: (value){
                      return LoginLogic().ValidatorTextFormField(value);
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Theme.of(context).primaryColor,)
                      ),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black,)
                      ),
                      hintText: "Número de celular",
                      label: Text("Número de celular", style: LoginStyles().style2,)
                    ),
                  ),
                  const SizedBox(height: 25,),
                  ElevatedButton(
                    style: LoginStyles().styleEdgeButton(context),
                    onPressed: ()async {
                      if (_formKey.currentState!.validate()) {
                        loginProvider.isLoading = true;
                        loginProvider.loginModel = LoginModel(phone: "+593"+_controller.text.substring(1), code: "", status: "");
                        await LoginLogic().VerifyPhoneNumber(context, "+593"+_controller.text.substring(1));
                      }
                    },
                    child: SizedBox(width: 60,
                        child: (loginProvider.isLoading)
                            ? Container(height: 20, width: 20, child: CircularProgressIndicator())
                            : Text("Ingresar", style: LoginStyles().styleButton))
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

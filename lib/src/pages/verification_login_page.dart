import 'package:flutter/material.dart';
import 'package:lyse_app/src/providers/login_provider.dart';
import 'package:lyse_app/src/styles/login_styles.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class VerificationLoginPage extends StatelessWidget {
  const VerificationLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final Size _buton = Size(50, 10);
    final loginProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
          SizedBox(
            width: size.width,
            height: size.height * 0.5,
            child: SvgPicture.asset("assets/verification_login.svg", fit: BoxFit.contain),
            ),
            //const SizedBox(height: 10,),
            Container(width: double.infinity, alignment: Alignment.center, child: Text("Código de verificación", style: LoginStyles().style1)),
            const SizedBox(height: 15,),
            Container(width: double.infinity, alignment: Alignment.center, child: Text("Ingrese el código de verificación", style: LoginStyles().style2,)),
            Container(width: double.infinity, alignment: Alignment.center, child: Text("enviado a ${loginProvider.loginModel.phone}", style: LoginStyles().style2,)),
            const SizedBox(height: 40,),
            Pinput(
              length: 6,
              validator: (s) {
                return s?.length == 6 ? null : 'Campos incompletos';
              },
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              showCursor: true,
              onCompleted: (pin) {
               if (pin == "123456"){
                 Navigator.pushNamed(context, "inicio");
               }
              },
            ),
            const SizedBox(height: 40,),
            Container(width: double.infinity, alignment: Alignment.center, child: Text("¿No recibiste un código?", style: LoginStyles().style2,)),
            const SizedBox(height: 10,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor,
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: ()async {},
              child: Text("Reenviar SMS", style: LoginStyles().style2),
            ),
          ],
        ),
      ),
    );
  }
}

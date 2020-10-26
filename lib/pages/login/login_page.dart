import 'package:appetit/pages/home/home_page.dart';
import 'package:appetit/pages/login/controller/login_controller.dart';
import 'package:appetit/pages/login/widgets/button_login_widget.dart';
import 'package:appetit/pages/login/widgets/logo_widget.dart';
import 'package:appetit/shared/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FocusNode myFocusNodeEmail;
  FocusNode myFocusNodePassword;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myFocusNodeEmail = FocusNode();
    myFocusNodePassword = FocusNode();
  }

  void requestFocusEmail() {
    setState(() {
      FocusScope.of(context).requestFocus(myFocusNodeEmail);
    });
  }

  void requestFocusPassword() {
    setState(() {
      FocusScope.of(context).requestFocus(myFocusNodePassword);
    });
  }

  @override
  void dispose() {
    myFocusNodeEmail.dispose();
    myFocusNodePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent));
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) => Scaffold(
        bottomNavigationBar: Obx(
          ()=> ButtonLoginWidget(
            enabled: controller.buttonEnabled.value,
            text: "ENTRAR",
            onPressed: () {
              Get.off(HomePage());
            },
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LogoWidget(),
                SizedBox(height: 60),
                Text(
                  'Seja bem-vindo!',
                  style: TextStyle(
                      color: ORANGE_APPETIT,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text(
                      'Nós sabemos a importância de estar sempre de barriga cheia e o quanto isso pode ajudar no seu dia.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 17, color: Colors.blueGrey),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.only(left: 16, right: 16),
                  color: Colors.white,
                  child: TextFormField(
                    onChanged: (text){
                      controller.setLabelEmail(text);
                    },
                    onTap: requestFocusEmail,
                    focusNode: myFocusNodeEmail,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: myFocusNodeEmail.hasFocus
                          ? "E-mail"
                          : "Insira o seu e-mail aqui",
                      labelStyle: TextStyle(
                          color: myFocusNodeEmail.hasFocus
                              ? ORANGE_APPETIT
                              : Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: ORANGE_APPETIT,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.only(left: 16, right: 16),
                  color: Colors.white,
                  child: Obx(
                    () => TextFormField(
                      onChanged: (text){
                        controller.setLabelPassword(text);
                      },
                      obscureText: controller.showPassword.value == false,
                      onTap: requestFocusPassword,
                      focusNode: myFocusNodePassword,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.showPassword.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: ORANGE_APPETIT,
                          ),
                          onPressed: () => controller
                              .setShowPassword(!controller.showPassword.value),
                        ),
                        labelText: myFocusNodePassword.hasFocus
                            ? "Senha"
                            : "Insira a sua senha aqui",
                        labelStyle: TextStyle(
                            color: myFocusNodePassword.hasFocus
                                ? ORANGE_APPETIT
                                : Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: ORANGE_APPETIT,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

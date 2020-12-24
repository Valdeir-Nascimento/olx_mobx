import 'package:flutter/material.dart';
import 'package:olxmobx/components/error_box.dart';
import 'package:olxmobx/controllers/login_controller.dart';
import 'package:olxmobx/pages/signup/signup_page.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LoginController loginController = LoginController();
    final emailController = TextEditingController(text: "valdeircn11@gmail.com");
    final senhaController = TextEditingController(text: "123456");

    return Scaffold(
      appBar: AppBar(
        title: const Text("Entrar"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Card(
            elevation: 8,
            margin: const EdgeInsets.symmetric(horizontal: 32),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16))),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Acessar com E-mail",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),

                  Observer(builder: (_) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: ErrorBox(
                        message: loginController.error,
                      ),
                    );
                  }),

                  //E-MAIL
                  Padding(
                    padding: const EdgeInsets.only(left: 3, bottom: 4, top: 8),
                    child: Text(
                      "E-mail",
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),

                  //EMAIL
                  Observer(builder: (_) {
                    return TextField(
                      //controller: emailController,
                      enabled: !loginController.loading,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        isDense: true,
                        errorText: loginController.emailError,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: loginController.setEmail,
                    );
                  }),
                  const SizedBox(height: 16),

                  Padding(
                    padding: const EdgeInsets.only(left: 3, bottom: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Senha",
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Esqueceu sua senha?",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.purple,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  //SENHA
                  Observer(builder: (_) {
                    return TextField(
                      //controller: senhaController,
                      enabled: !loginController.loading,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          isDense: true,
                          errorText: loginController.passwordError),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: loginController.setPassword,
                    );
                  }),

                  Observer(builder: (_) {
                    return Container(
                      height: 40,
                      margin: const EdgeInsets.only(top: 20, bottom: 12),
                      child: RaisedButton(
                          child: loginController.loading
                              ? CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.white),
                                )
                              : Text("ENTRAR"),
                          color: Colors.orange,
                          disabledColor: Colors.orange.withAlpha(120),
                          textColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          onPressed: loginController.loginPressed),
                    );
                  }),

                  Divider(
                    color: Colors.black,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        const Text(
                          "Não tem uma conta?",
                          style: TextStyle(fontSize: 16),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => SignUpPage(),
                              ),
                            );
                          },
                          child: Text(
                            " Cadastre-se",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.purple,
                              fontSize: 16,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

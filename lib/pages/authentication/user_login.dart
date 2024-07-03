import 'package:flutter/material.dart';
import 'package:keiko_food_reviews/helper/constants.dart';
import 'package:keiko_food_reviews/helper/routes.dart';
import 'package:keiko_food_reviews/helper/themes.dart';

import '../../helper/validators.dart';
import '../../ioc/ioc_container.dart';
import '../../logic/login_register_logic.dart';
import '../../widget/custom_input_decoration.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({super.key});

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  final LoginRegisterLogic _loginRegisterLogic = IocContainer.get<LoginRegisterLogic>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override void dispose() {
    _email.dispose();
    _password.dispose();

    super.dispose();
  }

  void handleCheckFields(String value) {
    _loginRegisterLogic.checkLoginEmailAndPassword(
        email: _email.text,
        password: _password.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).secondaryHeaderColor.withOpacity(0.2),
                ],
                stops: const [0.0, 0.4],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: ResponsiveSizes.mobile.value,
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    Image.asset('assets/images/shield_yellow.png', height: 80),
                    const SizedBox(height: 72.0),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _email,
                            textInputAction: TextInputAction.next,
                            decoration: const CustomInputDecoration('Email', Icons.mail_outline).build(),
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (email) {
                              return Validators.email(email: email!) ? null : 'Enter a valid email';
                            },
                            onChanged: handleCheckFields,
                          ),
                          ThemeSpacer.LargeY,
                          TextFormField(
                            controller: _password,
                            textInputAction: TextInputAction.next,
                            obscureText: true,
                            decoration: const CustomInputDecoration('Password', Icons.password).build(),
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (password) {
                              return Validators.password(password: password!) ? null : 'Enter a valid password';
                            },
                            onChanged: handleCheckFields,
                            onFieldSubmitted: (password) => _loginRegisterLogic.login(email: _email.text, password: _password.text),
                          ),
                          ThemeSpacer.ExtraLargeY,
                          ListenableBuilder(
                            listenable: _loginRegisterLogic,
                            builder: (BuildContext context, Widget? widget) {
                              return ElevatedButton(
                                onPressed: _loginRegisterLogic.loginRegisterInfo.buttonLoginRegisterEnabled ? () => _loginRegisterLogic.login(email: _email.text, password: _password.text) : null,
                                style: ElevatedButton.styleFrom(
                                  elevation: 8.0
                                ),
                                child: const Text('Login')
                              );
                            }
                          ),
                          ListenableBuilder(
                            listenable: _loginRegisterLogic,
                            builder: (BuildContext context, Widget? widget) {
                              return Visibility(
                                visible: _loginRegisterLogic.loginRegisterInfo.showLoginRegisterError,
                                child: Column(
                                  children: [
                                    ThemeSpacer.LargeY,
                                    Row(
                                      children: [
                                        const Expanded(child: Divider(endIndent: 16.0)),
                                        Text(_loginRegisterLogic.loginRegisterInfo.loginRegisterErrorMessage ?? ""),
                                        const Expanded(child: Divider(indent: 16.0)),
                                      ],
                                    )
                                  ],
                                )
                              );
                            }
                          )
                        ],
                      ),
                    ),
                    ThemeSpacer.LargeY,
                    TextButton(
                      onPressed: () => Navigator.of(context).pushReplacementNamed(RoutePathsEnum.UserForgotPassword),
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Theme.of(context).disabledColor
                        )
                      )
                    ),
                    ThemeSpacer.SmallY,
                    Row(
                      children: [
                        const Expanded(child: Divider(endIndent: 16.0)),
                        Text(
                          'Don\'t have an account?',
                          style: TextStyle(
                            color: Theme.of(context).disabledColor
                          ),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pushReplacementNamed(RoutePathsEnum.UserRegister),
                          child: Text(
                            'Create Account',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor
                            )
                          )
                        ),
                        const Expanded(child: Divider(indent: 16.0))
                      ],
                    )
                  ],
                ),
              )
            )
          )
        ],
      )
    );
  }
}

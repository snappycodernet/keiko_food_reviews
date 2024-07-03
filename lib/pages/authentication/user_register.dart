import 'package:flutter/material.dart';
import 'package:keiko_food_reviews/helper/constants.dart';
import 'package:keiko_food_reviews/helper/routes.dart';
import 'package:keiko_food_reviews/helper/themes.dart';
import 'package:keiko_food_reviews/helper/validators.dart';
import 'package:keiko_food_reviews/ioc/ioc_container.dart';
import 'package:keiko_food_reviews/logic/login_register_logic.dart';
import 'package:keiko_food_reviews/services/database_service.dart';
import 'package:keiko_food_reviews/services/firebase_authentication_service.dart';
import 'package:keiko_food_reviews/widget/custom_input_decoration.dart';

class UserRegister extends StatefulWidget {
  const UserRegister({super.key});

  @override
  State<UserRegister> createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  final LoginRegisterLogic _loginRegisterLogic = IocContainer.get<LoginRegisterLogic>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  @override void dispose() {
    _email.dispose();
    _password.dispose();
    _confirmPassword.dispose();

    super.dispose();
  }

  void handleCheckFields(String value) {
    _loginRegisterLogic.checkRegisterEmailAndPasswordAndConfirm(
      email: _email.text,
      password: _password.text,
      passwordConfirm: _confirmPassword.text
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
                  Theme.of(context).secondaryHeaderColor.withOpacity(0.2)
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
                    const SizedBox(height: 40.0),
                    Image.asset('assets/images/shield_user.png', height: 80.0),
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
                              return Validators.email(email: email!) ? null : "Enter a valid email";
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
                              return Validators.password(password: password!) ? null : "Enter a valid password";
                            },
                            onChanged: handleCheckFields,
                          ),
                          ThemeSpacer.LargeY,
                          TextFormField(
                            controller: _confirmPassword,
                            textInputAction: TextInputAction.next,
                            obscureText: true,
                            decoration: const CustomInputDecoration('Confirm Password', Icons.password).build(),
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (password) {
                              if(!Validators.password(password: password!)) return "Enter a valid password";
                              if(password != _password.text) return "Passwords do not match.";

                              return null;
                            },
                            onChanged: handleCheckFields,
                          ),
                          ThemeSpacer.ExtraLargeY,
                          AnimatedBuilder(
                            animation: _loginRegisterLogic,
                            builder: (BuildContext context, Widget? widget) {
                              return ElevatedButton(
                                onPressed: _loginRegisterLogic
                                  .loginRegisterInfo
                                  .buttonLoginRegisterEnabled ? () =>
                                    _loginRegisterLogic.register(
                                      email: _email.text,
                                      password: _password.text
                                    ) : null,
                                style: ElevatedButton.styleFrom(
                                  elevation: 8.0,
                                ),
                                child: const Text('Register'),
                              );
                            }
                          ),
                          AnimatedBuilder(
                            animation: _loginRegisterLogic,
                            builder: (BuildContext context, Widget? widget) {
                              return Visibility(
                                visible: _loginRegisterLogic.loginRegisterInfo.showLoginRegisterError,
                                child: Column(
                                  children: [
                                    ThemeSpacer.LargeY,
                                    Row(
                                      children: [
                                        const Expanded(
                                          child: Divider(endIndent: 16.0)
                                        ),
                                        Text(_loginRegisterLogic.loginRegisterInfo.loginRegisterErrorMessage ?? ""),
                                        const Expanded(
                                          child: Divider(indent: 16.0)
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              );
                            }
                          ),
                        ],
                      ),
                    ),
                    ThemeSpacer.MediumY,
                    Row(
                      children: [
                        const Expanded(
                          child: Divider(endIndent: 16.0)
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pushReplacementNamed(RoutePathsEnum.Home),
                          child: const Text('I have a Login')
                        ),
                        const Expanded(
                          child: Divider(indent: 16.0)
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mvvm/utils/Components/round_button.dart';
import 'package:mvvm/utils/general_utils.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();

  final ValueNotifier<bool> _obsecure = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthViewModel>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              focusNode: emailNode,
              decoration: const InputDecoration(
                  hintText: "Enter Email", prefixIcon: Icon(Icons.email_sharp)),
              onFieldSubmitted: (value) {
                GeneralUtils.changeFocusNode(context, emailNode, passwordNode);
              },
            ),
            const SizedBox(
              height: 30,
            ),
            ValueListenableBuilder(
                valueListenable: _obsecure,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: _passwordController,
                    focusNode: passwordNode,
                    obscureText: _obsecure.value,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                        hintText: "Enter Password",
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: InkWell(
                          onTap: () {
                            _obsecure.value = !_obsecure.value;
                          },
                          child: Icon(_obsecure.value
                              ? Icons.visibility_off
                              : Icons.visibility),
                        )),
                  );
                }),
            const SizedBox(
              height: 30,
            ),
            RoundButton(
                label: "Login",
                isLoading: authProvider.isLoading,
                onTap: () {
                  if (_emailController.text.isEmpty) {
                    GeneralUtils.flushbar(context, "Please Enter EMail");
                  } else if (_passwordController.text.isEmpty) {
                    GeneralUtils.flushbar(context, "Please Enter Password");
                  } else if (_passwordController.text.length < 8) {
                    GeneralUtils.flushbar(context,
                        "Please Enter Password of minimum 8 Character");
                  } else {
                    Map data = {
                      "email": _emailController.text,
                      "password": _passwordController.text
                    };
                    authProvider.loginApi(data,context);
                  }
                })
          ],
        ),
      ),
    );
  }
}

import 'package:clean_code_architechture/utils/routes/routes_name.dart';
import 'package:clean_code_architechture/utils/utils.dart';
import 'package:clean_code_architechture/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../res/components/custom_button.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _authProvider = Provider.of<AuthViewModel>(context);
    var height = MediaQuery.of(context).size.height * 1;
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: emailController,
                focusNode: emailNode,
                onSubmitted: (value) {
                  Utils.fieldFocusChange(context, emailNode, passwordNode);
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Email',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
            ),
            ValueListenableBuilder(
                valueListenable: _obscurePassword,
                builder: (ctx, value, child) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: passwordController,
                      obscureText: _obscurePassword.value,
                      obscuringCharacter: '*',
                      focusNode: passwordNode,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Password',
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: InkWell(
                            onTap: () {
                              _obscurePassword.value = !_obscurePassword.value;
                            },
                            child: _obscurePassword.value
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility)),
                      ),
                    ),
                  );
                }),
            SizedBox(
              height: height * .03,
            ),
            CustomButton(
              title: 'LogIn',
              loading: _authProvider.loading,
              onPress: () {
                if (emailController.text.isEmpty &&
                    passwordController.text.isEmpty) {
                  Utils.flushBarErrorMessage('Please enter Details', context);
                } else if (emailController.text.isEmpty) {
                  Utils.flushBarErrorMessage('Please enter email', context);
                } else if (passwordController.text.isEmpty) {
                  Utils.flushBarErrorMessage('Please enter password', context);
                } else if (passwordController.text.length < 6) {
                  Utils.flushBarErrorMessage(
                      'Password must be 6 characters', context);
                } else {
                  Map data = {
                    'email': emailController.text.toString(),
                    'password': passwordController.text.toString(),
                  };
                  _authProvider.LoginApi(data, context);
                  print('APi Hit');
                }
              },  
            ),
            SizedBox(
              height: height * 0.01,
            ),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.signup);
                },
                child: Text('Dont have an account ? Create one?'))
          ],
        ),
      ),
    );
  }
}

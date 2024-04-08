import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gallery_task/domain/di/di.dart';
import 'package:my_gallery_task/presentation/screens/login_screen/login_view_model.dart';
import 'package:my_gallery_task/presentation/screens/my_gallery_screen/my_gallery_screen.dart';
import 'package:my_gallery_task/presentation/utils/app_assets.dart';
import 'package:my_gallery_task/presentation/utils/app_color.dart';
import 'package:my_gallery_task/presentation/utils/app_theme.dart';
import 'package:my_gallery_task/presentation/utils/base_request_states.dart';
import 'package:my_gallery_task/presentation/utils/dialog_utils.dart';
import 'package:my_gallery_task/presentation/widgets/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "LoginScreen";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginViewModel viewModel = getIt();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocListener(
      listener: (context, state) {
        if (state is BaseRequestLoadingState) {
          showLoading(context);
        } else if (state is BaseRequestSuccessState) {
          Navigator.pop(context);
          Navigator.pushNamed(context, MyGalleryScreen.routeName);
        } else if (state is BaseRequestErrorState) {
          Navigator.pop(context);
          showErrorDialog(context, state.message);
        }
      },
      bloc: viewModel,
      child: Material(
          type: MaterialType.transparency,
          child: Stack(
            children: [
              Image.asset(AppAssets.imLoginBack),
              Positioned(
                right: width * .10,
                left: width * .10,
                top: height * .20,
                bottom: height * .22,
                child: SizedBox(
                  height: height * .50,
                  child: Column(
                    children: [
                      const Text("My", style: AppTheme.titleLoginScreen),
                      const Text("Gallery", style: AppTheme.titleLoginScreen),
                      SizedBox(
                        height: height * .02,
                      ),
                      Container(
                        padding: EdgeInsets.all(width * .02),
                        width: width * .80,
                        height: height * .35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            color: AppColor.rectLoginBack),
                        child: Form(
                          key: viewModel.formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              CustomTextFormField(
                                  controller: viewModel.emailController,
                                  hintText: 'Enter Your Email',
                                  validator: (text) {
                                    if (text == null || text.trim().isEmpty) {
                                      return 'Please enter email';
                                    }
                                    var emailValid = RegExp(
                                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(text);

                                    if (!emailValid) {
                                      return 'Email format is not valid';
                                    }

                                    return null;
                                  },
                                  type: TextInputType.emailAddress),
                              const SizedBox(
                                height: 12,
                              ),
                              CustomTextFormField(
                                hintText: 'Enter your password',
                                controller: viewModel.passwordController,
                                validator: (text) {
                                  if (text == null || text.trim().isEmpty) {
                                    return 'Please enter password ';
                                  }
                                  if (text.length < 6) {
                                    return 'Password should be at least 6 chrs.';
                                  }
                                  return null;
                                },
                                type: TextInputType.visiblePassword,
                                isPassword: true,
                              ),
                              const SizedBox(height: 18),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.deepPurple,
                                  ),
                                  onPressed: () {
                                    viewModel.login(context);
                                  },
                                  child: const Text('Login',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}

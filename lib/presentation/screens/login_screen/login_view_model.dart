import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_gallery_task/data/failure.dart';
import 'package:my_gallery_task/domain/usecase/login_use_case.dart';
import 'package:my_gallery_task/presentation/utils/base_request_states.dart';

@injectable
class LoginViewModel extends Cubit<BaseRequestStates> {
  LoginViewModel(this.loginUseCase) : super(BaseRequestInitialState());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  LoginUseCase loginUseCase;

  void login(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;
    emit(BaseRequestLoadingState());
    Either<Failure, bool> response = await loginUseCase.execute(
        emailController.text, passwordController.text);
    response.fold((error) {
      emit(BaseRequestErrorState(error.errorMessage));
    }, (success) {
      emit(BaseRequestSuccessState());
    });
  }
}

class InitialState {}

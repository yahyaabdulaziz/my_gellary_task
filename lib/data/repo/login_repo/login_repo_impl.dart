import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:my_gallery_task/data/failure.dart';
import 'package:my_gallery_task/domain/repo/login_repo/login_repo.dart';
import 'package:my_gallery_task/presentation/utils/constant.dart';
import 'package:my_gallery_task/presentation/utils/shared_utils.dart';

@Injectable(as: LoginRepo)
class LoginRepoImpl extends LoginRepo {
  @override
  Connectivity connectivity;
  SharedPrefsUtils prefsUtils;

  LoginRepoImpl(this.connectivity, this.prefsUtils);

  @override
  Future<Either<Failure, bool>> login(String email, String password) async {
    ConnectivityResult connectivityResult =
        await connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      try {
        Uri uri = Uri.parse('https://flutter.prominaagency.com/api/auth/login');
        Response serverResponse =
            await post(uri, body: {"email": email, "password": password});
        final response = json.decode(serverResponse.body);
        if (serverResponse.statusCode >= 200 &&
            serverResponse.statusCode < 300) {
          print("LoginDone");
          prefsUtils.saveToken(response['token']!);

          return const Right(true);
        } else {
          return Left(Failure(response['message'] ?? "Something went wrong"));
        }
      } catch (_) {
        return Left(Failure(Constants.defaultErrorMessage));
      }
    } else {
      return Left(Failure(Constants.internetErrorMessage));
    }
  }
}

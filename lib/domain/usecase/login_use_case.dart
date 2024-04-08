import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_gallery_task/data/failure.dart';
import 'package:my_gallery_task/domain/repo/login_repo/login_repo.dart';

@injectable
class LoginUseCase {
  LoginRepo loginRepo;

  LoginUseCase(this.loginRepo);

  Future<Either<Failure, bool>> execute(String email, String password) {
    return loginRepo.login(email, password);
  }
}

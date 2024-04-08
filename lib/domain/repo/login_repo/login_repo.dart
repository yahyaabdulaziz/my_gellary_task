import 'package:dartz/dartz.dart';
import 'package:my_gallery_task/data/failure.dart';

abstract class LoginRepo {
  Future<Either<Failure, bool>> login(String email, String password);
}

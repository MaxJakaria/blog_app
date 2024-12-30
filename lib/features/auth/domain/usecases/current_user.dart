import 'package:blog_app/core/theme/error/failures.dart';
import 'package:blog_app/core/theme/usecase/usecase.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:blog_app/features/auth/domain/repository/entities/user.dart';
import 'package:fpdart/fpdart.dart';

class CurrentUser implements UseCase<User, NoParams> {
  final AuthRepository authRepository;

  CurrentUser({required this.authRepository});
  @override
  Future<Either<Failure, User>> call(NoParams prams) async {
    return await authRepository.currentUser();
  }
}

class NoParams {}

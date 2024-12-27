import 'package:blog_app/core/theme/error/exceptions.dart';
import 'package:blog_app/core/theme/error/failures.dart';
import 'package:blog_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class AuthRepositoryImplementation implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  AuthRepositoryImplementation(this.remoteDataSource);

  @override
  Future<Either<Failure, String>> loginWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final userID = await remoteDataSource.signUpWithEmailPassword(
        name: name,
        email: email,
        password: password,
      );

      return right(userID);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}

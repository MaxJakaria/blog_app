import 'package:blog_app/core/theme/error/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract interface class AuthRemoteDataSource {
  Future<String> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });
  Future<String> loginWithEmailPassword({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImplementation implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  Future<String> loginWithEmailPassword({
    required String email,
    required String password,
  }) {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<String> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (response.user == null) {
        throw const ServerException('User is null');
      }

      return response.user!.uid;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}

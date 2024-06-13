import 'package:ballast_machn_test/data/repositories/auth_repository.dart';

class AuthenticateUser {
  final AuthRepository repository;

  AuthenticateUser(this.repository);

  Future<bool> call(int id, String passcode) async {
    return await repository.authenticate(id, passcode);
  }
}

import 'User.dart';
import 'package:flutter_clean_architecture/domain/Repository.dart';

class GetUsersUseCase {
  final Repository _repository;

  GetUsersUseCase({required Repository repository}) : _repository = repository;

  Future<List<User>> execute() {
    return _repository.loadUsers();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/domain/GetUsersUseCase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_clean_architecture/domain/User.dart';

class UsersViewModel extends ChangeNotifier {
  final GetUsersUseCase _getUsersUseCase;

  AsyncValue<List<User>> _usersData = const AsyncValue.loading();

  AsyncValue<List<User>> get usersData => _usersData;

  UsersViewModel({required GetUsersUseCase getUsersUseCase})
      : _getUsersUseCase = getUsersUseCase {
    loadUsers();
  }

  void loadUsers() async {
    try {
      final value = await _getUsersUseCase.execute();
      _usersData = AsyncValue.data(value);
    } on Exception catch (e) {
      _usersData = AsyncValue.error(e);
    }
    notifyListeners();
  }
}

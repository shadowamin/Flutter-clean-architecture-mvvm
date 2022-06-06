import 'package:flutter_clean_architecture/data/RepositoryImpl.dart';
import 'package:flutter_clean_architecture/domain/GetUsersUseCase.dart';
import 'package:flutter_clean_architecture/domain/Repository.dart';
import 'package:flutter_clean_architecture/presentation/users_list/UsersViewModel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

final usersViewModelProvider = ChangeNotifierProvider<UsersViewModel>(
  (ref) => UsersViewModel(getUsersUseCase: ref.watch(usersUseCase)),
);

final usersUseCase = Provider<GetUsersUseCase>(
    (ref) => GetUsersUseCase(repository: ref.watch(repository)));

final repository = Provider<Repository>(
        (ref) => RepositoryImpl(client: http.Client()));


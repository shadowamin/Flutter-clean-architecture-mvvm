import 'package:flutter_clean_architecture/domain/GetUsersUseCase.dart';
import 'package:flutter_clean_architecture/domain/User.dart';
import 'package:flutter_clean_architecture/presentation/users_list/UsersViewModel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'UsersViewModelTest.mocks.dart';
import 'package:collection/collection.dart';

@GenerateMocks([GetUsersUseCase])
main() {
  group('loadUsers', () {
    test(
        'when loadUsers throw Exception then users data value is AsyncValue.error',
        ()  {
      final useCase = MockGetUsersUseCase();

      const usersList = <User>[
        User("1", "george.bluth@reqres.in", "George", "Bluth",
            "https://reqres.in/img/faces/1-image.jpg")
      ];
      final expectedUsers = Future.delayed(
        const Duration(seconds: 0),
        () => usersList,
      );

      when(useCase.execute()).thenAnswer((_) => expectedUsers);

      final viewModel = UsersViewModel(getUsersUseCase: useCase);

      Function eq = const DeepCollectionEquality().equals;
      const state = AsyncValue.data(usersList);

      bool equals = eq(state, viewModel.usersData);
      expect(equals, true);

    });
  });
}

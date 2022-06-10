import 'package:flutter_clean_architecture/domain/GetUsersUseCase.dart';
import 'package:flutter_clean_architecture/domain/Repository.dart';
import 'package:flutter_clean_architecture/domain/User.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:collection/collection.dart';
import 'GetUsersUseCaseTest.mocks.dart';

@GenerateMocks([Repository])
void main() {
  test('execute', () async {
    final repository = MockRepository();
    final useCase = GetUsersUseCase(repository: repository);
    final  expectedUsers = Future.delayed(
        const Duration(seconds: 0),
            () => const <User>[
                User("1", "george.bluth@reqres.in", "George", "Bluth",
                    "https://reqres.in/img/faces/1-image.jpg")
            ],
    );

    when(repository.loadUsers()).thenAnswer((_) => expectedUsers );

    final result = useCase.execute();

    Function eq = const DeepCollectionEquality().equals;

    bool equals = eq(result, expectedUsers);
    expect(equals, true);
  });
}

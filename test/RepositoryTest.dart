import 'package:flutter_clean_architecture/data/RepositoryImpl.dart';
import 'package:flutter_clean_architecture/domain/User.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:collection/collection.dart';
import 'RepositoryTest.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('loadUsers', () {
    test('return list of users if http complete successfully', () async {
      final client = MockClient();
      final repository = RepositoryImpl(client: client);

      when(client.get(Uri.parse("https://reqres.in/api/users"))).thenAnswer(
          (_) async => http.Response(
              '{"page":1,"per_page":6,"total":12,"total_pages":2,"data":[{"id":1,"email":"george.bluth@reqres.in","first_name":"George","last_name":"Bluth","avatar":"https://reqres.in/img/faces/1-image.jpg"}]}',
              200));
      List<User> expectedUsers = const <User>[
        User("1", "george.bluth@reqres.in", "George", "Bluth",
            "https://reqres.in/img/faces/1-image.jpg")
      ];

      List<User> response = await repository.loadUsers();
      Function eq = const DeepCollectionEquality().equals;

      bool equals = eq(response, expectedUsers);
      expect(equals, true);
    });

    test('throws and exception if the http return error',() async{
      final client = MockClient();
      final repository = RepositoryImpl(client: client);
      when(client.get(Uri.parse("https://reqres.in/api/users"))).thenAnswer(
              (_) async => http.Response('Not found', 404));

      expect(repository.loadUsers(), throwsException);
    });
  });
}

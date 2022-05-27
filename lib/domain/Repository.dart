

import 'User.dart';

abstract class Repository {
    Future<List<User>> loadUsers();
}

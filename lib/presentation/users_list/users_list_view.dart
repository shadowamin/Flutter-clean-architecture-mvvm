import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/domain/User.dart';
import 'package:flutter_clean_architecture/presentation/di/Providers.dart';
import 'package:flutter_clean_architecture/presentation/users_list/user_details_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const listUsersRoute = '/';

class UsersListView extends StatelessWidget {
  const UsersListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return ref.watch(usersViewModelProvider).usersData.when(data: (data) {
        return _createMyListView(context, data);
      }, loading: () {
        return const Loading();
      }, error: (e, s) {
        return const SizedBox();
      });
    });
  }

  Widget _createMyListView(BuildContext context, List<User> users) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users List')),
      body: users.isNotEmpty
          ? ListView.builder(
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index) {
                return UserListItem(users[index]);
              },
            )
          : const Center(child: Text('No items')),
    );
  }
}

class UserListItem extends StatelessWidget {
  const UserListItem(this.user, {Key? key}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
      onTap: () {
        navigateToUserDetails(context, user);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            user.avatar,
            height: 140,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.firstName,
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.left,
              ),
              Container(
                margin: const EdgeInsets.only(top: 12),
                child: Text(
                  user.lastName,
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.left,
                ),
              )
            ],
          ),
        ],
      ),
    ));
  }

  void navigateToUserDetails(BuildContext context, User user) async {
    await Navigator.pushNamed(context, userDetailsRoute, arguments: user);
  }
}

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
              Theme.of(context).colorScheme.secondary)),
    );
  }
}

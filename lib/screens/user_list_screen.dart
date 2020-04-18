import 'package:bloc_tree/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User list')),
      body: BlocProvider(
        create: (_) => UserSearchBloc()..add(UserSearchFilterChanged()),
        child: BlocBuilder<UserSearchBloc, UserSearchState>(
          builder: (_, state) {
            if (state is UserSearchLoaded) {
              return ListView.separated(
                separatorBuilder: (_, __) => Divider(),
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  final user = state.users[index];
                  return ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('ID: ${user.id}'),
                        const SizedBox(width: 20),
                        Text('Name: ${user.name}'),
                      ],
                    ),
                  );
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

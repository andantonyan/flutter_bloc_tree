import 'package:bloc_tree/bloc/bloc.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserListWithProjectListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User list / Project list')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(40),
        child: BlocProvider(
          create: (_) => UserProjectManagerBloc(
            children: [
              ProjectSearchBloc()..add(ProjectSearchFilterChanged()),
              UserManagerBloc(
                children: [
                  UserSearchBloc()..add(UserSearchFilterChanged()),
                  UserDeleteBloc(),
                  UserUpdateBloc(),
                ],
              )
            ],
          ),
          child: Column(
            children: <Widget>[
              Builder(
                builder: (context) {
                  return BlocBuilder<UserSearchBloc, UserSearchState>(
                    bloc: BlocProvider.of<UserProjectManagerBloc>(context).getChild<UserSearchBloc>(),
                    builder: (_, state) {
                      if (state is UserSearchLoaded) {
                        return Column(
                          children: <Widget>[
                            Text('Users (${state.users.length})', style: TextStyle(fontSize: 20)),
                            ListView.separated(
                              shrinkWrap: true,
                              separatorBuilder: (_, __) => Divider(),
                              itemCount: state.users.length > 4 ? 4 : state.users.length,
                              itemBuilder: (context, index) {
                                final user = state.users[index];
                                return ListTile(
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text('ID: ${user.id}'),
                                      const SizedBox(width: 20),
                                      const SizedBox(width: 20),
                                      Text('Name: ${user.name}'),
                                    ],
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      IconButton(
                                        icon: Icon(Icons.delete, color: Theme.of(context).errorColor.withOpacity(.7)),
                                        onPressed: () => BlocProvider.of<UserProjectManagerBloc>(context)
                                            .getChild<UserDeleteBloc>()
                                            .add(UserDeleted(user.id)),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.refresh, color: Theme.of(context).accentColor.withOpacity(.7)),
                                        onPressed: () => BlocProvider.of<UserProjectManagerBloc>(context)
                                            .getChild<UserUpdateBloc>()
                                            .add(UserUpdated(user.id, WordPair.random().first)),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  );
                },
              ),
              Divider(),
              Builder(
                builder: (context) {
                  return BlocBuilder<ProjectSearchBloc, ProjectSearchState>(
                    bloc: BlocProvider.of<UserProjectManagerBloc>(context).getChild<ProjectSearchBloc>(),
                    builder: (_, state) {
                      if (state is ProjectSearchLoaded) {
                        return Column(
                          children: <Widget>[
                            Text('Projects (${state.projects.length})', style: TextStyle(fontSize: 20)),
                            ListView.separated(
                              shrinkWrap: true,
                              separatorBuilder: (_, __) => Divider(),
                              itemCount: state.projects.length > 4 ? 4 : state.projects.length,
                              itemBuilder: (context, index) {
                                final project = state.projects[index];
                                return ListTile(
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text('ID: ${project.id}'),
                                      const SizedBox(width: 20),
                                      Text('User ID: ${project.userId}'),
                                      const SizedBox(width: 20),
                                      Text('Title: ${project.title}'),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

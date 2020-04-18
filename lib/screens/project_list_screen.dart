import 'package:bloc_tree/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Project list')),
      body: BlocProvider(
        create: (_) => ProjectSearchBloc()..add(ProjectSearchFilterChanged()),
        child: BlocBuilder<ProjectSearchBloc, ProjectSearchState>(
          builder: (_, state) {
            if (state is ProjectSearchLoaded) {
              return ListView.separated(
                separatorBuilder: (_, __) => Divider(),
                itemCount: state.projects.length,
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

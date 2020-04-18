import 'dart:math';

import 'package:english_words/english_words.dart';

import '../bloc_tree.dart';
import '../../data/models.dart';

final random = Random();


///
/// Events
///
abstract class ProjectSearchEvent extends BlocNodeEvent {}

class ProjectSearchFilterChanged extends ProjectSearchEvent {}

class ProjectSearchUserDeleted extends ProjectSearchEvent {
  final int userId;

  @override
  List<Object> get props => [userId];

  ProjectSearchUserDeleted(this.userId);
}

///
/// States
///
abstract class ProjectSearchState extends BlocNodeState {}

class ProjectSearchInitial extends ProjectSearchState {}

class ProjectSearchLoaded extends ProjectSearchState {
  final List<Project> projects;

  @override
  List<Object> get props => [projects];

  ProjectSearchLoaded(this.projects);
}

///
/// BloC
///
class ProjectSearchBloc extends BlocNode<ProjectSearchEvent, ProjectSearchState> {
  @override
  ProjectSearchState get initialState => ProjectSearchInitial();

  @override
  Stream<ProjectSearchState> mapEventToState(final ProjectSearchEvent event) async* {
    if (event is ProjectSearchFilterChanged) {
      final projects = List.generate(200, (i) => Project(i, WordPair.random().first, random.nextInt(10)));
      yield ProjectSearchLoaded(projects);
    } else if (event is ProjectSearchUserDeleted && state is ProjectSearchLoaded) {
      final projects = (state as ProjectSearchLoaded).projects;

      final updatedProjects = projects.where((p) => p.userId != event.userId).toList();
      yield ProjectSearchLoaded(updatedProjects);
    }
  }
}

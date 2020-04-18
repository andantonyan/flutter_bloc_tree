import '../bloc_tree.dart';
import '../nodes/project_search_bloc.dart';
import '../nodes/user_delete_bloc.dart';

class UserProjectManagerState extends BlocNodeState {}

class UserProjectManagerBloc extends BlocNode<BlocNodeEvent, UserProjectManagerState> {
  @override
  UserProjectManagerState get initialState => UserProjectManagerState();

  UserProjectManagerBloc({List<BlocNode> children}) : super(children: children);

  @override
  Stream<UserProjectManagerState> mapEventToState(BlocNodeEvent event) {}

  @override
  void onChildStateChange(BlocNodeState state) {
    if (state is UserDeleteSuccess) {
      getChild<ProjectSearchBloc>().add(ProjectSearchUserDeleted(state.id));
    }
  }
}

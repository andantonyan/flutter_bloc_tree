import '../bloc_tree.dart';
import '../nodes/user_delete_bloc.dart';
import '../nodes/user_search_bloc.dart';
import '../nodes/user_update_bloc.dart';

class UserManagerState extends BlocNodeState {}

class UserManagerBloc extends BlocNode<BlocNodeEvent, UserManagerState> {
  @override
  UserManagerState get initialState => UserManagerState();

  UserManagerBloc({List<BlocNode> children}) : super(children: children);

  @override
  Stream<UserManagerState> mapEventToState(BlocNodeEvent event) {}

  @override
  void onChildStateChange(BlocNodeState state) {
    if (state is UserDeleteSuccess) {
      getChild<UserSearchBloc>().add(UserSearchItemDeleted(state.id));
    }

    if (state is UserUpdateSuccess) {
      getChild<UserSearchBloc>().add(UserSearchItemUpdated(state.user));
    }
  }
}

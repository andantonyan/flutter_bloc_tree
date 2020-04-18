import 'package:english_words/english_words.dart';

import '../../data/models.dart';
import '../bloc_tree.dart';

///
/// Events
///
abstract class UserSearchEvent extends BlocNodeEvent {}

class UserSearchFilterChanged extends UserSearchEvent {}

class UserSearchItemDeleted extends UserSearchEvent {
  final int userId;

  @override
  List<Object> get props => [userId];

  UserSearchItemDeleted(this.userId);
}

class UserSearchItemUpdated extends UserSearchEvent {
  final User user;

  @override
  List<Object> get props => [user];

  UserSearchItemUpdated(this.user);
}

///
/// States
///
abstract class UserSearchState extends BlocNodeState {}

class UserSearchInitial extends UserSearchState {}

class UserSearchLoaded extends UserSearchState {
  final List<User> users;

  @override
  List<Object> get props => [users];

  UserSearchLoaded(this.users);
}

///
/// BloC
///
class UserSearchBloc extends BlocNode<UserSearchEvent, UserSearchState> {
  @override
  UserSearchState get initialState => UserSearchInitial();

  @override
  Stream<UserSearchState> mapEventToState(final UserSearchEvent event) async* {
    if (event is UserSearchFilterChanged) {
      final users = List.generate(20, (i) => User(i, WordPair.random().first));
      yield UserSearchLoaded(users);
    } else if (event is UserSearchItemDeleted && state is UserSearchLoaded) {
      final users = (state as UserSearchLoaded).users;

      final updatedUsers = users.where((u) => u.id != event.userId).toList();
      yield UserSearchLoaded(updatedUsers);
    } else if (event is UserSearchItemUpdated && state is UserSearchLoaded) {
      final users = (state as UserSearchLoaded).users;

      final updatedUsers = users.map((u) => u.id == event.user.id ? event.user : u).toList();
      yield UserSearchLoaded(updatedUsers);
    }
  }
}

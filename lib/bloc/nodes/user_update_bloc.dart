import '../bloc_tree.dart';
import '../../data/models.dart';

///
/// Events
///
abstract class UserUpdateEvent extends BlocNodeEvent {}

class UserUpdated extends UserUpdateEvent {
  final int id;
  final String name;

  @override
  List<Object> get props => [id, name];

  UserUpdated(this.id, this.name);
}

///
/// States
///
abstract class UserUpdateState extends BlocNodeState {}

class UserUpdateInitial extends UserUpdateState {}

class UserUpdateSuccess extends UserUpdateState {
  final User user;

  UserUpdateSuccess(this.user);

  @override
  List<Object> get props => [user];
}

///
/// BloC
///
class UserUpdateBloc extends BlocNode<UserUpdateEvent, UserUpdateState> {
  @override
  UserUpdateState get initialState => UserUpdateInitial();

  @override
  Stream<UserUpdateState> mapEventToState(final UserUpdateEvent event) async* {
    if (event is UserUpdated) {
      yield UserUpdateSuccess(User(event.id, event.name));
    }
  }
}

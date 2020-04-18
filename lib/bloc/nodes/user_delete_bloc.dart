import '../bloc_tree.dart';
import '../../data/models.dart';

///
/// Events
///
abstract class UserDeleteEvent extends BlocNodeEvent {}

class UserDeleted extends UserDeleteEvent {
  final int id;

  @override
  List<Object> get props => [id];

  UserDeleted(this.id);
}

///
/// States
///
abstract class UserDeleteState extends BlocNodeState {}

class UserDeleteInitial extends UserDeleteState {}

class UserDeleteSuccess extends UserDeleteState {
  final int id;

  UserDeleteSuccess(this.id);

  @override
  List<Object> get props => [id];
}

///
/// BloC
///
class UserDeleteBloc extends BlocNode<UserDeleteEvent, UserDeleteState> {
  @override
  UserDeleteState get initialState => UserDeleteInitial();

  @override
  Stream<UserDeleteState> mapEventToState(final UserDeleteEvent event) async* {
    if (event is UserDeleted) {
      yield UserDeleteSuccess(event.id);
    }
  }
}

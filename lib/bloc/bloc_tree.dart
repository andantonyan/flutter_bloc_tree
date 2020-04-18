import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

abstract class BlocNodeEvent extends Equatable {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

abstract class BlocNodeState extends Equatable {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

abstract class BlocNode<E extends BlocNodeEvent, S extends BlocNodeState> extends Bloc<E, S> {
  final List<BlocNode> children;

  final Subject _unsubscribe = BehaviorSubject();

  Iterable<BlocNode> get preOrder sync* {
    yield this;
    for (var child in children) {
      yield* child.preOrder;
    }
  }

  BlocNode({this.children = const []}) : assert(children != null) {
    final blocs = preOrder.toList();

    if (blocs.isNotEmpty) {
      MergeStream(blocs).takeUntil(_unsubscribe).listen(onChildStateChange);
    }
  }

  void onChildStateChange(BlocNodeState state) {}

  T getChild<T extends BlocNode>() => preOrder.firstWhere((child) => child is T, orElse: () => null);

  List<T> getChildren<T extends BlocNode>() => preOrder.whereType<T>();

  @override
  Future<void> close() {
    _unsubscribe.close();
    return super.close();
  }
}

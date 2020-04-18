

// User-Project Manager

void main() {
//  final userProjectManager = UserProjectManagerBloc(
//    children: [
//      ProjectSearchBloc(),
//      UserManagerBloc(
//        children: [
//          UserSearchBloc(),
//          UserDetailsBloc(),
//          UserUpdateBloc(),
//          UserDeleteBloc(),
//        ],
//      )
//    ],
//  );
//
//  final projectSearchBloc = userProjectManager.getChild<ProjectSearchBloc>();
//  final userSearchBloc = userProjectManager.getChild<UserSearchBloc>();
//  final userDetailsBloc = userProjectManager.getChild<UserDetailsBloc>();
//  final userUpdateBloc = userProjectManager.getChild<UserUpdateBloc>();
//  final userDeleteBloc = userProjectManager.getChild<UserDeleteBloc>();
//
//  projectSearchBloc.listen(print);
//  userSearchBloc.listen(print);
//  userDetailsBloc.listen(print);
//  userUpdateBloc.listen(print);
//  userDeleteBloc.listen(print);
//
//  projectSearchBloc.add(ProjectSearchFilterChanged());
//  userSearchBloc.add(UserSearchFilterChanged());
//  userDetailsBloc.add(UserDetailsFetch(2, 'User:2'));
//
//  Future.delayed(Duration(seconds: 2)).then((_) {
//    print('*** User with ID:"10" updated ***');
//    userUpdateBloc.add(UserUpdated(10, 'Updated:10'));
//  });
//
//  Future.delayed(Duration(seconds: 3)).then((_) {
//    print('*** User with ID:"2" updated ***');
//    userUpdateBloc.add(UserUpdated(2, 'Updated:2'));
//  });
//
//  Future.delayed(Duration(seconds: 4)).then((_) {
//    print('*** User with ID:"3" deleted ***');
//    userDeleteBloc.add(UserDeleted(3));
//  });
}

class User {
  final int id;
  final String name;

  const User(this.id, this.name);

  @override
  String toString() {
    return 'User{id: $id, name: $name}';
  }
}

class Project {
  final int id;
  final String title;
  final int userId;

  const Project(this.id, this.title, this.userId);

  @override
  String toString() {
    return 'Project{id: $id, title: $title, userId: $userId}';
  }
}

import 'package:bloc_tree/screens/project_list_screen.dart';
import 'package:bloc_tree/screens/user_list_screen.dart';
import 'package:bloc_tree/screens/user_list_with_project_list_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter BloC Tree Home Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Users'),
              onPressed: () => _navigate(context, UserListScreen()),
            ),
            RaisedButton(
              child: Text('Projects'),
              onPressed: () => _navigate(context, ProjectListScreen()),
            ),
            RaisedButton(
              child: Text('User list / Project list'),
              onPressed: () => _navigate(context, UserListWithProjectListScreen()),
            ),
          ],
        ),
      ),
    );
  }

  _navigate(final BuildContext context, final Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }
}

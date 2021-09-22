import 'package:flutter/material.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key? key, required this.id}) : super(key: key);
  final String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('post page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(id),
          ],
        ),
      ),
    );
  }
}

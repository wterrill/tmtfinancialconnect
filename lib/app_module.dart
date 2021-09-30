import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tmtfinancialconnect/post_page.dart';

import 'home_page.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/post', child: (_, __) => HomePage()),
    ChildRoute('/',
        child: (_, args) => PostPage(data: args.queryParams['data'] as String)),
    ChildRoute('/test',
        child: (_, args) => PostPage(data: args.queryParams['data'] as String)),
    ChildRoute('/andrea',
        child: (_, args) => PostPage(data: args.queryParams['data'] as String)),
  ];
}

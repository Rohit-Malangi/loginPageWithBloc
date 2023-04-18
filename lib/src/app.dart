import 'package:flutter/material.dart';
import 'package:login_page/widgets/login_widget.dart';

import '../blocs/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: 'login_bloc_app',
        home: Scaffold(
          appBar: AppBar(),
          body: const LoginWidget(),
        ),
      ),
    );
  }
}
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fic7_app_rudi_supratman/core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_fic7_app_rudi_supratman/data/datasources/auth_local_datasource.dart';

import 'bloc/login/login_bloc.dart';
import 'bloc/logout/logout_bloc.dart';
import 'bloc/register/register_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(),
        ),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: light,
          home: FutureBuilder<bool>(
            future: AuthLocalDatasource().isLogin(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (snapshot.hasData && snapshot.data!) {
                return const DashboardPage();
              } else {
                return const AuthPage();
              }
            },
          )),
    );
  }
}

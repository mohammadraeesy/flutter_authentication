import 'package:flutter/material.dart';
import 'package:flutter_authentication/core/main_page.dart';
import 'package:flutter_authentication/futures/authentication/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:flutter_authentication/futures/authentication/presentation/bloc/loginBloc/login_bloc.dart';
import 'package:flutter_authentication/futures/authentication/presentation/pages/login_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/splash_screen/splash_screen.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  // await di.initLogin();
  runApp(BlocProvider<AuthenticationBloc>(
    create: (context) {
      return sl<AuthenticationBloc>()..add(AppStarted());
    },
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is Authenticated) {
            return MainPage();
          }
          if (state is Unauthenticated) {
            return MyLoginPage();
          }

          return SplashScreen();
        },
      ),
    );
  }
}

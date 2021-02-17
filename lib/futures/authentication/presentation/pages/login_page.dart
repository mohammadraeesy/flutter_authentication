import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authentication/futures/authentication/presentation/bloc/loginBloc/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';

class MyLoginPage extends StatelessWidget {
  var textControllerEmaile = TextEditingController();
  var textControllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bloc Api king",
          style: TextStyle(
            color: Colors.amberAccent,
          ),
        ),
      ),
      body: BlocProvider<LoginBloc>(
        create: (_) => sl<LoginBloc>(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 5, left: 5, top: 10),
                  child: TextField(
                    controller: textControllerEmaile,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        hintText: "Emaile",
                        suffixIcon: Icon(Icons.email)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 5, left: 5, top: 10),
                  child: TextField(
                    controller: textControllerPassword,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        hintText: "password",
                        suffixIcon: Icon(Icons.account_circle_outlined)),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Container(color: Colors.yellow,width: 500,height: 500,),
              // child: BlocBuilder<LoginBloc, LoginState>(
              //   builder: (context, state) {
              //     if (state is LoadingState)
              //       return Padding(
              //         padding: EdgeInsets.only(bottom: 15),
              //         child: Center(
              //           child: Text("loading..."),
              //         ),
              //       );
              //     if (state is LoadedState) {
              //       return Text("login sucsesfully");
              //     }
              //     if (state is ErrorState) {
              //       return Padding(
              //         padding: EdgeInsets.only(bottom: 15),
              //         child: Center(
              //           child: Text(state.massage),
              //         ),
              //       );
              //     } else
              //       return Initial(context);
              //   },
              // ),
            )
          ],
        ),
      )
    );
  }

  Widget Initial(BuildContext context) {
    return FlatButton(
        child: Text('login'),
        color: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        onPressed: () {});
  }
}

import 'package:bloc_cubit_learning/cubits/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: BlocConsumer<InternetCubit, InternetState>(
            builder: (context, state) {
          if (state == InternetState.Gained) {
            return Text("Connected!");
          } else if (state == InternetState.Lost) {
            return Text("Internet Lost");
          } else {
            return Text("Loading ....");
          }
          // return Text("Loading");
        }, listener: (context, state) {
          if (state == InternetState.Gained) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Internet Connected"),
              backgroundColor: Colors.green,
            ));
          } else if (state == InternetState.Lost) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Internet Lost..")));
          }
        }),
        // child: BlocBuilder<InternetBloc, InternetState>(
        //   builder: (context, state) {
        //     if (state is InternetGainedState) {
        //       return Text("Connected!");
        //     } else if (state is InternetLostState) {
        //       return Text("Internet Lost");
        //     } else {
        //       return Text("Loading ....");
        //     }
        //     // return Text("Loading");
        //   },
        // ),
      ),
    ));
  }
}

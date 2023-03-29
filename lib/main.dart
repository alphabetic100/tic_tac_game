import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_game/game%20state/draw_state.dart';
import 'package:tic_tac_game/game%20state/game_state.dart';
import 'package:tic_tac_game/game%20state/o_win.dart';
import 'package:tic_tac_game/game%20state/tic_tac_cubit.dart';
import 'package:tic_tac_game/game%20state/x_win.dart';
import 'package:tic_tac_game/select%20status%20state/select_status_cubit.dart';
import 'package:tic_tac_game/tic%20tac%20game%20ui%20part/game_home.dart';

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
          create: (_) => SelectStatusCubit(),
        ),
        BlocProvider(
          create: (_) => TicTacCubit(),
        ),
        BlocProvider(
          create: (_) => GameStateCubit(),
        ),
        BlocProvider(
          create: (_) => OwinState(),
        ),
        BlocProvider(
          create: (_) => XwinState(),
        ),
        BlocProvider(
          create: (_) => DrawState(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}

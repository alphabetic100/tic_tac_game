import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_game/game%20state/draw_state.dart';
import 'package:tic_tac_game/game%20state/o_win.dart';
import 'package:tic_tac_game/game%20state/tic_tac_cubit.dart';
import 'package:tic_tac_game/game%20state/x_win.dart';
import 'package:tic_tac_game/select%20status%20state/select_status_cubit.dart';
import 'package:tic_tac_game/tic%20tac%20game%20ui%20part/current_player.dart';
import 'package:tic_tac_game/tic%20tac%20game%20ui%20part/win_checker.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 235, 248, 253),
      body: GameBody(),
    );
  }
}

class GameBody extends StatelessWidget {
  const GameBody({super.key});
  @override
  Widget build(BuildContext context) {
    String? winChecker;
    int drawCount = 0;

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SafeArea(
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "O",
                      style: TextStyle(
                          fontSize: 40,
                          shadows: const [
                            BoxShadow(
                              color: Color.fromARGB(255, 150, 168, 154),
                              spreadRadius: 2.5,
                              blurRadius: 5,
                              offset: Offset(2, 2),
                            )
                          ],
                          fontFamily: "Righteous",
                          color: Colors.lightBlue.shade300),
                    ),
                    Text(
                      "X",
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: "Righteous",
                        color: Colors.indigoAccent.shade200,
                        shadows: const [
                          BoxShadow(
                            color: Color.fromARGB(255, 150, 168, 154),
                            spreadRadius: 2.5,
                            blurRadius: 5,
                            offset: Offset(2, 2),
                          )
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.linear_scale,
                      size: 40,
                      color: Colors.brown,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BlocBuilder<OwinState, int>(
                      builder: (context, oState) {
                        return Text(
                          "$oState Wins",
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: "Righteous",
                              color: Colors.lightBlue.shade300),
                        );
                      },
                    ),
                    BlocBuilder<XwinState, int>(
                      builder: (context, xState) {
                        return Text(
                          "$xState Wins",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Righteous",
                            color: Colors.indigoAccent.shade200,
                          ),
                        );
                      },
                    ),
                    BlocBuilder<DrawState, int>(
                      builder: (context, drawState) {
                        return Text(
                          "$drawState Draws",
                          style: const TextStyle(
                            fontSize: 20,
                            fontFamily: "Righteous",
                            color: Colors.brown,
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  color: Colors.grey,
                  width: MediaQuery.of(context).size.width,
                  height: 493,
                  child: BlocBuilder<TicTacCubit, TicTacInitial>(
                    builder: (context, ticTacListState) => GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: ticTacListState.initialList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 2,
                                crossAxisSpacing: 2,
                                crossAxisCount: 3),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              if (ticTacListState.initialList[index] == "" &&
                                  winChecker == null) {
                                BlocProvider.of<TicTacCubit>(context).getIndex(
                                  index,
                                  CurrentPlyar.currentPlayer ? "O" : "X",
                                );
                                CurrentPlyar.currentPlayer =
                                    !CurrentPlyar.currentPlayer;
                                if (CurrentPlyar.currentPlayer == true) {
                                  BlocProvider.of<SelectStatusCubit>(context)
                                      .checkTic(1);
                                } else {
                                  BlocProvider.of<SelectStatusCubit>(context)
                                      .checkTic(2);
                                }
                                drawCount++;
                                winChecker =
                                    winCheck(ticTacListState.initialList);
                                if (winChecker == "O" || winChecker == "X") {
                                  if (winChecker == "O") {
                                    BlocProvider.of<OwinState>(context)
                                        .increment();
                                  } else {
                                    BlocProvider.of<XwinState>(context)
                                        .increment();
                                  }
                                  showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Center(
                                            child: Text(
                                              "Win!",
                                              style: TextStyle(
                                                fontSize: 30,
                                                fontFamily: "Righteous",
                                                color: winChecker == "O"
                                                    ? Colors.lightBlue.shade300
                                                    : Colors
                                                        .indigoAccent.shade200,
                                              ),
                                            ),
                                          ),
                                          content: winChecker == "O"
                                              ? Row(
                                                  children: [
                                                    Text(
                                                      "The Winner is",
                                                      style: TextStyle(
                                                        fontFamily: "Righteous",
                                                        fontSize: 18,
                                                        color: Colors
                                                            .lightBlue.shade300,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      "O",
                                                      style: TextStyle(
                                                        fontFamily: "Righteous",
                                                        fontSize: 40,
                                                        color: Colors
                                                            .lightBlue.shade300,
                                                      ),
                                                    )
                                                  ],
                                                )
                                              : Row(
                                                  children: [
                                                    Text(
                                                      "The Winner is",
                                                      style: TextStyle(
                                                        fontFamily: "Righteous",
                                                        fontSize: 18,
                                                        color: Colors
                                                            .indigoAccent
                                                            .shade200,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      "X",
                                                      style: TextStyle(
                                                        fontFamily: "Righteous",
                                                        fontSize: 40,
                                                        color: Colors
                                                            .indigoAccent
                                                            .shade200,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                          actions: [
                                            Center(
                                              child: GestureDetector(
                                                onTap: () {
                                                  BlocProvider.of<TicTacCubit>(
                                                          context)
                                                      .clearBoard(9);
                                                  // BlocProvider.of<
                                                  //             SelectStatusCubit>(
                                                  //         context)
                                                  //     .checkTic(0);
                                                  winChecker = null;
                                                  drawCount = 0;
                                                  Navigator.of(context).pop();
                                                },
                                                child: Container(
                                                  height: 40,
                                                  width: 140,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.blue,
                                                  ),
                                                  child: const Center(
                                                    child: Text(
                                                      "Continue Game",
                                                      style: TextStyle(
                                                        fontFamily: "Righteous",
                                                        letterSpacing: 2,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        // fontSize: 20,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        );
                                      });
                                } else if (drawCount == 9) {
                                  BlocProvider.of<DrawState>(context)
                                      .increment();
                                  showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Center(
                                          child: Text(
                                            "Draw!",
                                            style: TextStyle(
                                              fontSize: 30,
                                              fontFamily: "Righteous",
                                              color: Colors.brown,
                                            ),
                                          ),
                                        ),
                                        content: const Text(
                                          "The match is Draw 🙁",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontFamily: "Righteous",
                                            color: Colors.brown,
                                          ),
                                        ),
                                        actions: [
                                          ElevatedButton(
                                            onPressed: () {
                                              BlocProvider.of<TicTacCubit>(
                                                      context)
                                                  .clearBoard(9);
                                              BlocProvider.of<
                                                          SelectStatusCubit>(
                                                      context)
                                                  .checkTic(0);
                                              winChecker = null;
                                              drawCount = 0;
                                              Navigator.of(context).pop();
                                            },
                                            child: Container(
                                              height: 40,
                                              width: 140,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.blue,
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  "Continue Game",
                                                  style: TextStyle(
                                                    fontFamily: "Righteous",
                                                    letterSpacing: 2,
                                                    fontWeight: FontWeight.w800,
                                                    // fontSize: 20,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      );
                                    },
                                  );
                                }
                              }
                            },
                            child: Container(
                              color: const Color.fromARGB(255, 235, 248, 253),
                              child: Center(
                                child: Text(
                                  ticTacListState.initialList[index].toString(),
                                  style: TextStyle(
                                    fontSize: 80,
                                    fontFamily: "Righteous",
                                    color: ticTacListState.initialList[index] ==
                                            "O"
                                        ? Colors.lightBlue.shade300
                                        : Colors.indigoAccent.shade200,
                                    shadows: const [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(255, 150, 168, 154),
                                        spreadRadius: 2.5,
                                        blurRadius: 5,
                                        offset: Offset(2, 2),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                BlocBuilder<SelectStatusCubit, int>(
                  builder: (context, selectState) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: 100,
                          width: 100,
                          decoration: selectState == 1
                              ? BoxDecoration(
                                  color: Colors.blueGrey.shade100,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 5,
                                        spreadRadius: 5,
                                        color: Colors.grey.shade100)
                                  ],
                                )
                              : null,
                          child: Center(
                            child: Text(
                              "O",
                              style: TextStyle(
                                  fontSize: 80,
                                  shadows: const [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 150, 168, 154),
                                      spreadRadius: 2.5,
                                      blurRadius: 5,
                                      offset: Offset(2, 2),
                                    )
                                  ],
                                  fontFamily: "Righteous",
                                  color: Colors.lightBlue.shade300),
                            ),
                          ),
                        ),
                        Container(
                          height: 100,
                          width: 100,
                          decoration: selectState == 2
                              ? BoxDecoration(
                                  color: Colors.blueGrey.shade100,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 5,
                                        spreadRadius: 5,
                                        color: Colors.grey.shade100)
                                  ],
                                )
                              : null,
                          child: Center(
                            child: Text(
                              "X",
                              style: TextStyle(
                                fontSize: 80,
                                fontFamily: "Righteous",
                                color: Colors.indigoAccent.shade200,
                                shadows: const [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 150, 168, 154),
                                    spreadRadius: 2.5,
                                    blurRadius: 5,
                                    offset: Offset(2, 2),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        )
                      ],
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<TicTacCubit>(context).clearBoard(9);
                        BlocProvider.of<SelectStatusCubit>(context).checkTic(0);
                        winChecker = null;
                        BlocProvider.of<XwinState>(context).clear();
                        BlocProvider.of<OwinState>(context).clear();
                        BlocProvider.of<DrawState>(context).clear();
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.lightBlue.shade100,
                        ),
                        child: Center(
                          child: Text(
                            "New Game",
                            style: TextStyle(
                              color: Colors.indigoAccent.shade200,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<TicTacCubit>(context).clearBoard(9);
                        winChecker = null;
                        drawCount = 0;
                      },
                      child: Container(
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.indigoAccent.shade200,
                        ),
                        child: Center(
                          child: Text(
                            "Clear the board",
                            style: TextStyle(
                              color: Colors.lightBlue.shade100,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

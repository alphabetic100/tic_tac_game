import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_game/select%20status%20state/select_status_cubit.dart';
import 'package:tic_tac_game/tic%20tac%20game%20ui%20part/current_player.dart';
import 'package:tic_tac_game/tic%20tac%20game%20ui%20part/game_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    bool checkStart = false;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 248, 253),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
              ),
              child: Text(
                "Which one you always chose?",
                maxLines: 2,
                style: TextStyle(
                  fontSize: 35,
                  wordSpacing: 2,
                  letterSpacing: 2,
                  fontFamily: "Righteous",
                  fontWeight: FontWeight.w900,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<SelectStatusCubit, int>(
              builder: (context, selectState) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 70,
                    decoration: selectState == 1
                        ? BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.lightGreenAccent.shade100,
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 150, 168, 154),
                                spreadRadius: 2,
                                blurRadius: 7,
                              )
                            ],
                          )
                        : null,
                    child: GestureDetector(
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
                      onTap: () {
                        checkStart = true;
                        BlocProvider.of<SelectStatusCubit>(context).checkTic(1);
                        CurrentPlyar.currentPlayer = true;
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Text(
                      "or",
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: "Righteous",
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 70,
                    decoration: selectState == 2
                        ? BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.red.shade100,
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 150, 168, 154),
                                spreadRadius: 2,
                                blurRadius: 7,
                              )
                            ],
                          )
                        : null,
                    child: Center(
                      child: GestureDetector(
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
                        onTap: () {
                          checkStart = true;
                          BlocProvider.of<SelectStatusCubit>(context)
                              .checkTic(2);
                          CurrentPlyar.currentPlayer = false;
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              child: Container(
                height: 60,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent.shade200,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text(
                    "start",
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: "Righteous",
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              onTap: () {
                if (checkStart == true) {
                  BlocProvider.of<SelectStatusCubit>(context).checkTic(0);

                  Navigator.of(context).push(CupertinoPageRoute(builder: (_) {
                    return const GamePage();
                  }));
                  checkStart = false;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

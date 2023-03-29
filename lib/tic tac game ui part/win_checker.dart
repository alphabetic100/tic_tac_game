String? winCheck(List index) {
  bool winnerFound = false;
  if (!winnerFound) {
    if (index[0] == "O" && index[1] == "O" && index[2] == "O") {
      winnerFound = true;
      return "O";
    } else if (index[3] == "O" && index[4] == "O" && index[5] == "O") {
      winnerFound = true;
      return "O";
    } else if (index[6] == "O" && index[7] == "O" && index[8] == "O") {
      winnerFound = true;
      return "O";
    } else if (index[0] == "O" && index[3] == "O" && index[6] == "O") {
      winnerFound = true;
      return "O";
    } else if (index[1] == "O" && index[4] == "O" && index[7] == "O") {
      winnerFound = true;
      return "O";
    } else if (index[2] == "O" && index[5] == "O" && index[8] == "O") {
      winnerFound = true;
      return "O";
    } else if (index[0] == "O" && index[4] == "O" && index[8] == "O") {
      winnerFound = true;
      return "O";
    } else if (index[2] == "O" && index[4] == "O" && index[6] == "O") {
      winnerFound = true;
      return "O";
    }
    //for x
    else if (index[0] == "X" && index[1] == "X" && index[2] == "X") {
      winnerFound = true;
      return "X";
    } else if (index[3] == "X" && index[4] == "X" && index[5] == "X") {
      winnerFound = true;
      return "X";
    } else if (index[6] == "X" && index[7] == "X" && index[8] == "X") {
      winnerFound = true;
      return "X";
    } else if (index[0] == "X" && index[3] == "X" && index[6] == "X") {
      winnerFound = true;
      return "X";
    } else if (index[1] == "X" && index[4] == "X" && index[7] == "X") {
      winnerFound = true;
      return "X";
    } else if (index[2] == "X" && index[5] == "X" && index[8] == "X") {
      winnerFound = true;
      return "X";
    } else if (index[0] == "X" && index[4] == "X" && index[8] == "X") {
      winnerFound = true;
      return "X";
    } else if (index[2] == "X" && index[4] == "X" && index[6] == "X") {
      winnerFound = true;
      return "X";
    } else {
      return null;
    }
  }
}

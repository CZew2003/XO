import 'package:flutter/material.dart';

class XOManger {
  XOManger() {
    resetColor();
  }
  late List<Color> _colors;

  void resetColor() {
    _colors = <Color>[
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
    ];
  }

  bool changeColor(int i, Player player) {
    if (_colors.elementAt(i) != Colors.white) {
      return false;
    }
    _colors[i] = _getPlayersColor(player);
    return true;
  }

  Color _getPlayersColor(Player player) {
    return player == Player.X ? Colors.red : Colors.green;
  }

  Winner _getColorsPlayer(Color color) {
    return color == Colors.red ? Winner.X : Winner.O;
  }

  Color getColor(int index) {
    return _colors.elementAt(index);
  }

  Player changePlayer(Player player) {
    return player == Player.X ? Player.O : Player.X;
  }

  Winner getWinner() {
    if (_colors[0] == _colors[3] && _colors[3] == _colors[6] && _colors[0] != Colors.white) {
      return _getColorsPlayer(_colors[0]);
    }
    if (_colors[1] == _colors[4] && _colors[4] == _colors[7] && _colors[1] != Colors.white) {
      return _getColorsPlayer(_colors[1]);
    }
    if (_colors[2] == _colors[5] && _colors[5] == _colors[8] && _colors[2] != Colors.white) {
      return _getColorsPlayer(_colors[2]);
    }

    if (_colors[0] == _colors[1] && _colors[1] == _colors[2] && _colors[0] != Colors.white) {
      return _getColorsPlayer(_colors[0]);
    }
    if (_colors[3] == _colors[4] && _colors[4] == _colors[5] && _colors[3] != Colors.white) {
      return _getColorsPlayer(_colors[3]);
    }
    if (_colors[6] == _colors[7] && _colors[7] == _colors[8] && _colors[6] != Colors.white) {
      return _getColorsPlayer(_colors[6]);
    }

    if (_colors[0] == _colors[4] && _colors[4] == _colors[8] && _colors[0] != Colors.white) {
      return _getColorsPlayer(_colors[0]);
    }
    if (_colors[2] == _colors[4] && _colors[4] == _colors[6] && _colors[2] != Colors.white) {
      return _getColorsPlayer(_colors[2]);
    }

    for (final Color color in _colors) {
      if (color == Colors.white) {
        return Winner.NONE;
      }
    }

    return Winner.STALE;
  }
}

enum Winner { NONE, X, O, STALE }

enum Player { X, O }

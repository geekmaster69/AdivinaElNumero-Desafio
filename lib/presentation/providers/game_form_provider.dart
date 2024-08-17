import 'package:adivina_el_numero_desafio/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const gameLevels = [
  GameLevel(label: 'Fácil', tries: 5, range: 10),
  GameLevel(label: 'Medio', tries: 8, range: 20),
  GameLevel(label: 'Avanzado', tries: 15, range: 100),
  GameLevel(label: 'Extremo', tries: 25, range: 1000),
];

final gameFormProvider =
    StateNotifierProvider<GameFormNotifier, GameFormState>((ref) {
  return GameFormNotifier();
});

class GameFormNotifier extends StateNotifier<GameFormState> {
  GameFormNotifier() : super(GameFormState(gameLevel: gameLevels.first)) {
    onGameLevelChange(0);
  }

  void onGameLevelChange(int value) {
    final newGameLevel = gameLevels[value];
    state = state.copyWith(
        gameLevelIndex: value,
        triesRemaining: newGameLevel.tries,
        endGame: false,
        minorThan: [],
        greaterThan: [],
        gameLevel: newGameLevel,
        currentNumber: newGameLevel.getRandomNumber);
  }

  void onFormSubmit(int value) {
    if (value == 0) {
      setMessage('Debes elegir un numero entre 1 y ${state.gameLevel.range}');
      return;
    }

    if (value == state.currentNumber) {
      state = state.copyWith(history: [
        ...state.history,
        ResultEntity(number: value, color: Colors.green)
      ]);
      onGameLevelChange(state.gameLevelIndex);
      return;
    }

    if (value < state.currentNumber) {
      state = state.copyWith(
          greaterThan: [...state.greaterThan, ResultEntity(number: value)]);
    }
    if (value > state.currentNumber) {
      state = state.copyWith(
          minorThan: [...state.minorThan, ResultEntity(number: value)]);
    }

    state = state.copyWith(triesRemaining: state.triesRemaining - 1);

    if (state.triesRemaining == 0) {
      state = state.copyWith(endGame: true, history: [
        ...state.history,
        ResultEntity(number: value, color: Colors.red)
      ]);
    }
  }

  void setMessage(String message) {
    state = state.copyWith(message: message);
    state = state.copyWith(message: '');
  }
}

class GameFormState {
  final GameLevel gameLevel;
  final int triesRemaining;
  final int gameLevelIndex;
  final int currentNumber;
  final List<ResultEntity> minorThan;
  final List<ResultEntity> greaterThan;
  final List<ResultEntity> history;
  final String message;
  final bool endGame;

  GameFormState(
      {required this.gameLevel,
      this.triesRemaining = 0,
      this.currentNumber = 0,
      this.gameLevelIndex = 0,
      this.minorThan = const [],
      this.greaterThan = const [],
      this.history = const [],
      this.endGame = false,
      this.message = ''});

  GameFormState copyWith({
    GameLevel? gameLevel,
    bool? endGame,
    int? triesRemaining,
    int? gameLevelIndex,
    int? currentNumber,
    List<ResultEntity>? minorThan,
    List<ResultEntity>? greaterThan,
    List<ResultEntity>? history,
    String? message,
  }) {
    return GameFormState(
      gameLevel: gameLevel ?? this.gameLevel,
      endGame: endGame ?? this.endGame,
      gameLevelIndex: gameLevelIndex ?? this.gameLevelIndex,
      triesRemaining: triesRemaining ?? this.triesRemaining,
      currentNumber: currentNumber ?? this.currentNumber,
      minorThan: minorThan ?? this.minorThan,
      greaterThan: greaterThan ?? this.greaterThan,
      history: history ?? this.history,
      message: message ?? this.message,
    );
  }
}

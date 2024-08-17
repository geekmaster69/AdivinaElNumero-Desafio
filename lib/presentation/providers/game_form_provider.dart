import 'package:adivina_el_numero_desafio/domain/domain.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const gameLevels = [
  GameLevel(label: 'Fácil', tries: 5, range: 10),
  GameLevel(label: 'Medio', tries: 8, range: 20),
  GameLevel(label: 'Avanzado', tries: 15, range: 100),
  GameLevel(label: 'Extremo', tries: 25, range: 1000),
];

class GameFormNotifier extends StateNotifier<GameFormState> {
  GameFormNotifier() : super(GameFormState(gameLevel: gameLevels.first));

  void onGameLevelChange(int value){
    state = state.copyWith(gameLevelIndex: value);
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

  GameFormState(
      {required this.gameLevel,
      this.triesRemaining = 0,
      this.currentNumber = 0,
      this.gameLevelIndex = 1,
      this.minorThan = const [],
      this.greaterThan = const [],
      this.history = const [],
      this.message = ''});

  GameFormState copyWith({
    GameLevel? gameLevel,
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

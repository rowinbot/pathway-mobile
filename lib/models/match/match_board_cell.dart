import 'package:freezed_annotation/freezed_annotation.dart';

part 'match_board_cell.freezed.dart';
part 'match_board_cell.g.dart';

@freezed
class MatchBoardCell with _$MatchBoardCell {
  const factory MatchBoardCell({
    /// The team who owns this cell, or null if it is unowned.
    required int? team,
    required bool isPartOfASequence,
  }) = _MatchBoardCell;

  factory MatchBoardCell.fromJson(Map<String, Object?> json) =>
      _$MatchBoardCellFromJson(json);
}

List<List<MatchBoardCell>> buildBoard() {
  List<List<MatchBoardCell>> board = [];

  for (var i = 0; i < 10; i++) {
    List<MatchBoardCell> row = [];

    for (var j = 0; j < 10; j++) {
      row.add(
        const MatchBoardCell(
          team: null,
          isPartOfASequence: false,
        ),
      );
    }

    board.add(row);
  }

  return board;
}

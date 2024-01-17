import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pathway_mobile/models/match/match_board_cell.dart';

part 'sequence_bounds.freezed.dart';
part 'sequence_bounds.g.dart';

@freezed
class SequenceBounds with _$SequenceBounds {
  const factory SequenceBounds({
    required int startRow,
    required int endRow,
    required int startCol,
    required int endCol,
    required int sequencesCount,
  }) = _SequenceBounds;

  factory SequenceBounds.fromJson(Map<String, Object?> json) =>
      _$SequenceBoundsFromJson(json);
}

void updateBoardStateFromNewSequences(
  List<List<MatchBoardCell>> boardState,
  List<SequenceBounds> newSequences,
) {
  for (var newSequence in newSequences) {
    var row = newSequence.startRow;
    var col = newSequence.startCol;

    while (true) {
      boardState[row][col] = boardState[row][col].copyWith(
        isPartOfASequence: true,
      );

      if (row == newSequence.endRow && col == newSequence.endCol) break;

      if (col < newSequence.endCol) {
        col++;
      } else if (col > newSequence.endCol) {
        col--;
      }

      if (row < newSequence.endRow) {
        row++;
      } else if (row > newSequence.endRow) {
        row--;
      }
    }
  }
}

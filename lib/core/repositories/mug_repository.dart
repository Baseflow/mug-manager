import '../models/mug.dart';

abstract class MugRepository {
  Future<Mug> createMug({
    required Mug mug,
  });

  Future<List<Mug>> readMugs();

  Future<Mug> updateMug({
    required Mug mug,
  });

  Future<void> deleteMug({
    required int mugId,
  });
}

import 'package:mug_manager/core/repositories/mug_repository.dart';
import 'package:mug_manager/data/repositories/http_mug_repository.dart';

import '../models/mug.dart';

class MugService {
  MugService({
    required String endpoint,
  }) : mugRepository = HttpMugRepository(endpoint: endpoint);

  final MugRepository mugRepository;

  Future<Mug> createMug({
    required Mug mug,
  }) {
    return mugRepository.createMug(mug: mug);
  }

  Future<List<Mug>> getMugs() {
    return mugRepository.readMugs();
  }

  Future<Mug> updateMug({
    required Mug mug,
  }) {
    return mugRepository.updateMug(mug: mug);
  }

  Future<void> deleteMug({
    required int mugId,
  }) {
    return mugRepository.deleteMug(mugId: mugId);
  }
}

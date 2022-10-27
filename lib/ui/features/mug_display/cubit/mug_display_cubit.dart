import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mug_manager/core/services/mug_service.dart';

import '../../../../core/models/mug.dart';
import 'mug_display_state.dart';

class MugCubit extends Cubit<MugDisplayState> {
  MugCubit({
    required this.mugService,
  }) : super(const MugDisplayState(mugs: []));

  final MugService mugService;

  Future<void> initialize() async {
    getMugs();
  }

  Future<void> createMug({
    required Mug mug,
  }) async {
    Mug newMug = await mugService.createMug(mug: mug);
    emit(MugDisplayState(mugs: [...state.mugs, newMug]));
  }

  Future<void> getMugs() async {
    emit(MugDisplayState(mugs: await mugService.getMugs()));
  }

  Future<void> updateMug({
    required Mug mug,
  }) async {
    Mug updatedMug = await mugService.updateMug(mug: mug);
    List<Mug> updatedMugs = state.mugs
        .map((mug) => mug.id == updatedMug.id ? updatedMug : mug)
        .toList();
    emit(MugDisplayState(mugs: updatedMugs));
  }

  Future<void> deleteMug({
    required int mugId,
  }) async {
    await mugService.deleteMug(mugId: mugId);
    List<Mug> updatedMugs = state.mugs.where((mug) => mug.id != mugId).toList();
    emit(MugDisplayState(mugs: updatedMugs));
  }
}

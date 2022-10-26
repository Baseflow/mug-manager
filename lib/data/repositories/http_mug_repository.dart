import 'package:dio/dio.dart';
import 'package:mug_manager/core/repositories/mug_repository.dart';
import 'package:mug_manager/data/models/http_mug.dart';

import '../../core/models/mug.dart';

class HttpMugRepository implements MugRepository {
  const HttpMugRepository({
    required this.endpoint,
  });

  final String endpoint;

  @override
  Future<HttpMug> createMug({
    required Mug mug,
  }) async {
    Response<dynamic> response = await Dio().post(
      '$endpoint/mug',
      data: HttpMug.fromMug(mug).toJson(),
    );

    return HttpMug.fromJson(response.data);
  }

  @override
  Future<List<HttpMug>> readMugs() async {
    Response<dynamic> response = await Dio().get('$endpoint/mug');
    List<dynamic> jsonData = response.data;

    return jsonData.map((json) => HttpMug.fromJson(json)).toList();
  }

  @override
  Future<HttpMug> updateMug({
    required Mug mug,
  }) async {
    Response<dynamic> response = await Dio().put(
      '$endpoint/mug/${mug.id}',
      data: HttpMug.fromMug(mug).toJson(),
    );

    return HttpMug.fromJson(response.data);
  }

  @override
  Future<void> deleteMug({
    required int mugId,
  }) async {
    await Dio().delete('$endpoint/mug/$mugId');
  }
}

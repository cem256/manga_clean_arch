import 'package:manga_clean_arch/app/constants/endpoint_constants.dart';
import 'package:manga_clean_arch/app/errors/exceptions/exceptions.dart';
import 'package:manga_clean_arch/core/clients/network/network_client.dart';
import 'package:manga_clean_arch/feature/popular/data/models/manga/manga_model.dart';

class PopularRemoteDataSource {
  PopularRemoteDataSource({required NetworkClient networkClient}) : _networkClient = networkClient;

  final NetworkClient _networkClient;

  Future<List<MangaModel>> getPopularMangas({required int page, required int limit}) async {
    final response = await _networkClient.get<Map<String, dynamic>>(
      EndpointConstants.popular,
      queryParameters: {'page': page, 'limit': limit},
    );
    if (response.data == null || response.data!['data'] == null) {
      throw NullResponseException();
    }
    final mangaData = response.data!['data'] as List;

    return mangaData.map((e) => MangaModel.fromJson(e as Map<String, dynamic>)).toList();
  }
}

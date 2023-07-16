import 'package:manga_clean_arch/app/constants/endpoint_constants.dart';
import 'package:manga_clean_arch/app/errors/exceptions/exceptions.dart';
import 'package:manga_clean_arch/core/clients/network/network_client.dart';
import 'package:manga_clean_arch/feature/popular/data/models/manga/manga_model.dart';

abstract interface class SearchRemoteDataSource {
  Future<List<MangaModel>> searchMangas({required String query});
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  SearchRemoteDataSourceImpl({required NetworkClient networkClient}) : _networkClient = networkClient;

  final NetworkClient _networkClient;

  @override
  Future<List<MangaModel>> searchMangas({required String query}) async {
    final response = await _networkClient.get<Map<String, dynamic>>(
      EndpointConstants.search,
      queryParameters: {
        'q': query,
        'type': 'manga',
        'order_by': 'popularity',
        'sort': 'asc',
      },
    );
    if (response.data == null || response.data!['data'] == null) {
      throw NullResponseException();
    }
    final mangaData = response.data!['data'] as List;

    return mangaData.map((e) => MangaModel.fromJson(e as Map<String, dynamic>)).toList();
  }
}

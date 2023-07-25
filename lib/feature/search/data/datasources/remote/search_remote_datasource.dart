import 'package:dio/dio.dart';
import 'package:manga_clean_arch/app/constants/endpoint_constants.dart';
import 'package:manga_clean_arch/app/errors/exceptions/exceptions.dart';
import 'package:manga_clean_arch/core/clients/network/network_client.dart';
import 'package:manga_clean_arch/feature/popular/data/models/manga/manga_model.dart';

/// [SearchRemoteDataSource] is a contract class which defines the methods
/// that any implementation of [SearchRemoteDataSource] must implement.
abstract interface class SearchRemoteDataSource {
  Future<List<MangaModel>> searchMangas({required String query});
}

final class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  SearchRemoteDataSourceImpl({required NetworkClient networkClient}) : _networkClient = networkClient;

  final NetworkClient _networkClient;

  @override
  // Returns a list of [MangaModel] that match the query.
  Future<List<MangaModel>> searchMangas({required String query}) async {
    try {
      // Get mangas that match the given query from API using [NetworkClient]
      final response = await _networkClient.get<Map<String, dynamic>>(
        EndpointConstants.search,
        queryParameters: {
          'q': query,
          'type': 'manga',
          'order_by': 'popularity',
          'sort': 'asc',
        },
      );
      // If response is null or data is null, throw [NullResponseException]
      if (response.data == null || response.data!['data'] == null) {
        throw NullResponseException();
      }
      final mangaData = response.data!['data'] as List;
      // Map the response to a list of [MangaModel]
      return mangaData.map((e) => MangaModel.fromJson(e as Map<String, dynamic>)).toList();
      // Catch [DioException] and throw [DioException]
    } on DioException catch (e) {
      throw DioException(requestOptions: e.requestOptions, message: e.message);
      // Throw [UnknownException] for any other exception
    } catch (_) {
      throw UnknownException();
    }
  }
}

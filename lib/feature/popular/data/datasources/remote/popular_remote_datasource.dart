import 'package:dio/dio.dart';
import 'package:manga_clean_arch/app/constants/endpoint_constants.dart';
import 'package:manga_clean_arch/app/errors/exceptions/exceptions.dart';
import 'package:manga_clean_arch/core/clients/network/network_client.dart';
import 'package:manga_clean_arch/feature/popular/data/models/manga/manga_model.dart';

/// [PopularRemoteDataSource] is a contract class which defines the methods
/// that any implementation of [PopularRemoteDataSource] must implement.
abstract interface class PopularRemoteDataSource {
  Future<List<MangaModel>> getPopularMangas({required int page, required int limit});
}

class PopularRemoteDataSourceImpl implements PopularRemoteDataSource {
  PopularRemoteDataSourceImpl({required NetworkClient networkClient}) : _networkClient = networkClient;

  final NetworkClient _networkClient;
  @override
  // Returns a list of [MangaModel] from the remote API.
  Future<List<MangaModel>> getPopularMangas({required int page, required int limit}) async {
    try {
      // Get popular mangas from API using [NetworkClient]
      final response = await _networkClient.get<Map<String, dynamic>>(
        EndpointConstants.popular,
        queryParameters: {'page': page, 'limit': limit},
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

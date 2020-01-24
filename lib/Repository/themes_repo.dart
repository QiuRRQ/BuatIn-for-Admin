import 'package:admin/Models/theme/response.dart';

abstract class ThemeRepository {
  Future<Response> fetchMovies(int pageNumber, String searchParam);
}
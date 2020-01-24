import 'package:admin/Repository/ThemeProdRepository.dart';
import 'package:admin/Repository/themes_repo.dart';

enum Flavor { MOCK, PROD }

class Injector {
  static final Injector _instance = Injector.internal();

  static Flavor _flavor;

  static void configure(Flavor flavor) {
    _flavor = flavor;
  }

  factory Injector() => _instance;

  Injector.internal();

  ThemeRepository get themeRepository {
    switch (_flavor) {
      default:
        return new ThemeProdRepository();
    }
  }
}
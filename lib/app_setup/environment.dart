
import 'package:flutter_riverpod/flutter_riverpod.dart';

final environmentController =
    Provider<AppEnvironment>((ref) => AppEnvironment.dev);

class AppEnvironment {
  const AppEnvironment._inernal(this.value, this.code, this.url);

  ///
  final String value;

  ///
  final int code;

  ///
  final String url;

  ///
  static const AppEnvironment dev = AppEnvironment._inernal(
    'loxodo.tech',
    1,
    // 'https://loxodo.tech',
    'https://loxododev-bo.azurewebsites.net', // bo-vm
  );
  static const AppEnvironment production = AppEnvironment._inernal(
    'loxodo.app',
    2,
    'https://loxodo.app',
  );
  static const AppEnvironment staging = AppEnvironment._inernal(
    'loxodo.stage',
    3,
    'https://loxodo-staging.azurewebsites.net',
  );

  ///
  static AppEnvironment fromCode(int code) {
    switch (code) {
      case 1:
        return dev;
      case 3:
        return staging;
      default:
        return production;
    }
  }

  static List<AppEnvironment> values = [dev, production, staging];
}

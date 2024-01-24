import 'package:api/di/api_di.dart';

import 'di.config.dart';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() {
  configureApiDependencies(getIt);
  getIt.init();
}

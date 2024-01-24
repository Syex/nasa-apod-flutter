
import 'package:api/di/api_di.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@InjectableInit(
    initializerName: "initApiGetIt"
)
void configureApiDependencies(GetIt getIt) => getIt.initApiGetIt();

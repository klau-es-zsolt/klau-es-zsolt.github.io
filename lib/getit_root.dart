import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:wedding_page/getit_root.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
    initializerName: r'$initGetIt',
    preferRelativeImports: true,
    asExtension: false
)
void configureDependencies() => $initGetIt(getIt);
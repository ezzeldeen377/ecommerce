// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/data_source/auth_data_source/sign_up_data_source_impl.dart'
    as _i36;
import '../../data/repository/api_manager.dart' as _i320;
import '../../data/repository/auth_repository/Sign_up_Repository_impl.dart'
    as _i856;
import '../../features/auth_presetation/login/cubit/login_view_model.dart'
    as _i422;
import '../../features/auth_presetation/sign_up/cubit/sign_up_view_model.dart'
    as _i8;
import '../repository/auth_repository/sign_up/sign_up_Data_source.dart'
    as _i690;
import '../repository/auth_repository/sign_up/sign_up_repository.dart' as _i303;
import '../usecase/auth_usecase/sign_up_usecase.dart' as _i364;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i320.ApiManager>(() => _i320.ApiManager());
    gh.factory<_i422.LoginViewModel>(
        () => _i422.LoginViewModel(useCase: gh<InvalidType>()));
    gh.factory<_i690.SignUpDataSource>(
        () => _i36.SignUpDataSourceImpl(apiManager: gh<_i320.ApiManager>()));
    gh.factory<_i303.SignUpRepository>(() =>
        _i856.SignUpRepositoryImpl(dataSource: gh<_i690.SignUpDataSource>()));
    gh.factory<_i364.SignUpUseCase>(
        () => _i364.SignUpUseCase(repository: gh<_i303.SignUpRepository>()));
    gh.factory<_i8.SignUpViewModel>(
        () => _i8.SignUpViewModel(useCase: gh<_i364.SignUpUseCase>()));
    return this;
  }
}

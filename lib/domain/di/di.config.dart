// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/data_source/auth_data_source/Auth_data_source_impl.dart'
    as _i850;
import '../../data/data_source/home_tap_data_source/home_tap_data_source_impl.dart'
    as _i543;
import '../../data/repository/api_manager.dart' as _i320;
import '../../data/repository/auth_repository/Auth_Repository_impl.dart'
    as _i568;
import '../../data/repository/home_tap_repository/home_tap_repository_impl.dart'
    as _i98;
import '../../features/auth_presetation/login/cubit/login_view_model.dart'
    as _i422;
import '../../features/auth_presetation/sign_up/cubit/sign_up_view_model.dart'
    as _i8;
import '../../features/home_screen/cubit/home_screen_view_model.dart' as _i147;
import '../../features/home_screen/home_tap/cubit/home_tap_view_model.dart'
    as _i666;
import '../repository/auth_repository/sign_up/auth_Data_source.dart' as _i582;
import '../repository/auth_repository/sign_up/auth_repository.dart' as _i150;
import '../repository/home_tap/home_tap_data_source.dart' as _i669;
import '../repository/home_tap/home_tap_repository.dart' as _i984;
import '../usecase/auth_usecase/login_use_case.dart' as _i190;
import '../usecase/auth_usecase/sign_up_usecase.dart' as _i364;
import '../usecase/home_tap/brands_use_case.dart' as _i1070;
import '../usecase/home_tap/cateogory_use_case.dart' as _i975;

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
    gh.factory<_i147.HomeScreenViewModel>(() => _i147.HomeScreenViewModel());
    gh.singleton<_i320.ApiManager>(() => _i320.ApiManager());
    gh.factory<_i669.HomeTapDataSource>(
        () => _i543.HomeTapDataSourceImpl(apiManager: gh<_i320.ApiManager>()));
    gh.factory<_i984.HomeTapRepository>(() =>
        _i98.HomeTapRepositoryImpl(dataSource: gh<_i669.HomeTapDataSource>()));
    gh.factory<_i582.AuthDataSource>(
        () => _i850.AuthDataSourceImpl(apiManager: gh<_i320.ApiManager>()));
    gh.factory<_i150.AuthRepository>(
        () => _i568.AuthRepositoryImpl(dataSource: gh<_i582.AuthDataSource>()));
    gh.factory<_i975.CateogoryUseCase>(() =>
        _i975.CateogoryUseCase(repository: gh<_i984.HomeTapRepository>()));
    gh.factory<_i1070.BrandUseCase>(
        () => _i1070.BrandUseCase(repository: gh<_i984.HomeTapRepository>()));
    gh.factory<_i190.LoginUseCase>(
        () => _i190.LoginUseCase(repository: gh<_i150.AuthRepository>()));
    gh.factory<_i364.SignUpUseCase>(
        () => _i364.SignUpUseCase(repository: gh<_i150.AuthRepository>()));
    gh.factory<_i666.HomeTapViewModel>(() => _i666.HomeTapViewModel(
          cateogoryUseCase: gh<_i975.CateogoryUseCase>(),
          brandUseCase: gh<_i1070.BrandUseCase>(),
        ));
    gh.factory<_i422.LoginViewModel>(
        () => _i422.LoginViewModel(useCase: gh<_i190.LoginUseCase>()));
    gh.factory<_i8.SignUpViewModel>(
        () => _i8.SignUpViewModel(useCase: gh<_i364.SignUpUseCase>()));
    return this;
  }
}

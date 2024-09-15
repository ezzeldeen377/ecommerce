// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/api_manager.dart' as _i236;
import '../../data/data_source/Auth_data_source_impl.dart' as _i576;
import '../../data/data_source/cart_details_data_source_impl.dart' as _i645;
import '../../data/data_source/favourite_tab_data_source_impl.dart' as _i637;
import '../../data/data_source/home_tap_data_source_impl.dart' as _i318;
import '../../data/data_source/shop_tap_data_source_impl.dart' as _i782;
import '../../data/repository/Auth_Repository_impl.dart' as _i192;
import '../../data/repository/cart_details_repository_impl.dart' as _i165;
import '../../data/repository/favourite_tab_repository_impl.dart' as _i469;
import '../../data/repository/home_tap_repository_impl.dart' as _i12;
import '../../data/repository/shop_tap_repository_impl.dart' as _i423;
import '../../features/auth_presetation/login/cubit/login_view_model.dart'
    as _i422;
import '../../features/auth_presetation/sign_up/cubit/sign_up_view_model.dart'
    as _i8;
import '../../features/home_screen/cart_details/cubit/cart_details_view_model.dart'
    as _i534;
import '../../features/home_screen/cubit/home_screen_view_model.dart' as _i147;
import '../../features/home_screen/favourite_tap/cubit/favourite_tab_view_model.dart'
    as _i804;
import '../../features/home_screen/home_tap/cubit/home_tap_view_model.dart'
    as _i666;
import '../../features/home_screen/shop_tap/cubit/shop_tap_view_model.dart'
    as _i866;
import '../repository/auth_repository/sign_up/auth_Data_source.dart' as _i582;
import '../repository/auth_repository/sign_up/auth_repository.dart' as _i150;
import '../repository/cart_details/cart_details_data_source.dart' as _i809;
import '../repository/cart_details/cart_details_repository.dart' as _i513;
import '../repository/favourite_tap/favourite_tab_data_source.dart' as _i81;
import '../repository/favourite_tap/favourite_tab_repository.dart' as _i415;
import '../repository/home_tap/home_tap_data_source.dart' as _i669;
import '../repository/home_tap/home_tap_repository.dart' as _i984;
import '../repository/shop_tap/shop_tap_data_source.dart' as _i796;
import '../repository/shop_tap/shop_tap_repository.dart' as _i814;
import '../usecase/auth_usecase/login_use_case.dart' as _i190;
import '../usecase/auth_usecase/sign_up_usecase.dart' as _i364;
import '../usecase/favourite_tap/add_item_to_watch_list_use_case.dart' as _i834;
import '../usecase/home_tap/brands_use_case.dart' as _i1070;
import '../usecase/home_tap/cateogory_use_case.dart' as _i975;
import '../usecase/shop_tap/add_to_cart_use_case.dart' as _i219;
import '../usecase/shop_tap/delete_item_from_cart_use_case.dart' as _i317;
import '../usecase/shop_tap/get_cart_details_use_case.dart' as _i830;
import '../usecase/shop_tap/product_use_case.dart' as _i969;
import '../usecase/shop_tap/update_quantity_use_case.dart' as _i523;

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
    gh.singleton<_i236.ApiManager>(() => _i236.ApiManager());
    gh.factory<_i669.HomeTapDataSource>(
        () => _i318.HomeTapDataSourceImpl(apiManager: gh<_i236.ApiManager>()));
    gh.factory<_i796.ShopTapDataSource>(
        () => _i782.ShopTapDataSourceImpl(apiManager: gh<_i236.ApiManager>()));
    gh.factory<_i81.FavouriteTabDataSource>(() =>
        _i637.FavouriteTabDataSourceImpl(apiManager: gh<_i236.ApiManager>()));
    gh.factory<_i582.AuthDataSource>(
        () => _i576.AuthDataSourceImpl(apiManager: gh<_i236.ApiManager>()));
    gh.factory<_i415.FavouriteTabRepository>(() =>
        _i469.FavouriteTabRepositoryImpl(
            dataSource: gh<_i81.FavouriteTabDataSource>()));
    gh.factory<_i150.AuthRepository>(
        () => _i192.AuthRepositoryImpl(dataSource: gh<_i582.AuthDataSource>()));
    gh.factory<_i814.ShopTapRepository>(() =>
        _i423.ShopTabRepositoryImpl(dataSource: gh<_i796.ShopTapDataSource>()));
    gh.factory<_i809.CartDetailsDataSource>(() =>
        _i645.CartDetailsDataSourceImpl(apiManager: gh<_i236.ApiManager>()));
    gh.factory<_i190.LoginUseCase>(
        () => _i190.LoginUseCase(repository: gh<_i150.AuthRepository>()));
    gh.factory<_i364.SignUpUseCase>(
        () => _i364.SignUpUseCase(repository: gh<_i150.AuthRepository>()));
    gh.factory<_i984.HomeTapRepository>(() =>
        _i12.HomeTapRepositoryImpl(dataSource: gh<_i669.HomeTapDataSource>()));
    gh.factory<_i513.CartDetailsRepository>(() =>
        _i165.CartDetailsRepositoryImpl(
            dataSource: gh<_i809.CartDetailsDataSource>()));
    gh.factory<_i834.AddItemToWatchListUseCase>(() =>
        _i834.AddItemToWatchListUseCase(
            repository: gh<_i415.FavouriteTabRepository>()));
    gh.factory<_i219.AddToCartUseCase>(() =>
        _i219.AddToCartUseCase(repository: gh<_i814.ShopTapRepository>()));
    gh.factory<_i969.ProductUseCase>(
        () => _i969.ProductUseCase(repository: gh<_i814.ShopTapRepository>()));
    gh.factory<_i804.FavouriteTabViewModel>(() => _i804.FavouriteTabViewModel(
        addItemToWatchListUseCase: gh<_i834.AddItemToWatchListUseCase>()));
    gh.factory<_i1070.BrandUseCase>(
        () => _i1070.BrandUseCase(repository: gh<_i984.HomeTapRepository>()));
    gh.factory<_i975.CateogoryUseCase>(() =>
        _i975.CateogoryUseCase(repository: gh<_i984.HomeTapRepository>()));
    gh.factory<_i422.LoginViewModel>(
        () => _i422.LoginViewModel(useCase: gh<_i190.LoginUseCase>()));
    gh.factory<_i8.SignUpViewModel>(
        () => _i8.SignUpViewModel(useCase: gh<_i364.SignUpUseCase>()));
    gh.factory<_i866.ShopTabViewModel>(() => _i866.ShopTabViewModel(
          productUseCase: gh<_i969.ProductUseCase>(),
          addToCartUseCase: gh<_i219.AddToCartUseCase>(),
        ));
    gh.factory<_i666.HomeTapViewModel>(() => _i666.HomeTapViewModel(
          cateogoryUseCase: gh<_i975.CateogoryUseCase>(),
          brandUseCase: gh<_i1070.BrandUseCase>(),
        ));
    gh.factory<_i830.GetCartDetailsUseCase>(() => _i830.GetCartDetailsUseCase(
        repository: gh<_i513.CartDetailsRepository>()));
    gh.factory<_i317.DeleteItemFromCartUseCase>(() =>
        _i317.DeleteItemFromCartUseCase(
            repository: gh<_i513.CartDetailsRepository>()));
    gh.factory<_i523.UpdateQuantityUseCase>(() => _i523.UpdateQuantityUseCase(
        repository: gh<_i513.CartDetailsRepository>()));
    gh.factory<_i534.CartDetailsViewModel>(() => _i534.CartDetailsViewModel(
          cartDetailsUseCase: gh<_i830.GetCartDetailsUseCase>(),
          deleteItemFromCartUseCase: gh<_i317.DeleteItemFromCartUseCase>(),
          updateQuantityUseCase: gh<_i523.UpdateQuantityUseCase>(),
        ));
    return this;
  }
}

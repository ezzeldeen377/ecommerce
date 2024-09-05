import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/resources/constant_manager.dart';
import 'package:ecommerce/data/model/home_tap_models/BrandResponseDto.dart';
import 'package:ecommerce/data/model/home_tap_models/CategoryResponseDto.dart';
import 'package:ecommerce/data/repository/api_manager.dart';
import 'package:ecommerce/domain/entities/BrandResponseEntity.dart';
import 'package:ecommerce/domain/failures.dart';
import 'package:ecommerce/domain/repository/home_tap/home_tap_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeTapDataSource)
class HomeTapDataSourceImpl implements HomeTapDataSource {
  ApiManager apiManager;
  HomeTapDataSourceImpl({required this.apiManager});
  @override
  Future<Either<Failures, CategoryResponseDto>> getAllCategory() async {
    // TODO: implement getAllCategory
    try {
      var connectionCheck = await Connectivity().checkConnectivity();
      if (connectionCheck.contains(ConnectivityResult.mobile) ||
          connectionCheck.contains(ConnectivityResult.wifi)) {
        var response = await apiManager.getData(EndPoint.categoriesEndPoint);
        var categoryResponse = CategoryResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(categoryResponse );
        } else {
          return Left(ServerError(errorMessage: categoryResponse.message!));
        }
      } else {
        return Left(NetworkError(
            errorMessage:
                "no internet connection , please check your network"));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, BrandResponseEntity>> getAllBrands() async {
    // TODO: implement getAllBrands
    try {
      var connectionCheck = await Connectivity().checkConnectivity();
      if (connectionCheck.contains(ConnectivityResult.mobile) ||
          connectionCheck.contains(ConnectivityResult.wifi)) {
        var response = await apiManager.getData(EndPoint.brandsEndPoint);
        var categoryResponse = BrandResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(categoryResponse );
        } else {
          return Left(ServerError(errorMessage: categoryResponse.message!));
        }
      } else {
        return Left(NetworkError(
            errorMessage:
            "no internet connection , please check your network"));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }
}

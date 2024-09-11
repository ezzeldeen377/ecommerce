import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/resources/constant_manager.dart';
import 'package:ecommerce/core/widgets/shared_preferences_utils.dart';
import 'package:ecommerce/data/api_manager.dart';
import 'package:ecommerce/data/model/shop_tap/AddToCartResponseDto.dart';
import 'package:ecommerce/data/model/shop_tap/CartDetailsResponseDto.dart';
import 'package:ecommerce/data/model/shop_tap/ProductResponseDto.dart';
import 'package:ecommerce/domain/entities/AddToCartResponse.dart';
import 'package:ecommerce/domain/entities/CartDetailsResponseEntity.dart';
import 'package:ecommerce/domain/entities/ProductResponseEntity.dart';
import 'package:ecommerce/domain/failures.dart';
import 'package:ecommerce/domain/repository/shop_tap/shop_tap_data_source.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:  ShopTapDataSource)
class ShopTapDataSourceImpl implements ShopTapDataSource{
  ApiManager apiManager;
  ShopTapDataSourceImpl({required this.apiManager});
  @override
  Future<Either<Failures, ProductResponseDto>> getAllProducts() async {
   try{
     var checkConnection= await Connectivity().checkConnectivity();
     
     if(checkConnection.contains(ConnectivityResult.mobile)||
     checkConnection.contains(ConnectivityResult.wifi)){
       var response=await apiManager.getData(EndPoint.productsEndPoint);
         var productResponse=ProductResponseDto.fromJson(response.data);
         if(response.statusCode!>=200&&response.statusCode!<300){
           return Right(productResponse);
         }else{
           return Left(ServerError(errorMessage: productResponse.message!));
         }
       
     }else{
       return Left(NetworkError(errorMessage:  "no internet connection , please check your network"));
     }
   }catch (e){
     return Left(Failures(errorMessage: e.toString()));
   }
  }

  @override
  Future<Either<Failures, AddToCartResponseEntity>> addToCart(String productId) async {
    // TODO: implement addToCart
    try{
      var checkConnection= await Connectivity().checkConnectivity();

      if(checkConnection.contains(ConnectivityResult.mobile)||
          checkConnection.contains(ConnectivityResult.wifi)){
        var token=SharedPreferencesUtils.get(ConstantManager.token);
        var response=await apiManager.postData(EndPoint.addToCart,data: {
          'productId':productId
        },
          headers: {
            'token':token
          }
        );
        var addToCartResponse=AddToCartResponseDto.fromJson(response.data);
        if(response.statusCode!>=200&&response.statusCode!<300){
          return Right(addToCartResponse);
        }else{
          return Left(ServerError(errorMessage: addToCartResponse.message!));
        }

      }else{
        return Left(NetworkError(errorMessage:  "no internet connection , please check your network"));
      }
    }catch (e){
      return Left(Failures(errorMessage: e.toString()));
    }
  }


}
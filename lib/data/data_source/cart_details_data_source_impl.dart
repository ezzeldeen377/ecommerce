import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/resources/constant_manager.dart';
import 'package:ecommerce/core/widgets/shared_preferences_utils.dart';
import 'package:ecommerce/data/api_manager.dart';
import 'package:ecommerce/data/model/shop_tap/CartDetailsResponseDto.dart';
import 'package:ecommerce/domain/entities/CartDetailsResponseEntity.dart';
import 'package:ecommerce/domain/failures.dart';
import 'package:ecommerce/domain/repository/cart_details/cart_details_data_source.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: CartDetailsDataSource)
class CartDetailsDataSourceImpl implements CartDetailsDataSource{
  ApiManager apiManager;
  CartDetailsDataSourceImpl({required this.apiManager});
  Future<Either<Failures, CartDetailsResponseDto>> getAllCart() async {
    // TODO: implement getCartDetails
    try{
      var checkConnection= await Connectivity().checkConnectivity();

      if(checkConnection.contains(ConnectivityResult.mobile)||
          checkConnection.contains(ConnectivityResult.wifi)){
        var token=SharedPreferencesUtils.get(ConstantManager.token);
        var response=await apiManager.getData(EndPoint.addToCart,
            headers: {
              'token':token
            }
        );

        var cartDetailsResponse=CartDetailsResponseDto.fromJson(response.data);

        if(response.statusCode!>=200&&response.statusCode!<300){
          return Right(cartDetailsResponse);
        }else{
          return Left(ServerError(errorMessage: cartDetailsResponse.message!));
        }

      }else{
        return Left(NetworkError(errorMessage:  "no internet connection , please check your network"));
      }
    }catch (e){
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  Future<Either<Failures, CartDetailsResponseDto>> deleteItemFromCart(String productId) async {
    // TODO: implement getCartDetails
    try{
      var checkConnection= await Connectivity().checkConnectivity();

      if(checkConnection.contains(ConnectivityResult.mobile)||
          checkConnection.contains(ConnectivityResult.wifi)){
        var token=SharedPreferencesUtils.get(ConstantManager.token);
        print(token);
        var response=await apiManager.deleteData(EndPoint.addToCart+'/$productId',
            headers: {
              'token':token
            }
        );

        var cartDetailsResponse=CartDetailsResponseDto.fromJson(response.data);

        if(response.statusCode!>=200&&response.statusCode!<300){
          return Right(cartDetailsResponse);
        }else{
          return Left(ServerError(errorMessage: cartDetailsResponse.message!));
        }

      }else{
        return Left(NetworkError(errorMessage:  "no internet connection , please check your network"));
      }
    }catch (e){
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, CartDetailsResponseEntity>> updateItemQuantity(String productId,double count) async {
    // TODO: implement updateItemQuantity
    try{
      var checkConnection= await Connectivity().checkConnectivity();

      if(checkConnection.contains(ConnectivityResult.mobile)||
          checkConnection.contains(ConnectivityResult.wifi)){
        var token=SharedPreferencesUtils.get(ConstantManager.token);
        print(token);
        var response=await apiManager.updateData(EndPoint.addToCart+'/$productId',
            headers: {
              'token':token
            },
          data: {
            "count": count.toString()
          }
        );

        var cartDetailsResponse=CartDetailsResponseDto.fromJson(response.data);

        if(response.statusCode!>=200&&response.statusCode!<300){
          return Right(cartDetailsResponse);
        }else{
          return Left(ServerError(errorMessage: cartDetailsResponse.message!));
        }

      }else{
        return Left(NetworkError(errorMessage:  "no internet connection , please check your network"));
      }
    }catch (e){
      return Left(Failures(errorMessage: e.toString()));
    }
  }


}
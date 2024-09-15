import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';

import 'package:ecommerce/core/resources/constant_manager.dart';
import 'package:ecommerce/core/widgets/shared_preferences_utils.dart';
import 'package:ecommerce/data/api_manager.dart';
import 'package:ecommerce/data/model/auth_models/AddToWatchListResponseDto.dart';
import 'package:ecommerce/domain/failures.dart';
import 'package:ecommerce/domain/repository/favourite_tap/favourite_tab_data_source.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:FavouriteTabDataSource)
class FavouriteTabDataSourceImpl implements FavouriteTabDataSource{
  ApiManager apiManager;
  FavouriteTabDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, AddToWatchListResponseDto>> addToWatchList(String productId)async{
    // TODO: implement addToWatchList
    try{
      var checkConnection= await Connectivity().checkConnectivity();

      if(checkConnection.contains(ConnectivityResult.mobile)||
          checkConnection.contains(ConnectivityResult.wifi)){
        var token=SharedPreferencesUtils.get(ConstantManager.token);
        var response=await apiManager.postData(EndPoint.addToWatchList,data: {
          'productId':productId
        },
            headers: {
              'token':token
            }
        );
        var addToWatchListResponse=AddToWatchListResponseDto.fromJson(response.data);
        if(response.statusCode!>=200&&response.statusCode!<300){
          return Right(addToWatchListResponse);
        }else{
          return Left(ServerError(errorMessage: addToWatchListResponse.message!));
        }

      }else{
        return Left(NetworkError(errorMessage:  "no internet connection , please check your network"));
      }
    }catch (e){
      return Left(Failures(errorMessage: e.toString()));
    }
  }

}
import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entities/AddToWatchListResponse.dart';
import 'package:ecommerce/domain/failures.dart';
import 'package:ecommerce/domain/repository/favourite_tap/favourite_tab_data_source.dart';
import 'package:ecommerce/domain/repository/favourite_tap/favourite_tab_repository.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: FavouriteTabRepository)
class FavouriteTabRepositoryImpl implements FavouriteTabRepository{
  FavouriteTabDataSource dataSource;
  FavouriteTabRepositoryImpl({required this.dataSource});
  @override
  Future<Either<Failures, AddToWatchListResponseEntity>> addToWatchList(String productId) async {
    // TODO: implement addToWatchList
    var either =await dataSource.addToWatchList(productId);
    return either.fold((error)=>Left(error),(response)=>Right(response));
  }

}
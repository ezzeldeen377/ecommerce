import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entities/BrandResponseEntity.dart';
import 'package:ecommerce/domain/entities/CategoryResponseEntity.dart';
import 'package:ecommerce/domain/failures.dart';
import 'package:ecommerce/domain/repository/home_tap/home_tap_data_source.dart';
import 'package:ecommerce/domain/repository/home_tap/home_tap_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeTapRepository)
class HomeTapRepositoryImpl implements HomeTapRepository {
  HomeTapDataSource dataSource;
  HomeTapRepositoryImpl({required this.dataSource});
  @override
  Future<Either<Failures, CategoryResponseEntity>> getAllCategory() async {
    var either = await dataSource.getAllCategory();
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, BrandResponseEntity>> getAllBrands() async {
    // TODO: implement getAllBrands
    var either =await dataSource.getAllBrands();
    return either.fold((error)=>Left(error), (response)=>Right(response));
  }
}

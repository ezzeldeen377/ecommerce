import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entities/category_response_entity.dart';
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
}

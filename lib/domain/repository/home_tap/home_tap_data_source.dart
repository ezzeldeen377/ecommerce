import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entities/BrandResponseEntity.dart';
import 'package:ecommerce/domain/entities/CategoryResponseEntity.dart';
import 'package:ecommerce/domain/failures.dart';

abstract class HomeTapDataSource {
  Future<Either<Failures, CategoryResponseEntity>> getAllCategory();
  Future<Either<Failures, BrandResponseEntity>> getAllBrands();
}

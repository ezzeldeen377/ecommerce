
import 'package:ecommerce/domain/entities/BrandResponseEntity.dart';
import 'package:ecommerce/domain/entities/CategoryResponseEntity.dart';

abstract class HomeTapStates {}

class HomeTapInitialState extends HomeTapStates {}

class CategoryLoadingState extends HomeTapStates {}

class CategoryErrorState extends HomeTapStates {
  String errorMessage;
  CategoryErrorState({required this.errorMessage});
}

class CategorySuccessState extends HomeTapStates {
  CategoryResponseEntity category;
  CategorySuccessState({required this.category});
}
class BrandLoadingState extends HomeTapStates {}

class BrandErrorState extends HomeTapStates {
  String errorMessage;
  BrandErrorState({required this.errorMessage});
}

class BrandSuccessState extends HomeTapStates {
  BrandResponseEntity brand;
  BrandSuccessState({required this.brand});
}

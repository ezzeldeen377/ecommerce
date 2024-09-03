import 'package:ecommerce/domain/entities/category_response_entity.dart';

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

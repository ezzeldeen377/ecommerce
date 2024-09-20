import 'dart:math';

import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/domain/di/di.dart';
import 'package:ecommerce/domain/entities/CategoryResponseEntity.dart';
import 'package:ecommerce/domain/usecase/home_tap/brands_use_case.dart';
import 'package:ecommerce/domain/usecase/home_tap/cateogory_use_case.dart';
import 'package:ecommerce/presentation/home_screen/home_tap/cubit/home_tap_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeTapViewModel extends Cubit<HomeTapStates> {
  HomeTapViewModel({required this.cateogoryUseCase, required this.brandUseCase})
      : super(HomeTapInitialState());
  CateogoryUseCase cateogoryUseCase;
  BrandUseCase brandUseCase;
  List<DataEntity> categoryList = [];
  List<DataEntity> brandList = [];

  List<String> adsList = [ImageAssets.ad1, ImageAssets.ad2, ImageAssets.ad3];

  static HomeTapViewModel getInit(BuildContext context) =>
      BlocProvider.of<HomeTapViewModel>(context);
  Future<void> getCategory() async {
    emit(CategoryLoadingState());
    try {
      var either = await cateogoryUseCase.invoke();
      either.fold((error) {
        emit(CategoryErrorState(errorMessage: error.errorMessage));
      }, (response) {
        categoryList = response.data!.toList();
        emit(CategorySuccessState(category: response));
      });
    } catch (e) {
      emit(CategoryErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> getBrand() async {
    emit(BrandLoadingState());
    try {
      var either = await brandUseCase.invoke();
      either.fold((error) {
        emit(BrandErrorState(errorMessage: error.errorMessage));
      }, (response) {
        brandList = response.data!.toList();
        emit(BrandSuccessState(brand: response));
      });
    } catch (e) {
      emit(BrandErrorState(errorMessage: e.toString()));
    }
  }
}

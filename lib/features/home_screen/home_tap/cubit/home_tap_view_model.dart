import 'dart:math';

import 'package:ecommerce/domain/usecase/home_tap/cateogory_use_case.dart';
import 'package:ecommerce/features/home_screen/home_tap/cubit/home_tap_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeTapViewModel extends Cubit<HomeTapStates> {
  HomeTapViewModel({required this.cateogoryUseCase})
      : super(HomeTapInitialState());
  CateogoryUseCase cateogoryUseCase;
  Future<void> getCategory() async {
    emit(CategoryLoadingState());
    try {
      var either = await cateogoryUseCase.invoke();
      either.fold((error) {
        emit(CategoryErrorState(errorMessage: error.errorMessage));
      }, (response) {
        emit(CategorySuccessState(category: response));
      });
    } catch (e) {
      emit(CategoryErrorState(errorMessage: e.toString()));
    }
  }
}

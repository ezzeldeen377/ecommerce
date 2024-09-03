import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/domain/di/di.dart';
import 'package:ecommerce/features/home_screen/home_tap/cubit/home_tap_states.dart';
import 'package:ecommerce/features/home_screen/home_tap/cubit/home_tap_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class HomeTapView extends StatelessWidget {
  HomeTapViewModel viewModel = getIt<HomeTapViewModel>();

  @override
  Widget build(BuildContext context) {
    viewModel.getCategory();
    return BlocBuilder<HomeTapViewModel, HomeTapStates>(
        bloc: viewModel,
        builder: (context, state) {
          return Column(
            children: [
              Image.asset(IconAssets.routelogo),
            ],
          );
        });
  }
}

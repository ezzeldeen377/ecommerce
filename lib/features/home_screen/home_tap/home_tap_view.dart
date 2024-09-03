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
    return BlocBuilder<HomeTapViewModel, HomeTapStates>(
        bloc: viewModel,
        builder: (context, state) {
          if (state is CategorySuccessState) {
            return ListView.builder(
              itemBuilder: (context, index) =>
                  Text(state.category.data![index].name ?? ''),
              itemCount: 10,
            );
          }
          return Container(
            height: 100,
            color: Colors.black26,
          );
        });
  }
}

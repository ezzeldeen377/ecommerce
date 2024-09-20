import 'package:ecommerce/core/resources/constant_manager.dart';
import 'package:ecommerce/core/routes_manager/routes.dart';
import 'package:ecommerce/core/widgets/shared_preferences_utils.dart';
import 'package:flutter/material.dart';

class PersonalTapView extends StatelessWidget {
  const PersonalTapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: ElevatedButton(
              onPressed: () {
                SharedPreferencesUtils.remove(ConstantManager.token);
                SharedPreferencesUtils.remove(ConstantManager.keepLogin);
                Navigator.of(context).pushReplacementNamed(Routes.login);
              },
              child: Text('Log out'))),
    );
  }
}

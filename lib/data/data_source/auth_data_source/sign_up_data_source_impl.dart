import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/resources/constant_manager.dart';
import 'package:ecommerce/data/model/SignupResponseDto.dart';
import 'package:ecommerce/data/repository/api_manager.dart';
import 'package:ecommerce/domain/failures.dart';
import 'package:ecommerce/domain/repository/auth_repository/sign_up/sign_up_Data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SignUpDataSource)
class SignUpDataSourceImpl implements SignUpDataSource {
  ApiManager apiManager;
  SignUpDataSourceImpl({required this.apiManager});
  @override
  Future<Either<Failures, SignupResponseDto>> signUp(String name, String email,
      String phone, String password, String rePassword) async {
    // TODO: implement signUp
    try {
      var checkConnection = await Connectivity().checkConnectivity();
      if (checkConnection.contains(ConnectivityResult.wifi) ||
          checkConnection.contains(ConnectivityResult.mobile)) {
        var response =
            await apiManager.postData(EndPoint.signUpEndPoint, data: {
          "name": name,
          "email": email,
          "password": password,
          "rePassword": rePassword,
          "phone": phone
        });
        var signUpResponse = SignupResponseDto.fromJson(response.data);
        print(response.statusCode);

        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(signUpResponse);
        } else {
          return Left(ServerError(errorMessage: signUpResponse.message!));
        }
      } else {
        return Left(NetworkError(
            errorMessage:
                "no internet connection , please check your network"));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }
}

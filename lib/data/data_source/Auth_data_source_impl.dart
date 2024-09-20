import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/resources/constant_manager.dart';
import 'package:ecommerce/core/widgets/shared_preferences_utils.dart';
import 'package:ecommerce/data/model/auth_models/ForgetPasswordResponseDto.dart';
import 'package:ecommerce/data/model/auth_models/LoginResponeDto.dart';
import 'package:ecommerce/data/model/auth_models/SignupResponseDto.dart';
import 'package:ecommerce/data/api_manager.dart';
import 'package:ecommerce/domain/entities/forget_password_response_entity.dart';
import 'package:ecommerce/domain/failures.dart';
import 'package:ecommerce/domain/repository/auth_repository/sign_up/auth_Data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthDataSource)
class AuthDataSourceImpl implements AuthDataSource {
  ApiManager apiManager;
  AuthDataSourceImpl({required this.apiManager});
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
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          SharedPreferencesUtils.set(
              ConstantManager.token, signUpResponse.token);
          return Right(signUpResponse);
        } else {
          print(response.statusCode);
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

  @override
  Future<Either<Failures, LoginResponseDto>> login(
      String email, String password) async {
    // TODO: implement login
    try {
      var checkConnection = await Connectivity().checkConnectivity();
      if (checkConnection.contains(ConnectivityResult.mobile) ||
          checkConnection.contains(ConnectivityResult.wifi)) {
        var response = await apiManager.postData(EndPoint.loginEndPoint,
            data: {'email': email, 'password': password});
        var loginResponse = LoginResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          SharedPreferencesUtils.set(
              ConstantManager.token, loginResponse.token);
          return Right(loginResponse);
        } else {
          return Left(ServerError(errorMessage: loginResponse.message!));
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

  @override
  Future<Either<Failures, ForgetPasswordResponseDto>> forgetPassword(
      String email) async {
    try {
      var checkConnection = await Connectivity().checkConnectivity();
      if (checkConnection.contains(ConnectivityResult.mobile) ||
          checkConnection.contains(ConnectivityResult.wifi)) {
        var response = await apiManager
            .postData(EndPoint.forgetPassword, data: {'email': email});
        var forgetPasswordResponse =
            ForgetPasswordResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(forgetPasswordResponse);
        } else {
          return Left(
              ServerError(errorMessage: forgetPasswordResponse.message!));
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

  @override
  Future<Either<Failures, ForgetPasswordResponseDto>> verifyCode(
      String code) async {
    try {
      var checkConnection = await Connectivity().checkConnectivity();
      if (checkConnection.contains(ConnectivityResult.mobile) ||
          checkConnection.contains(ConnectivityResult.wifi)) {
        var response = await apiManager
            .postData(EndPoint.restCode, data: {'resetCode': code});
        var verfiyCodeResponse =
            ForgetPasswordResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(verfiyCodeResponse);
        } else {
          return Left(ServerError(errorMessage: verfiyCodeResponse.message!));
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

  @override
  Future<Either<Failures, ForgetPasswordResponseDto>> resetPassword(
      String email, String newPassword) async {
    try {
      var checkConnection = await Connectivity().checkConnectivity();
      if (checkConnection.contains(ConnectivityResult.mobile) ||
          checkConnection.contains(ConnectivityResult.wifi)) {
        var response = await apiManager.putData(EndPoint.resetPassword,
            data: {"email": email, "newPassword": newPassword});
        var resetPasswordResponse =
            ForgetPasswordResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(resetPasswordResponse);
        } else {
          return Left(
              ServerError(errorMessage: resetPasswordResponse.message!));
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

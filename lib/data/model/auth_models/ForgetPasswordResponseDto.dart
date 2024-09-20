import 'package:ecommerce/domain/entities/forget_password_response_entity.dart';

class ForgetPasswordResponseDto extends ForgetPasswordResponseEntity {
  ForgetPasswordResponseDto(
      {super.statusMsg, super.message, super.status, super.token});

  ForgetPasswordResponseDto.fromJson(Map<String, dynamic> json) {
    statusMsg = json['statusMsg'];
    message = json['message'];
    status = json['status'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusMsg'] = this.statusMsg;
    data['message'] = this.message;
    data['status'] = this.status;
    data['token'] = this.token;
    return data;
  }
}

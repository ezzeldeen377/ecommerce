import 'package:ecommerce/domain/entities/SignupResonseEntity.dart';

/// message : "success"
/// user : {"name":"ezzeldeen","email":"ezzeldeen@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2ZDQxNTQyNDg4MWQ2ZWRkNDFhNDYxNyIsIm5hbWUiOiJlenplbGRlZW4iLCJyb2xlIjoidXNlciIsImlhdCI6MTcyNTE3NTEwNywiZXhwIjoxNzMyOTUxMTA3fQ.R5iShAM_6-VIW2hdIJ58qyH1Dcj5UpxIEM1ZaqUoAkw"

class SignupResponseDto extends SignupResonseEntity {
  SignupResponseDto({super.message, super.user, super.token, super.statusMsg});

  SignupResponseDto.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }
}

/// name : "ezzeldeen"
/// email : "ezzeldeen@gmail.com"
/// role : "user"

class UserDto extends UserEntity {
  UserDto({
    super.name,
    super.email,
    this.role,
  });

  UserDto.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['role'] = role;
    return map;
  }
}

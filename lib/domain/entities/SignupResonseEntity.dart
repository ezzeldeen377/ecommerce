/// message : "success"
/// user : {"name":"ezzeldeen","email":"ezzeldeen@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2ZDQxNTQyNDg4MWQ2ZWRkNDFhNDYxNyIsIm5hbWUiOiJlenplbGRlZW4iLCJyb2xlIjoidXNlciIsImlhdCI6MTcyNTE3NTEwNywiZXhwIjoxNzMyOTUxMTA3fQ.R5iShAM_6-VIW2hdIJ58qyH1Dcj5UpxIEM1ZaqUoAkw"

class SignupResonseEntity {
  SignupResonseEntity({this.message, this.user, this.token, this.statusMsg});

  String? message;
  String? statusMsg;
  UserEntity? user;
  String? token;
}

/// name : "ezzeldeen"
/// email : "ezzeldeen@gmail.com"
/// role : "user"

class UserEntity {
  UserEntity({
    this.name,
    this.email,
  });

  String? name;
  String? email;

  toJson() {}
}

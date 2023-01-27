List<UserModel> usersFromJson(dynamic str) =>
    List<UserModel>.from((str).map((x) => UserModel.fromJson(x)));

class UserModel {
  int? userId;
  String? userName;
  String? userEmail;
  String? userPassword;

  UserModel(this.userId, this.userName, this.userEmail, this.userPassword);

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userName = json['user_name'];
    userEmail = json['user_email'];
    userPassword = json['user_password'];
  }

  Map<String, dynamic> toJson() => {
        "user_id": userId.toString(),
        "user_name": userName,
        "user_email": userEmail,
        "user_password": userPassword,
      };
}

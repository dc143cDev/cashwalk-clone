List<UserModel> usersFromJson(dynamic str) =>
    List<UserModel>.from((str).map((x) => UserModel.fromJson(x)));

class UserModel {
  int? ranking;
  int? userId;
  String? userName;
  String? userEmail;
  String? userPassword;
  String? affiliation;
  String? inviteCode;
  String? profile;

  UserModel(
    this.ranking,
    this.userId,
    this.userName,
    this.userEmail,
    this.userPassword,
    this.affiliation,
    this.inviteCode,
    this.profile,
  );

  UserModel.fromJson(Map<String, dynamic> json) {
    ranking = json['ranking'];
    userId = json['user_id'];
    userName = json['user_name'];
    userEmail = json['user_email'];
    userPassword = json['user_password'];
    affiliation = json['affiliation'];
    inviteCode = json['invite_code'];
    profile = json['profile_path'];
  }

  Map<String, dynamic> toJson() => {
        "ranking": ranking.toString(),
        "user_id": userId.toString(),
        "user_name": userName,
        "user_email": userEmail,
        "user_password": userPassword,
        "affiliation": affiliation,
        "invite_code": inviteCode
      };
}

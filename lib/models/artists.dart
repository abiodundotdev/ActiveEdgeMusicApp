class UserModel {
  String? userName;
  String? userEmail;
  dynamic walletBalance;
  dynamic phoneNumber;

  UserModel(
      {this.userName, this.userEmail, this.walletBalance, this.phoneNumber});

  factory UserModel.fromJson(Map data) {
    return UserModel(
      userEmail: data['email'],
      userName: data['name'],
      walletBalance: data['wallet_balance'],
      phoneNumber: data['phone'],
    );
  }
}

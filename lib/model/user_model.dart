class UserModel {
  String userName;
  String userPhone;
  bool isGD;
  bool isWD;
  bool isAD;
  bool isGAD;
  String exp;
  String expLevel;
  bool needNotification;
  List<bool> osType = [];

  UserModel(
      {required this.userName,
      required this.userPhone,
      required this.isGD,
      required this.isWD,
      required this.isAD,
      required this.isGAD,
      required this.exp,
      required this.expLevel,
      required this.needNotification,
      required this.osType});
}

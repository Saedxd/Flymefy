import '../../features/auth/domain/entity/user.dart';

class UserDataSingleton {
  UserDataSingleton._privateConstructor();

  UserAppInfo _user = const UserAppInfo();
  int _balance = 0;

  static final UserDataSingleton instance =
      UserDataSingleton._privateConstructor();

  final Map<String, dynamic> _userData = {};

  UserAppInfo get user => _user;
  int get balance => _balance;

  void setBalance(int value) {
    _balance = value;
    _userData['balance'] = value;
  }

  void setUserData(UserAppInfo value) {
    _userData['userData'] = value;
    _user = value;
  }
}

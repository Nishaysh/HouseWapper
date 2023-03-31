import 'package:flutter/widgets.dart';

import '../Models/user.dart';
import '../Resource/Auth_Methods.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user;
  final AuthMethods _authMethods = AuthMethods();

  Future<void> refreshUser() async {
    UserModel user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }

  UserModel get getUser => _user!;
}

import 'package:flutter/widgets.dart';

import '../Models/user.dart';
import '../Resource/Auth_Methods.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user;
  final AuthMethods _authMethods = AuthMethods();

  Future<void> refreshUser() async {
    UserModel? user =
        await _authMethods.getUserDetails(); // Note the use of UserModel? here
    if (user != null) {
      // Null check added
      _user = user;
      notifyListeners();
    }
  }

  UserModel? get getUser => _user; // Update the return type to UserModel?
}

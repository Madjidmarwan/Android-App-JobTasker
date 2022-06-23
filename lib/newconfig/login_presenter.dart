import 'package:signup/newconfig/rest_data.dart';
import 'package:signup/newconfig/user.dart';
import 'package:signup/newconfig/user_database.dart';

abstract class LoginPageContract {
  void onLoginSuccess(User user);
  void onLoginError(String error);
}

class LoginPagePresenter {
  LoginPageContract _view;
  RestData api = new RestData();
  LoginPagePresenter(this._view);

  doLogin(String username, String password) {
    //print("HI");
    var db = new DatabaseHelper();
    db
        .checkUser(User(username, password))
        .then((user) => _view.onLoginSuccess(user))
        .catchError((onError) {
      //print("Trying to Catch"+onError.toString());
      return _view.onLoginError(onError.toString());
    });
  }
}

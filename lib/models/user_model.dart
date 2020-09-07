import 'package:scoped_model/scoped_model.dart';

class UserModel extends Model{

  bool isLoading = false;

  void signUp(){

  }

  Future<void> signIn() async {
    isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 3));

    isLoading = false;
    notifyListeners();

  }

  void recoverPass(){

  }

  bool isLoggedin(){

  }
}
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as https;
import 'package:http/http.dart';

class LoginProvider extends ChangeNotifier{
  bool _loading =   false;
  bool get loading => _loading;

  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  void login(String email, String password) async{
      setLoading(true);
      try{
        Response response = await post(Uri.parse('https://reqres.in/api/login'),
          body: {
            'email': email,
            'password': password
          }
        );
        if(response.statusCode == 200){
          print("Successful");
          setLoading(false);
        }
        else{
          setLoading(false);
          print("Failded");
        }
      } catch(e){
        setLoading(false);
        print(e.toString());
      }
  }
}

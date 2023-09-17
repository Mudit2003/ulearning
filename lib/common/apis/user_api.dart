import 'package:ulearning_app/common/entities/entities.dart';
import 'package:ulearning_app/common/utils/http_util.dart';

class UserAPI {
  static login({LoginRequestEntity? param}) async {
    // print("Trying ot get a response");
    var response = await HttpUtil().post(
      path: 'api/login',
      queryParameters: param?.toJson(), // server always takes in json data
    );

    print("my response data is 2 :${response.toString()}");
    return UserLoginResponseEntity.fromJson(
        response); // here we go from json inside json to a proper model
  }
}

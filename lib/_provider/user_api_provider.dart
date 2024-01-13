import 'package:get/get.dart';

import '../model/user.dart';
import '../model/wave_card.dart';
import '../features/_common/constants.dart';
import '../features/_common/custom_exception.dart';

class UserApiProvider extends GetConnect {
  static UserApiProvider get to => Get.find();

  @override
  void onInit() {
    baseUrl = 'https://parseapi.back4app.com/graphql';

    httpClient.addRequestModifier<dynamic>((request) {
      request.headers['Accept-Encoding'] = 'gzip, deflate, br';
      request.headers['Content-Type'] = 'application/json';
      request.headers['Accept'] = 'application/json';
      request.headers['Connection'] = 'keep-alive';
      request.headers['DNT'] = '1';
      request.headers['Origin'] = Constants.parseOrigin;
      request.headers['X-Parse-Application-Id'] = Constants.parseAppId;
      request.headers['X-Parse-Client-Key'] = Constants.parseClientKey;
      return request;
    });

    super.onInit();
  }

  static const String _requestOtpQuery = r"""
    mutation SetPhoneNo($Params:Object!){
      callCloudCode(functionName:ResendOtp,params:$Params
      )
    }
  """;

  Future requestOtp(String scanData) async {
    var result = await mutation(
      _requestOtpQuery,
      url: '',
      variables: {
        "Params": {"otpId": scanData}
      },
    );

    if (result.hasError) throw result.graphQLErrors!;
  }

  static const String _verifyOtpQuery = r"""
    mutation SetPhoneNo($Params:Object!){
      callCloudCode(functionName:MatchOtp, params:$Params)
    }
  """;

  Future<User> verifyOtp(String? scanData, num otp) async {
    var result = await mutation(
      _verifyOtpQuery,
      url: '',
      variables: {
        "Params": {"otpId": scanData, "otp": otp}
      },
    );

    if (result.hasError) throw result.graphQLErrors!;

    var userMap = result.body?["callCloudCode"]["user"];

    if (userMap == null) throw CustomException("Something went wrong");

    return User.fromJson(userMap);
  }

  static const String _listCardsQuery = r"""
    query GetCardList($UserId:UserPointerWhereInput!,$Skip:Int!,$Limit:Int){
      cards(skip:$Skip,limit:$Limit,where:{
        user:$UserId
      }){
        results{
          id
          cardName
          cardId
          user{
            id
            username
          }
          client{
            id
            companyName
            maxNoOfCards
          }
        }
      }
    }
  """;

  Future<List<WaveCard>> listCards(String? userId) async {
    var result = await query(
      _listCardsQuery,
      url: '',
      variables: {
        "UserId": {"equalTo": userId},
        "Skip": 0,
        "Limit": 100
      },
    );

    if (result.hasError) throw result.graphQLErrors!;

    var cardsMap = result.body?["cards"]["results"];

    if (cardsMap == null) return [];

    return cardsMap.map<WaveCard>((item) => WaveCard.fromJson(item)).toList();
  }
}

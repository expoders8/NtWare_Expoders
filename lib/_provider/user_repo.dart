// //import 'package:fimber/fimber.dart';
// import 'package:meta/meta.dart';
// import 'package:wave_id/model/user.dart';
// import 'package:wave_id/model/wave_card.dart';
// import 'package:wave_id/repos/user_client.dart';

// class UserRepo {
//   final UserClient userApiClient;

//   UserRepo({required this.userApiClient});

//   requestOtp(String? scanData) async {
//     var result = await userApiClient.requestOtp(scanData);

//     if (result.hasException) throw result.exception!;

// //    Fimber.d(result.toString());
//   }

//   Future<User?> verifyOtp(String? scanData, num otp) async {
//     var result = await userApiClient.verifyOtp(scanData, otp);

//     if (result.hasException) throw result.exception!;

// //    Fimber.d(result.toString());

//     var userMap = result.data!["callCloudCode"]["user"];

//     if (userMap == null) return null;

//     return User.fromJson(userMap);
//   }

//   Future<List<WaveCard>?> listCards(String? userId) async {
//     var result = await userApiClient.listCards(userId);

//     if (result.hasException) throw result.exception!;

// //    Fimber.d(result.toString());

//     var cardsMap = result.data!["cards"]["results"];

//     if (cardsMap == null) return [];

//     return cardsMap.map<WaveCard>((item) => WaveCard.fromJson(item)).toList();
//   }
// }

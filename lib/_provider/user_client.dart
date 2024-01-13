// import 'package:graphql_flutter/graphql_flutter.dart';
// import 'package:meta/meta.dart';

// class UserClient {
//   final GraphQLClient client;

//   UserClient({required this.client});

//   final String _requestOtpQuery = r"""
//     mutation SetPhoneNo($Params:Object!){
//       callCloudCode(functionName:ResendOtp,params:$Params
//       )
//     }
//   """;

//   final String _verifyOtpQuery = r"""
//     mutation SetPhoneNo($Params:Object!){
//       callCloudCode(functionName:MatchOtp,params:$Params
//       )
//     }
//   """;

//   final String _listCardsQuery = r"""
//     query GetCardList($UserId:UserPointerWhereInput!,$Skip:Int!,$Limit:Int){
//       cards(skip:$Skip,limit:$Limit,where:{
//         user:$UserId
//       }){
//         results{
//           id
//           cardName
//           cardId
//           user{
//             id
//             username
//           }
//           client{
//             id
//             companyName
//             maxNoOfCards
//           }
//         }
//       }
//     }
//   """;

//   Future<QueryResult> requestOtp(String? scanData) async {

//     return client.mutate(
//       MutationOptions(
//           document: gql(_requestOtpQuery),
//           variables: {
//             "Params": {"otpId": scanData}
//           },
//           fetchPolicy: FetchPolicy.cacheAndNetwork),
//     );
//   }

//   Future<QueryResult> verifyOtp(String? scanData, num otp) async {
//     return client.mutate(
//       MutationOptions(
//           document: gql(_verifyOtpQuery),
//           variables: {
//             "Params": {"otpId": scanData, "otp": otp}
//           },
//           fetchPolicy: FetchPolicy.cacheAndNetwork),
//     );
//   }

//   Future<QueryResult> listCards(String? userId) async {
//     return client.query(
//       QueryOptions(
//           document: gql(_listCardsQuery),
//           variables: {
//             "UserId": {"equalTo": userId},
//             "Skip": 0,
//             "Limit": 100
//           },
//           fetchPolicy: FetchPolicy.cacheAndNetwork),
//     );
//   }
// }

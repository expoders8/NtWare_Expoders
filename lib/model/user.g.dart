// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..id = json['id'] as String?
    ..firstName = json['firstName'] as String?
    ..lastName = json['lastName'] as String?
    ..mobileNo = json['mobileNo'] as String?
    ..email = json['email'] as String?
    ..company = json['company'] as String?
    ..sessionToken = json['sessionToken'] as String?;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'mobileNo': instance.mobileNo,
      'email': instance.email,
      'company': instance.company,
      'sessionToken': instance.sessionToken,
    };

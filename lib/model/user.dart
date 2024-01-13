import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  String? id;

  String? firstName;

  String? lastName;

  String? mobileNo;

  String? email;

  String? company;

  @JsonKey(name: "sessionToken")
  String? sessionToken;

  User();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

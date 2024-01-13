// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wave_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WaveCard _$WaveCardFromJson(Map<String, dynamic> json) {
  return WaveCard(
    json['id'] as String?,
    json['cardName'] as String?,
    json['cardId'] as String?,
  );
}

Map<String, dynamic> _$WaveCardToJson(WaveCard instance) => <String, dynamic>{
      'id': instance.id,
      'cardName': instance.name,
      'cardId': instance.cardId,
    };

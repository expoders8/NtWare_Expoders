import 'package:json_annotation/json_annotation.dart';

part 'wave_card.g.dart';

@JsonSerializable(explicitToJson: true)
class WaveCard {
  String? id;

  @JsonKey(name: "cardName")
  String? name;

  String? cardId;

  WaveCard(this.id, this.name, this.cardId);

  Future<List<int>> get encodedIdentifier async {
    var finalArray = List.filled(20, 0);

//    var cardId = "12";

    var tempCardId = cardId;
    if (cardId!.length % 2 != 0) tempCardId = '0$cardId';

    finalArray[0] =
        int.parse('0x${((tempCardId!.length ~/ 2) * 8).toRadixString(16)}');

    for (var i = 0, j = 1; i < tempCardId.length; i += 2, j++) {
      finalArray[j] =
          int.parse('${tempCardId[i]}${tempCardId[i + 1]}', radix: 16);
    }

    // for (var i = 0; i < finalArray.length; i++) finalArray[i] ??= 0;

    //if (id == "DEFAULT_CARD")
//    var byteArray = TEA.encode(cardId);
//
//    finalArray[0] = 0x40; //int.parse('0x04', radix: 0); //64
//
//    for (int i = 1; i <= 8; i++) finalArray[i] = byteArray[i - 1];
//
//    for (int i = 9; i <= 19; i++)
//      finalArray[i] = 0x00; //int.parse('0x00', radix: 0);

//    var arr = [0x10,0x01, 0x23];
    return finalArray; //[0x24, 0x76, 0x86, 0x20];
    //return await TeaHelper.getIdentifierAsUInt8List(cardId);
//    else
//      return Uint8List.fromList(cardId.codeUnits);
  }

  factory WaveCard.fromJson(Map<String, dynamic> json) =>
      _$WaveCardFromJson(json);

  Map<String, dynamic> toJson() => _$WaveCardToJson(this);
}

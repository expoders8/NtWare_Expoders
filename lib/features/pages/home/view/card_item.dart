import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../home_screen.x.dart';
import '../../../../model/wave_card.dart';

class CardItem extends StatelessWidget {
  final WaveCard waveCard;

  const CardItem({
    Key? key,
    required this.waveCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Get.theme.colorScheme.secondary,
      elevation: 5,
      child: ListTile(
        title: Text(waveCard.name!),
        subtitle: Text(waveCard.cardId!),
        onTap: () => HomeScreenX.to.scanAndAuthenticate(waveCard),
      ),
    );
  }
}

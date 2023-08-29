import 'package:flutter/material.dart';
import 'package:triki_app/utils/responsive.dart';

class winnerDialog extends StatelessWidget {
  const winnerDialog({
    super.key,
    required this.winnerText,
  });

  final String winnerText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image(
          image: const AssetImage('assets/images/trailing-icon.png'),
          height: Responsive.distancePercentFromHeight(context, 8.7378),
          width: Responsive.distancePercentFromWidth(context, 8.7378),
        ),
        Text('Ganador\nJugador $winnerText',
            style: TextStyle(
              fontSize: Responsive.distancePercentText(context, 4.3901),
              color: const Color(0xff21005D),
            ))
      ],
    );
  }

}

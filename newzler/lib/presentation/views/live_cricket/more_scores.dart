import 'package:flutter/material.dart';
import 'package:newzler/configs/utils.dart';
import 'package:newzler/presentation/views/live_cricket/widgets/widgets.dart';

class MoreScores extends StatelessWidget {
  const MoreScores({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(context),
      backgroundColor: Utils.lightGreyColor4,
    );
  }

  _getBody(context) {
    return const SafeArea(
        child: Padding(
      padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
      // slider row
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            // container card 1
            LiveScoreCard(),
            LiveScoreCard(),
            LiveScoreCard()
          ],
        ),
      ),
    ));
  }
}

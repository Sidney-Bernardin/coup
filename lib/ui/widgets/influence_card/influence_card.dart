import 'package:flutter/material.dart';

import 'package:flip_card/flip_card.dart';

import '../../../data/influence_data.dart' as influence_data;

class InfluenceCard extends StatelessWidget {
  influence_data.InfluenceData influenceData;

  InfluenceCard(this.influenceData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 145 * 1.7,
      height: 174 * 1.7,
      child: Card(
        color: const Color(0x000000),
        elevation: 30,
        child: FlipCard(
          direction: FlipDirection.HORIZONTAL,
          speed: 250,
          onFlipDone: (status) {},
          back: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(width: 5, color: Colors.black45),
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              image: DecorationImage(
                image: AssetImage("assets/images/${influenceData.name}.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.black45,
                  ),
                  child: Text(
                    influenceData.nameUpper,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'SecularOne',
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.black45,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        influenceData.effect,
                        style: const TextStyle(
                          fontSize: 15,
                          fontFamily: 'SecularOne',
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        influenceData.counteraction,
                        style: const TextStyle(
                          fontSize: 12.5,
                          fontFamily: 'SecularOne',
                          color: Colors.white70,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          front: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 5, color: Colors.white70),
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              image: const DecorationImage(
                image: AssetImage("assets/images/back.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Container(),
          ),
        ),
      ),
    );
  }
}

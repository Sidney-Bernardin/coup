import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flip_card/flip_card.dart';
import 'package:coup/theme.dart';

class _Description extends StatelessWidget {
  String effect;
  String counteraction;

  _Description({required this.effect, required this.counteraction});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.black45,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            effect,
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
          Text(
            counteraction,
            style: TextStyle(
              fontSize: 12.5,
              color: Colors.white70,
            ),
          )
        ],
      ),
    );
  }
}

class InfluenceCard extends StatefulWidget {
  Map info;

  InfluenceCard(this.info, {Key? key}) : super(key: key);

  @override
  _InfluenceCardState createState() => _InfluenceCardState();
}

class _InfluenceCardState extends State<InfluenceCard>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: InfluenceCardTheme.width,
      height: InfluenceCardTheme.height,
      child: Card(
        elevation: 30,
        color: Color(0x000000),
        child: FlipCard(
          direction: FlipDirection.HORIZONTAL,
          speed: 250,
          onFlipDone: (status) {},
          front: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(width: 5, color: Colors.black45),
              borderRadius: BorderRadius.all(Radius.circular(15)),
              image: DecorationImage(
                image: AssetImage("assets/${widget.info['name_low']}.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.black45,
                  ),
                  child: Text(
                    widget.info['name_up'],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                Expanded(child: SizedBox()),
                _Description(
                  effect: widget.info['effect'],
                  counteraction: widget.info['counteraction'],
                ),
              ],
            ),
          ),
          back: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 5, color: Colors.black45),
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Colors.blueGrey,
            ),
            child: Container(
              child: Center(
                child: Text(
                  'Coup',
                  style: TextStyle(
                    color: Colors.orange[100],
                    fontSize: 30,
                    fontFamily: 'Frijole',
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

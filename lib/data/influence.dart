enum Influence { ambassador, assassin, captain, contessa, duke }

extension InfluenceExtension on Influence {
  String get name => [
        'ambassador',
        'assassin',
        'captain',
        'contessa',
        'duke',
      ][index];

  String get nameUpper => [
        'Ambassador',
        'Assassin',
        'Captain',
        'Contessa',
        'Duke',
      ][index];

  String get action => [
        'Exchange',
        'Assassinate',
        'Steal',
        '',
        'Tax',
      ][index];

  String get effect => [
        'Exchange cards with Court Deck.',
        'Pay 3 coins, chose a player to lose an Influence Card.',
        'Take 2 coins from another player.',
        '',
        'Take 3 coins.',
      ][index];

  String get counteraction => [
        'Blocks, Steal.',
        '',
        'Blocks, Steal.',
        'Blocks, Assassinate',
        'Blocks, Foreign Aid.',
      ][index];
}

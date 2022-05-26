class InfluenceCardInfo {
  static const Map ambassador = {
    'name_low': 'ambassador',
    'name_up': 'Ambassador',
    'action': 'Exchange',
    'effect': 'Exchange cards with Court Deck.',
    'counteraction': 'Blocks, Steal.',
  };
  static const Map assassin = {
    'name_low': 'assassin',
    'name_up': 'Assassin',
    'action': 'Assassinate',
    'effect': 'Pay 3 coins, chose a player to lose an Influence Card.',
    'counteraction': '',
  };
  static const Map captain = {
    'name_low': 'captain',
    'name_up': 'Captain',
    'action': 'Steal',
    'effect': 'Take 2 coins from another player.',
    'counteraction': 'Blocks, Steal.',
  };
  static const Map contessa = {
    'name_low': 'contessa',
    'name_up': 'Contessa',
    'action': '',
    'effect': '',
    'counteraction': 'Blocks, Assassinate',
  };
  static const Map duke = {
    'name_low': 'duke',
    'name_up': 'Duke',
    'action': 'Tax',
    'effect': 'Take 3 coins.',
    'counteraction': 'Blocks, Foreign Aid.',
  };
}

// pre-define and store the standard 64 possible patterns along with number, title and definitions
class Hexagram {
  final String hexNo;
  final List<String> pattern; // list of 6 lines per hexagram
  final String title;
  final String definition;

  Hexagram(
      {required this.hexNo,
      required this.pattern,
      required this.title,
      required this.definition});
}

// define the 64 hexagrams in a map or a list
final List<Hexagram> predefinedHexagrams = [
  Hexagram(
      hexNo: '1',
      pattern: ['yang', 'yang', 'yang', 'yang', 'yang', 'yang'],
      title: 'Qián - the Creative',
      definition:
          'The Creative works sublime success, furthering through perseverance.'),
  Hexagram(
      hexNo: '2',
      pattern: ['yin', 'yin', 'yin', 'yin', 'yin', 'yin'],
      title: 'Kūn - the Receptive',
      definition:
          'The Receptive brings about sublime success. Quiet perseverance brings good fortune.'),
  Hexagram(
      hexNo: '3',
      pattern: ['yin', 'yang', 'yin', 'yin', 'yin', 'yang'],
      title: 'Zhūn - the Difficulty at the beginning',
      definition:
          'Difficulty at the Beginning works supreme success, furthering through perseverance.'),
  Hexagram(
      hexNo: '4',
      pattern: ['yang', 'yin', 'yin', 'yin', 'yang', 'yin'],
      title: 'Mêng - the Youthful Folly',
      definition:
          'Youthful Folly has success. It is not I who seek the young fool; The young fool seeks me.'),
  Hexagram(
      hexNo: '5',
      pattern: ['yin', 'yang', 'yin', 'yang', 'yang', 'yang'],
      title: 'Hsu - the Waiting (Nourishment)',
      definition:
          'Waiting. If you are sincere, you have light and success. Perseverance brings good fortune. It furthers one to cross the great water.'),
  Hexagram(
      hexNo: '6',
      pattern: ['yang', 'yang', 'yang', 'yin', 'yang', 'yin'],
      title: 'Sung - the Conflict',
      definition:
          'Conflict. You are sincere and are being obstructed. A cautious halt halfway brings good fortune.'),
  Hexagram(
      hexNo: '7',
      pattern: ['yin', 'yin', 'yin', 'yin', 'yang', 'yin'],
      title: 'Shih - the Army',
      definition:
          'Conflict. The army needs perseverance and a strong man. Good fortune without blame.'),
  Hexagram(
      hexNo: '8',
      pattern: ['yin', 'yang', 'yin', 'yin', 'yin', 'yin'],
      title: 'Pi - the Holding Together (Union)',
      definition:
          'Holding Together brings good fortune. Those who are uncertain gradually join.'),
  Hexagram(
      hexNo: '9',
      pattern: ['yang', 'yang', 'yin', 'yang', 'yang', 'yang'],
      title: 'Hsiao Ch\'u - the Taming Power of the Small',
      definition:
          'The Taming Power of the Small has success. Dense clouds, no rain from our western region.'),
  Hexagram(
      hexNo: '10',
      pattern: ['yang', 'yang', 'yang', 'yin', 'yang', 'yang'],
      title: 'Lu - the Treading (Conduct)',
      definition:
          'Treading. Treading upon the tail of the tiger. It does not bite the man. Success.'),
  Hexagram(
      hexNo: '11',
      pattern: ['yin', 'yin', 'yin', 'yang', 'yang', 'yang'],
      title: 'T\'ai - the Peace',
      definition:
          'Peace. The small departs, the great approaches. Good fortune. Success.'),
  Hexagram(
      hexNo: '12',
      pattern: ['yang', 'yang', 'yang', 'yin', 'yin', 'yin'],
      title: 'P\'i - the Standstill (Stagnation)',
      definition:
          'Standstill. Evil people do not further the perseverance of the superior man. The great departs; the small approaches.'),
  Hexagram(
      hexNo: '13',
      pattern: ['yang', 'yang', 'yang', 'yang', 'yin', 'yang'],
      title: 'T\'ung Jên - the Fellowship with Men',
      definition:
          'Fellowship with Men in the open. Success. It furthers one to cross the great water. The perseverance of the superior man furthers.'),
  Hexagram(
      hexNo: '14',
      pattern: ['yang', 'yin', 'yang', 'yang', 'yang', 'yang'],
      title: 'Ta Yu - the Possession in Great Measure',
      definition: 'Possession in Great Measure. Supreme success.'),
  Hexagram(
      hexNo: '15',
      pattern: ['yin', 'yin', 'yin', 'yang', 'yin', 'yin'],
      title: 'Ch\'ien - the Modesty',
      definition:
          'Modesty creates success. The superior man carries things through.'),
  Hexagram(
      hexNo: '16',
      pattern: ['yin', 'yin', 'yang', 'yin', 'yin', 'yin'],
      title: 'Yu - the Enthusiasm',
      definition:
          'Enthusiasm. It furthers one to install helpers and to set armies marching.'),
  Hexagram(
      hexNo: '17',
      pattern: ['yin', 'yang', 'yang', 'yin', 'yin', 'yang'],
      title: 'Sui - the Following',
      definition:
          'Following has supreme success. Perseverance furthers. No blame.'),
  Hexagram(
      hexNo: '18',
      pattern: ['yang', 'yin', 'yin', 'yang', 'yin', 'yin'],
      title: 'Ku - the Work on What Has Been Spoiled (Decay)',
      definition:
          'Work on What Has Been Spoiled has supreme success. It furthers one to cross the great water. Before the starting point, three days. After the starting point, three days.'),
  Hexagram(
      hexNo: '19',
      pattern: ['yin', 'yin', 'yin', 'yin', 'yang', 'yang'],
      title: 'Lin - the Approach',
      definition:
          'Approach has supreme success. Perseverance furthers. When the eight month comes, there will be misfortune.'),
  Hexagram(
      hexNo: '20',
      pattern: ['yang', 'yang', 'yin', 'yin', 'yin', 'yin'],
      title: 'Kuan - the Contemplation (View)',
      definition:
          'Contemplation. The ablution has been made, but not yet the offering. Full of trust they look up to him.'),
  Hexagram(
      hexNo: '21',
      pattern: ['yang', 'yin', 'yang', 'yin', 'yin', 'yang'],
      title: 'Shih Ho - the Biting Through',
      definition:
          'Biting Through has success. It is favorable to let justice be administered.'),
  Hexagram(
      hexNo: '22',
      pattern: ['yang', 'yin', 'yin', 'yang', 'yin', 'yang'],
      title: 'Pi - the Grace',
      definition:
          'Grace has success. In small matters it is favorable to undertake something.'),
  Hexagram(
      hexNo: '23',
      pattern: ['yang', 'yin', 'yin', 'yin', 'yin', 'yin'],
      title: 'Po - the Splitting Apart',
      definition: 'Splitting Apart. It does not further one to go anywhere.'),
  Hexagram(
      hexNo: '24',
      pattern: ['yin', 'yin', 'yin', 'yin', 'yin', 'yang'],
      title: 'Fu - the Return (The Turning Point)',
      definition:
          'Return. Success. Going out and coming in without error. Friends come without blame. To and Fro goes the way. On the seventh day comes return. It furthers one to have somewhere to go.'),
  Hexagram(
      hexNo: '25',
      pattern: ['yang', 'yang', 'yang', 'yin', 'yin', 'yang'],
      title: 'Wu Wang - the Innocence (The Unexpected)',
      definition:
          'Innocence. Supreme success. Perseverance furthers. If someone is not as he should be, he has misfortune, and it does not further him to undertake something.'),
  Hexagram(
      hexNo: '26',
      pattern: ['yang', 'yin', 'yin', 'yang', 'yang', 'yang'],
      title: 'Ta Ch\'u - the Taming Power of the Great',
      definition:
          'The Taming Power of the Great. Perseverance furthers. Not eating at home brings good fortune. It furthers one to cross the great water.'),
  Hexagram(
      hexNo: '27',
      pattern: ['yang', 'yin', 'yin', 'yin', 'yin', 'yang'],
      title: 'I - the Corners of the Mouth (Providing Nourishment)',
      definition:
          'The Corners of the Mouth. Perseverance brings good fortune. Pay heed to the providing of nourishment and to what a man seeks to fill his own mouth with.'),
  Hexagram(
      hexNo: '28',
      pattern: ['yin', 'yang', 'yang', 'yang', 'yang', 'yin'],
      title: 'Ta Kuo - the Preponderance of the Great',
      definition:
          'Preponderance of the Great. The ridgepole sags to the breaking point. It furthers one to have somewhere to go. Success.'),
  Hexagram(
      hexNo: '29',
      pattern: ['yin', 'yang', 'yin', 'yin', 'yang', 'yin'],
      title: 'K\'an - the Abysmal (Water)',
      definition:
          'The Abysmal repeated. If you are sincere, you have success in your heart, and whatever you do succeeds.'),
  Hexagram(
      hexNo: '30',
      pattern: ['yang', 'yin', 'yang', 'yang', 'yin', 'yang'],
      title: 'Li - the Clinging, Fire',
      definition:
          'The Clinging. Perseverance furthers. It brings success. Care of the cow brings good fortune.'),
  Hexagram(
      hexNo: '31',
      pattern: ['yin', 'yang', 'yang', 'yang', 'yin', 'yin'],
      title: 'Hsien - the Influence (Wooing)',
      definition:
          'Influence. Success. Perseverance furthers. To take a maiden to wife brings good fortune.'),
  Hexagram(
      hexNo: '32',
      pattern: ['yin', 'yin', 'yang', 'yang', 'yang', 'yin'],
      title: 'Hêng - the Duration',
      definition:
          'Duration. Success. No blame. Perseverance furthers. It furthers one to have somewhere to go.'),
  Hexagram(
      hexNo: '33',
      pattern: ['yang', 'yang', 'yang', 'yang', 'yin', 'yin'],
      title: 'Tun - the Retreat',
      definition: 'Retreat. Success. In what is small, perseverance furthers.'),
  Hexagram(
      hexNo: '34',
      pattern: ['yin', 'yin', 'yang', 'yang', 'yang', 'yang'],
      title: 'Ta Chuang - the Power of the Great',
      definition: 'The Power of the Great. Perseverance furthers.'),
  Hexagram(
      hexNo: '35',
      pattern: ['yang', 'yin', 'yang', 'yin', 'yin', 'yin'],
      title: 'Chin - the Progress',
      definition:
          'Progress. The powerful prince is honored with horses in large numbers. In a single day he is granted audience three times.'),
  Hexagram(
      hexNo: '36',
      pattern: ['yin', 'yin', 'yin', 'yang', 'yin', 'yang'],
      title: 'Ming I - the Darkening of the Light',
      definition:
          'Darkening of the Light. In adversity it furthers one to be persevering.'),
  Hexagram(
      hexNo: '37',
      pattern: ['yang', 'yang', 'yin', 'yang', 'yin', 'yang'],
      title: 'Chia Jên - the Family (The Clan)',
      definition: 'The Family. The perseverance of the woman furthers.'),
  Hexagram(
      hexNo: '38',
      pattern: ['yang', 'yin', 'yang', 'yin', 'yang', 'yang'],
      title: 'K\'uei - the Opposition',
      definition: 'Opposition. In small matters, good fortune.'),
  Hexagram(
      hexNo: '39',
      pattern: ['yin', 'yang', 'yin', 'yang', 'yin', 'yin'],
      title: 'Chien - the Obstruction',
      definition:
          'Obstruction. The southwest furthers.  If you are sincere, you have success in your heart, and whatever you do succeeds.'),
  Hexagram(
      hexNo: '40',
      pattern: ['yin', 'yin', 'yang', 'yin', 'yang', 'yin'],
      title: 'Hsieh - the Deliverance',
      definition:
          'Deliverance. The southwest furthers. If there is no longer anything where one has to go, return brings good fortune. If there is still something where one has to go, hastening brings good fortune.'),
  Hexagram(
      hexNo: '41',
      pattern: ['yang', 'yin', 'yin', 'yin', 'yang', 'yang'],
      title: 'Sun - the Decrease',
      definition:
          'Decrease combined with sincerity brings about supreme good fortune without blame. One may be persevering in this. It furthers one to undertake something.'),
  Hexagram(
      hexNo: '42',
      pattern: ['yang', 'yang', 'yin', 'yin', 'yin', 'yang'],
      title: 'I - the Increase',
      definition:
          'Increase. It furthers one to undertake something. It furthers one to cross the great water.'),
  Hexagram(
      hexNo: '43',
      pattern: ['yin', 'yang', 'yang', 'yang', 'yang', 'yang'],
      title: 'Kuai - the Break-through (Resoluteness)',
      definition:
          'Break-through. One must resolutely make the matter known at the court of the king. It must be announced truthfully. Danger. It is necessary to notify one\'s own city. It does not further to resort to arms. It furthers one to undertake something.'),
  Hexagram(
      hexNo: '44',
      pattern: ['yang', 'yang', 'yang', 'yang', 'yang', 'yin'],
      title: 'Kou - the Coming to Meet',
      definition:
          'Coming to Meet. The maiden is powerful. One should not marry such a maiden.'),
  Hexagram(
      hexNo: '45',
      pattern: ['yin', 'yang', 'yang', 'yin', 'yin', 'yin'],
      title: 'Ts\'ui - the Gathering Together (Massing)',
      definition:
          'Gathering Together. Success. The king approaches his temple. It furthers one to see the great man. This brings success. Perseverance furthers. To bring great offerings creates good fortune. It furthers one to undertake something.'),
  Hexagram(
      hexNo: '46',
      pattern: ['yin', 'yin', 'yin', 'yang', 'yang', 'yin'],
      title: 'Shêng - the Pushing Upward',
      definition:
          'Pushing upward has supreme success. One must see the great man. Fear not. Departure toward the south brings good fortune.'),
  Hexagram(
      hexNo: '47',
      pattern: ['yin', 'yang', 'yang', 'yin', 'yang', 'yin'],
      title: 'K\'un - the Oppression (Exhaustion)',
      definition:
          'Oppression. Success. Perseverance. The great man brings about good fortune. No blame. When one has something to say, it is not believed.'),
  Hexagram(
      hexNo: '48',
      pattern: ['yin', 'yang', 'yin', 'yang', 'yang', 'yin'],
      title: 'Ching - the Well',
      definition:
          'The Well. The town may be changed, but the well cannot be changed. It neither decreases nor increases. They come and go and draw from the well. If one gets down almost to the water and the rope does not go all the way, or the jug breaks, it brings misfortune.'),
  Hexagram(
      hexNo: '49',
      pattern: ['yin', 'yang', 'yang', 'yang', 'yin', 'yang'],
      title: 'Ko - the Revolution (Molting)',
      definition:
          'Revolution. On your own day, you are believed. Supreme success. Furthering through perseverance. Remorse disappears.'),
  Hexagram(
      hexNo: '50',
      pattern: ['yang', 'yin', 'yang', 'yang', 'yang', 'yin'],
      title: 'Ting - the Cauldron',
      definition: 'The Cauldron. Supreme good fortune. Success.'),
  Hexagram(
      hexNo: '51',
      pattern: ['yin', 'yin', 'yang', 'yin', 'yin', 'yang'],
      title: 'Chên - the Arousing (Shock, Thunder)',
      definition:
          'Shock brings success. The shock terrifies for a hundred miles, and he does not let fall the sacrificial spoon and chalice.'),
  Hexagram(
      hexNo: '52',
      pattern: ['yang', 'yin', 'yin', 'yang', 'yin', 'yin'],
      title: 'Kên - the Keeping Still, Mountain',
      definition:
          'Keeping Still. Keeping his back still so that he no longer feels his body. He goes into the courtyard and does not see his people. No blame'),
  Hexagram(
      hexNo: '53',
      pattern: ['yang', 'yang', 'yin', 'yang', 'yin', 'yin'],
      title: 'Chien - the Development (Gradual Progress)',
      definition:
          'Development. The maiden is given in marriage. Good fortune. Perseverance furthers.'),
  Hexagram(
      hexNo: '54',
      pattern: ['yin', 'yin', 'yang', 'yin', 'yang', 'yang'],
      title: 'Kuei Mei - the Marrying Maiden',
      definition:
          'The Marrying Maiden. Undertakings bring misfortune. Nothing that would further.'),
  Hexagram(
      hexNo: '55',
      pattern: ['yin', 'yin', 'yang', 'yang', 'yin', 'yang'],
      title: 'Fêng - the Abundance (Fullness)',
      definition:
          'Abundance has success. The king attains abundance. Be not sad. Be like the sun at midday.'),
  Hexagram(
      hexNo: '56',
      pattern: ['yang', 'yin', 'yang', 'yang', 'yin', 'yin'],
      title: 'Lu - the Wanderer',
      definition:
          'The Wanderer. Success through smallness. Perseverance brings good fortune to the wanderer.'),
  Hexagram(
      hexNo: '57',
      pattern: ['yang', 'yang', 'yin', 'yang', 'yang', 'yin'],
      title: 'Sun - the Gentle (The Penetrating, Wind)',
      definition:
          'The Gentle. Success through what is small. It furthers one to have somewhere to go. It furthers one to see the great man.'),
  Hexagram(
      hexNo: '58',
      pattern: ['yin', 'yang', 'yang', 'yin', 'yang', 'yang'],
      title: 'Tui - the Joyous, Lake',
      definition: 'The Joyous. Success. Perseverance is favorable.'),
  Hexagram(
      hexNo: '59',
      pattern: ['yang', 'yang', 'yin', 'yin', 'yang', 'yin'],
      title: 'Huan - the Dispersion (Dissolution)',
      definition:
          'Dispersion. Success. The king approaches his temple. It furthers one to cross the great water. Perseverance furthers.'),
  Hexagram(
      hexNo: '60',
      pattern: ['yin', 'yang', 'yin', 'yin', 'yang', 'yang'],
      title: 'Chieh - the Limitation',
      definition:
          'Limitation. Success. Galling limitation must not be persevered in.'),
  Hexagram(
      hexNo: '61',
      pattern: ['yang', 'yang', 'yin', 'yin', 'yang', 'yang'],
      title: 'Chung Fu - the Inner Truth',
      definition:
          'Inner Truth. Pigs and fishes. Good fortune. It furthers one to cross the great water. Perseverance furthers.'),
  Hexagram(
      hexNo: '62',
      pattern: ['yin', 'yin', 'yang', 'yang', 'yin', 'yin'],
      title: 'Hsiao Kuo - the Preponderance of the Small',
      definition:
          'Preponderance of the Small. Success. Perseverance furthers. Small things may be done; great things should not be done. The flying bird brings the message: It is not well to strive upward, it is well to remain below. Great good fortune.'),
  Hexagram(
      hexNo: '63',
      pattern: ['yin', 'yang', 'yin', 'yang', 'yin', 'yang'],
      title: 'Chi Chi - the After Completion',
      definition:
          'After Completion. Success in small matters. Perseverance furthers. At the beginning good fortune, at the end disorder.'),
  Hexagram(
      hexNo: '64',
      pattern: ['yang', 'yin', 'yang', 'yin', 'yang', 'yin'],
      title: 'Wei Chi - the Before Completion',
      definition:
          'Before Completion. Success. But if the little fox, after nearly completing the crossing, gets his tail in the water, there is nothing that would further.'),
];

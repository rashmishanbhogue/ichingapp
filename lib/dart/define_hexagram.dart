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
      title: 'Ch\'ien- Heaven',
      definition:
          'Ch\'ien signifies creation, growth, and the start of new ventures. It advises persistence, hard work, and awareness of obstacles. Symbolic of the yang principle and associated with the sun, Ch\'ien also stands for the creative idea before realisation and the hidden potential within any situation. It urges you to stay true to oneself and the higher reality and recognise growth and success potential in every situation.'),
  Hexagram(
      hexNo: '2',
      pattern: ['yin', 'yin', 'yin', 'yin', 'yin', 'yin'],
      title: 'Kūn - the Receptive',
      definition:
          'The Receptive, in the I Ching, represents the Yin principle\'s passive power. It symbolizes nurturing, material essence, and femininity, emphasizing reception and care. This hexagram encourages humility, patience, and adaptability, highlighting the importance of support and acceptance without seeking recognition. It guides in gracefully embracing life\'s challenges and maintaining natural harmony.'),
  Hexagram(
      hexNo: '3',
      pattern: ['yin', 'yang', 'yin', 'yin', 'yin', 'yang'],
      title: 'Chūn - the Difficulty at the beginning',
      definition:
          'Difficulty at the Beginning, represented by K\'an (rain) and Chên (thunder) in the I Ching, signifies the challenges of new ventures. It highlights perseverance against early obstacles as key to success. This hexagram advises caution over haste, encouraging guidance seeking, patience, and obstacle awareness. Embracing these challenges as growth opportunities can yield rewarding outcomes and personal development.'),
  Hexagram(
      hexNo: '4',
      pattern: ['yang', 'yin', 'yin', 'yin', 'yang', 'yin'],
      title: 'Mêng - the Youthful Folly',
      definition:
          'Youthful Folly, addresses the challenges of learning, emphasising openness and humility. It describes the relationship between the wise Sage and the learner, highlighting the need for receptiveness and an open mind for wisdom. This hexagram stresses the naturalness of mistakes in learning and the importance of a humble approach to guidance, advocating for inner reflection and a genuine, ego-free journey towards understanding.'),
  Hexagram(
      hexNo: '5',
      pattern: ['yin', 'yang', 'yin', 'yang', 'yang', 'yang'],
      title: 'Hsu - the Waiting (Nourishment)',
      definition:
          'Waiting (Nourishment), in the I Ching, highlights patience and perseverance for achieving success. It advocates waiting for the right time, embracing patience, sincerity, and steadfastness amidst challenges. This hexagram encourages maintaining a positive attitude, free from doubt and impatience, and emphasises gradual progress, relying on inner strength and personal beliefs.'),
  Hexagram(
      hexNo: '6',
      pattern: ['yang', 'yang', 'yang', 'yin', 'yang', 'yin'],
      title: 'Sung - the Conflict',
      definition:
          'Conflict, in the I Ching, advises disengaging from conflicts rather than pondering their causes. It advocates resolving conflicts through open communication, compromise, and patience. This hexagram highlights avoiding dwelling on the \'why\' and trusting higher guidance for resolution. It identifies internal conflict as the root of disputes, emphasising emotional detachment and faith for resolution.'),
  Hexagram(
      hexNo: '7',
      pattern: ['yin', 'yin', 'yin', 'yin', 'yang', 'yin'],
      title: 'Shih - the Army',
      definition:
          'The Army, as expressed in the I Ching, emphasizes readiness for challenges guided by a prudent, compassionate leader. It calls for collective effort and unity towards shared goals, highlighting the need to conquer egocentric impulses and maintain inner autonomy and vigilance. This hexagram represents the mastery of the self, advocating for victory through detachment, stillness, and modest means.'),
  Hexagram(
      hexNo: '8',
      pattern: ['yin', 'yang', 'yin', 'yin', 'yin', 'yin'],
      title: 'Pi - the Holding Together (Union)',
      definition:
          'Holding Together, as presented in the I Ching, emphasizes the power of unity and alignment with inner principles for harmonious relationships. It underscores the importance of cooperation and a solid foundation for joint goals. This hexagram highlights inner independence and moral integrity as key to unity, advocating for perseverance, consistency, and supportive partnerships.'),
  Hexagram(
      hexNo: '9',
      pattern: ['yang', 'yang', 'yin', 'yang', 'yang', 'yang'],
      title: 'Hsiao Ch\'u - the Taming Power of the Small',
      definition:
          'The Taming Power of the Small, in the I Ching, symbolises a phase of restraint, advocating patience and step-by-step progress. It celebrates small, consistent actions for overcoming challenges and attaining success. The hexagram encourages personal growth and humility, advising a focus on inner development and peace, while discouraging attempts to control external events.'),
  Hexagram(
      hexNo: '10',
      pattern: ['yang', 'yang', 'yang', 'yin', 'yang', 'yang'],
      title: 'Lu - the Treading (Conduct)',
      definition:
          'Treading (Conduct), per the I Ching, stresses the need for earnest effort and unwavering commitment to personal growth. It advocates finding balance, staying true to inner morals, and cautious action for success. The hexagram advises sincerity and simplicity in confronting fate, emphasizing inner development and humility, while cautioning against aggression and urging respect for others\' impact.'),
  Hexagram(
      hexNo: '11',
      pattern: ['yin', 'yin', 'yin', 'yang', 'yang', 'yang'],
      title: 'T\'ai - the Peace',
      definition:
          'Peace in the I Ching symbolises harmony and stability, emphasising the balance of heavenly and earthly elements. It encourages humility and openness in tranquillity. T\'ai represents perfect equilibrium, urging continued learning and conscientiousness even during peaceful times. It calls for maintaining inner and outer balance, fostering growth and prosperity through a connection with inner wisdom.'),
  Hexagram(
      hexNo: '12',
      pattern: ['yang', 'yang', 'yang', 'yin', 'yin', 'yin'],
      title: 'P\'i - the Standstill (Stagnation)',
      definition:
          'Standstill (Stagnation) in the I Ching signals stagnation, emphasising patience and preparation over haste. It represents a transitional time with halted progress but continued internal growth. This phase calls for humility, receptivity, and waiting for the right moment. It highlights personal growth, value maintenance, and aligning with higher wisdom during challenges.'),
  Hexagram(
      hexNo: '13',
      pattern: ['yang', 'yang', 'yang', 'yang', 'yin', 'yang'],
      title: 'T\'ung Jên - the Fellowship with Men',
      definition:
          'Fellowship with Others in the I Ching underscores the importance of Sage principles in building genuine relationships. It represents companionship and collaboration, focusing on understanding and support for shared goals. This hexagram emphasises right relationships and cooperation, stressing transparency, fairness, and trust. It cautions against self-interest, encouraging perseverance and positivity for lasting unity.'),
  Hexagram(
      hexNo: '14',
      pattern: ['yang', 'yin', 'yang', 'yang', 'yang', 'yang'],
      title: 'Ta Yu - the Possession in Great Measure',
      definition:
          'Possession in Great Measure in the I Ching shows how balance, humility, and wisdom lead to abundance. It symbolises tranquility and wise management of abundance. The hexagram provides insights on achieving peace and prosperity through balance and generosity. It underscores maintaining inner harmony, embracing joy, and the idea that true success is defined by positive impact and selflessness.'),
  Hexagram(
      hexNo: '15',
      pattern: ['yin', 'yin', 'yin', 'yang', 'yin', 'yin'],
      title: 'Ch\'ien - the Modesty',
      definition:
          'Modesty in the I Ching emphasises responsibility and humility as key to success. It advocates staying grounded and the impact of modesty on character development. This hexagram highlights the essence of humility, advocating simplicity, truth, and Sage\'s wisdom. It underscores the importance of restraint, a modest attitude, focused dedication, and sincerity in achieving personal growth and success.'),
  Hexagram(
      hexNo: '16',
      pattern: ['yin', 'yin', 'yang', 'yin', 'yin', 'yin'],
      title: 'Yu - the Enthusiasm',
      definition:
          'Enthusiasm in the I Ching highlights how passion opens opportunities, advising on purposeful devotion and caution against overzealousness. This hexagram contrasts enthusiasm rooted in truth versus ego, showing how genuine enthusiasm fosters success. It cautions against arrogance, underscoring the need for humility, vigilance, and inner strength, and emphasises belief in one\'s path and the transformative impact of challenges.'),
  Hexagram(
      hexNo: '17',
      pattern: ['yin', 'yang', 'yang', 'yin', 'yin', 'yang'],
      title: 'Sui - the Following',
      definition:
          'Following in the I Ching underscores aligning with right guidance and wise leadership, highlighting inner truth. It discusses leadership\'s duality, noting benefits of wisdom and risks of misguided authority. This hexagram stresses discernment in choosing leaders and maintaining independence, emphasizing open dialogue, inner sacrifice, truthful relationships, and a commitment to sincerity and truth.'),
  Hexagram(
      hexNo: '18',
      pattern: ['yang', 'yin', 'yin', 'yang', 'yin', 'yin'],
      title: 'Ku - the Work on What Has Been Spoiled (Decay)',
      definition:
          'Work on What Has Been Spoiled (Decay) in the I Ching addresses overcoming decay through correcting negative patterns. It emphasises restoring balance, perseverance, and responsibility. The hexagram promotes self-reflection and a process of identifying, resolving, and preventing faults, highlighting the importance of breaking free from harmful habits and upholding moral standards for growth.'),
  Hexagram(
      hexNo: '19',
      pattern: ['yin', 'yin', 'yin', 'yin', 'yang', 'yang'],
      title: 'Lin - the Approach',
      definition:
          'Approach in the I Ching signifies growth and prosperity, highlighting opportunities ahead. It urges respect for natural progress and humility. This hexagram suggests a balanced approach to seizing new possibilities, emphasising caution, adherence to principles, and inner discipline. It teaches modesty, correctness, and compassion, inspiring individuals to be guiding figures.'),
  Hexagram(
      hexNo: '20',
      pattern: ['yang', 'yang', 'yin', 'yin', 'yin', 'yin'],
      title: 'Kuan - the Contemplation (View)',
      definition:
          'Contemplation in the I Ching advocates seeing situations from a detached perspective, focusing on larger truths. It emphasizes viewing the broader picture and trusting in eventual positive outcomes. This hexagram underscores inner truth seeking through introspection, aligning thoughts with universal flow, and harnessing the mind\'s power. It highlights the importance of patience, understanding, self-awareness, humility, and respectful leadership.'),
  Hexagram(
      hexNo: '21',
      pattern: ['yang', 'yin', 'yang', 'yin', 'yin', 'yang'],
      title: 'Shih Ho - the Biting Through',
      definition:
          'Biting Through in the I Ching emphasises overcoming obstacles to truth. It advises retreating into stillness for clarity and moderation. Hexagram 21 highlights decisive action to navigate challenges, encouraging boldness and persistence. It stresses the need for firm resolve and clear understanding, advising against rash actions and focusing on goals to overcome setbacks and barriers.'),
  Hexagram(
      hexNo: '22',
      pattern: ['yang', 'yin', 'yin', 'yang', 'yin', 'yang'],
      title: 'Pi - the Grace',
      definition:
          'Grace in the I Ching encourages appreciating simplicity and self-awareness, paired with external acceptance and gentleness. Hexagram 22 represents grace and good deeds for favour, advocating for uprightness and honour. It differentiates between false and true grace, promoting humility, simplicity, and letting go of ego. Focus on inner strength, avoid arrogance, and seek balance for success and fortune.'),
  Hexagram(
      hexNo: '23',
      pattern: ['yang', 'yin', 'yin', 'yin', 'yin', 'yin'],
      title: 'Po - the Splitting Apart',
      definition:
          'Splitting Apart in the I Ching advises trusting in non-action and observing courageously. It symbolizes separation and loss, urging the use of this time for self-strengthening and relationship building. This phase, like a challenging mountain, is not insurmountable. The hexagram encourages releasing attachments and remaining steadfast during change, recognizing that separation is part of growth, allowing new possibilities and resilience.'),
  Hexagram(
      hexNo: '24',
      pattern: ['yin', 'yin', 'yin', 'yin', 'yin', 'yang'],
      title: 'Fu - the Return (The Turning Point)',
      definition:
          'Return in the I Ching symbolises embracing change and returning to one\'s roots. It advocates letting go of hindrances and staying true to values. The hexagram represents finding stability in familiarities, encouraging acceptance, humility, and discipline. It is a time for self-reflection, rediscovery, and reconnection, highlighting cautious transformation and the importance of returning to one\'s true self.'),
  Hexagram(
      hexNo: '25',
      pattern: ['yang', 'yang', 'yang', 'yin', 'yin', 'yang'],
      title: 'Wu Wang - the Innocence (The Unexpected)',
      definition:
          'Innocence in the I Ching advocates an open-minded, pure-hearted approach to life, receptive to opportunities. It symbolizes innocence, purity, and simplicity, suggesting success through natural actions, not deceit. This hexagram, like wind over earth, emphasizes effortless movement, urging purity of heart and receptiveness to guidance, embracing a natural flow and a childlike openness.'),
  Hexagram(
      hexNo: '26',
      pattern: ['yang', 'yin', 'yin', 'yang', 'yang', 'yang'],
      title: 'Ta Ch\'u - the Taming Power of the Great',
      definition:
          'The Taming Power of the Great in the I Ching advises resilience and centeredness in adversity, harnessing great power for self and others\' benefit. It signifies taming significant power, advocating for inner balance and ethical use. The hexagram calls for self-purification, firmness, and virtuous living, offering guidance on overcoming negativity and trials for spiritual growth and enlightenment.'),
  Hexagram(
      hexNo: '27',
      pattern: ['yang', 'yin', 'yin', 'yin', 'yin', 'yang'],
      title: 'I - Providing Nourishment',
      definition:
          'Providing Nourishment in the I Ching focuses on self-care and fulfilment through balanced giving and receiving. It advises exploring mental sustenance and inner cleansing. The hexagram warns against envy, self-pity, and straying from one\'s path, emphasising the importance of personal values, proper self-nourishment, and the necessity of humility and self-discipline for personal growth and cosmic alignment.'),
  Hexagram(
      hexNo: '28',
      pattern: ['yin', 'yang', 'yang', 'yang', 'yang', 'yin'],
      title: 'Ta Kuo - the Preponderance of the Great',
      definition:
          'Preponderance of the Great in the I Ching emphasises navigating overwhelming influence with humility. It advises harnessing such influence responsibly, avoiding arrogance. The hexagram encourages turning pivotal moments into success through modesty, patience, and trust in higher forces. It highlights cautiousness and meticulous planning for foundations, the importance of humility in growth, and vigilance against recklessness.'),
  Hexagram(
      hexNo: '29',
      pattern: ['yin', 'yang', 'yin', 'yin', 'yang', 'yin'],
      title: 'K\'an - the Abysmal (Water)',
      definition:
          'Abysmal (Water) in the I Ching, Hexagram 29, teaches navigating life\'s mysteries with the flow. This symbol of water reflects danger and transformation. It guides through self-discovery and caution, highlighting patience, integrity, and humility. The hexagram encourages embracing life\'s currents, preparing for the unknown, and learning from life\'s depths for resilience and personal growth.'),
  Hexagram(
      hexNo: '30',
      pattern: ['yang', 'yin', 'yang', 'yang', 'yin', 'yang'],
      title: 'Li - The Clinging Fire, Brightness',
      definition:
          'The Clinging Fire in the I Ching symbolizes spiritual clarity and guidance, emphasizing detachment and caution against destructive tendencies. It advises releasing non-serving elements for balance, focusing on truth to dispel doubt. Success comes through perseverance and moral principles. The hexagram highlights deliberate action, balance, understanding, and acceptance amid change, and cautions against negative influences and excessive attachment.'),
  Hexagram(
      hexNo: '31',
      pattern: ['yin', 'yang', 'yang', 'yang', 'yin', 'yin'],
      title: 'Hsien - the Influence (Attraction)',
      definition:
          'Influence in the I Ching highlights a life-changing shift, challenging inner strength for those steadfast in principles. It underscores earning trust through actions, not words, and the quiet power of a strong personality. This hexagram advocates an open, receptive mind amid change and teaches positivity, patience, and inner wisdom as guiding forces.'),
  Hexagram(
      hexNo: '32',
      pattern: ['yin', 'yin', 'yang', 'yang', 'yang', 'yin'],
      title: 'Hêng - the Duration (Endurance)',
      definition:
          'Duration in the I Ching emphasises a persistent journey, resilience in adversity, and unwavering resolve. It symbolises enduring spirit and conviction, akin to the resilient horse, representing strength and grace. The hexagram underscores the essence of perseverance and steadfastness, advocating for enduring focus and adherence to values amid distractions, and teaching the importance of patience and character.'),
  Hexagram(
      hexNo: '33',
      pattern: ['yang', 'yang', 'yang', 'yang', 'yin', 'yin'],
      title: 'Tun - the Retreat',
      definition:
          'Retreat in the I Ching explores the wisdom of disengagement from life\'s demands. It emphasizes the necessity of retreat for personal growth and tranquillity. This hexagram teaches the importance of stepping back from societal pressures, maintaining inner balance, and fostering sincerity amidst chaos. Discover how strategic retreat can lead to good fortune and new opportunities.'),
  Hexagram(
      hexNo: '34',
      pattern: ['yin', 'yin', 'yang', 'yang', 'yang', 'yang'],
      title: 'Ta Chuang - the Power of the Great',
      definition:
          'The Power of the Great in I Ching reveals the essence of true power and greatness. This hexagram imparts wisdom on using power wisely and humbly, emphasizing the importance of harmony and recognition of good. Explore the principles of perseverance, humility, and the transformative power of forgiveness. Understand the consequences of excessive power and the value of correction and perseverance.'),
  Hexagram(
      hexNo: '35',
      pattern: ['yang', 'yin', 'yang', 'yin', 'yin', 'yin'],
      title: 'Chin - the Progress',
      definition:
          'Progress in the I Ching signifies the path of advancement, akin to the sun\'s ascent. It emphasises inner goodness and moral excellence as the foundation for growth. This hexagram guides towards balanced progress, harmonising Heaven and Earth. It encourages flexibility, adaptation, and humility while warning against ego indulgence during success. The key lies in enhancing personal virtue and pursuing higher good.'),
  Hexagram(
      hexNo: '36',
      pattern: ['yin', 'yin', 'yin', 'yang', 'yin', 'yang'],
      title: 'Ming I - the Darkening of the Light',
      definition:
          'Darkening of the Light in the I Ching signifies a loss of clarity during uncertain times. It advises caution, reflection, and reliance on one\'s inner light as a guiding beacon. This hexagram explores feelings of discontent and confusion, urging reconnection with inner guidance for navigating challenges with clarity and perseverance.'),
  Hexagram(
      hexNo: '37',
      pattern: ['yang', 'yang', 'yin', 'yang', 'yin', 'yang'],
      title: 'Chia Jên - the Family (The Clan)',
      definition:
          'The Family in the I Ching emphasises the power of superior individuals influencing their family through inner truth. Symbolising a cohesive family unit, it stresses harmony, boundaries, and standing up for beliefs. The guidance advocates humility, patience, and self-improvement to inspire positive change within the family.'),
  Hexagram(
      hexNo: '38',
      pattern: ['yang', 'yin', 'yang', 'yin', 'yang', 'yang'],
      title: 'K\'uei - the Opposition',
      definition:
          'Opposition, from the I Ching, highlights the complexities of truth and the frequent emergence of misunderstandings and conflicts. It advocates for reconciliation of differing viewpoints, balancing personal standpoints with the pursuit of harmony, and emphasises the importance of patience, open communication, and adaptability in overcoming opposition.'),
  Hexagram(
      hexNo: '39',
      pattern: ['yin', 'yang', 'yin', 'yang', 'yin', 'yin'],
      title: 'Chien - the Obstruction',
      definition:
          'Obstruction in the I Ching highlights the journey of overcoming challenges by changing perspectives and adopting a positive attitude. This hexagram focuses on navigating through physical, mental, and emotional obstructions, advocating determination, flexibility, and patience. It teaches that obstacles are not just barriers but opportunities for growth, learning, and finding new paths.'),
  Hexagram(
      hexNo: '40',
      pattern: ['yin', 'yin', 'yang', 'yin', 'yang', 'yin'],
      title: 'Hsieh - the Deliverance',
      definition:
          'Deliverance emphasizes liberation from struggles and the power of adaptability. It symbolizes breaking free from negativity and seizing new opportunities. The hexagram underscores learning from conflicts, forgiving, maintaining balance, and avoiding forced progress. It\'s a guide to navigating life\'s challenges with an open mind and readiness for transformation.'),
  Hexagram(
      hexNo: '41',
      pattern: ['yang', 'yin', 'yin', 'yin', 'yang', 'yang'],
      title: 'Sun - the Decrease',
      definition:
          'Decrease signifies a period of sacrifice, detachment, and focus on communal well-being, calling for the relinquishment of ego and desires. It emphasises humility, simplicity, and selflessness, advocating for releasing the unneeded to invite new possibilities and inner peace. Encourages recognising limitations, being resourceful, and flexible. It reminds us that letting go can lead to growth, understanding, and stronger connections.'),
  Hexagram(
      hexNo: '42',
      pattern: ['yang', 'yang', 'yin', 'yin', 'yin', 'yang'],
      title: 'I - the Increase',
      definition:
          'Increase emphasises trusting the universe in life\'s chaos, guiding desires towards inner peace. It symbolises a time of steady growth and development on solid foundations. This period is marked by improvement and potential, urging humility and conscientiousness. It encourages using good fortune for noble deeds, consistent perseverance, finding value in challenges, and prioritising service and self-improvement for lasting success.'),
  Hexagram(
      hexNo: '43',
      pattern: ['yin', 'yang', 'yang', 'yang', 'yang', 'yang'],
      title: 'Kuai - the Break-through (Resoluteness)',
      definition:
          'Breakthrough (Resoluteness) signifies major progress through determination within right limits, urging escape from negative cycles. It symbolises overcoming challenges with tenacity, represented by Water and Fire\'s interplay. The hexagram advises resoluteness, clarity in communication, and readiness to change old patterns. It focuses on decisive, yet cautious actions, encouraging new perspectives, boldness, and steady resolve in intricate situations.'),
  Hexagram(
      hexNo: '44',
      pattern: ['yang', 'yang', 'yang', 'yang', 'yang', 'yin'],
      title: 'Kou - the Coming to Meet',
      definition:
          'Coming to Meet stresses cautious navigation through power\'s temptations, focusing on restraint and principled actions amidst challenges. Illustrates the union of forces, advocating for mutual respect and understanding, and warns against dominance to preserve balance. It promotes harmony, respect in relationships, and warns against losing dignity in difficult circumstances, emphasising control over negative emotions, inner balance, and tolerance in adversity.'),
  Hexagram(
      hexNo: '45',
      pattern: ['yin', 'yang', 'yang', 'yin', 'yin', 'yin'],
      title: 'Ts\'ui - the Gathering Together (Massing)',
      definition:
          'Gathering Together underscores the importance of personal growth and introspection in guiding others, highlighting how unresolved doubts can impede progress. It represents unity, cooperation, and community under ethical leadership, encouraging an ethos of mutual support. Advises on balancing humility, authenticity, and self-improvement with community welfare, emphasizing ethical conduct, inner discipline, and the value of collective strength and principled leadership.'),
  Hexagram(
      hexNo: '46',
      pattern: ['yin', 'yin', 'yin', 'yang', 'yang', 'yin'],
      title: 'Shêng - the Pushing Upward',
      definition:
          'Pushing Upward encourages aligning with cosmic forces for achieving goals, embodying progress and growth like a plant seeking light. Calls for consistent effort, patience, and steadfastness. Emphasises patience, grounding, persistence, promoting self-improvement and natural growth. Advises rising above material distractions, embracing spiritual guidance, maintaining ethical alignment, focusing on inner growth, and seizing moments of humility and receptivity for success.'),
  Hexagram(
      hexNo: '47',
      pattern: ['yin', 'yang', 'yang', 'yin', 'yang', 'yin'],
      title: 'K\'un - the Oppression (Exhaustion)',
      definition:
          'Oppression (Exhaustion) acknowledges that adversity can evoke doubt and overwhelm, but it emphasises holding onto inner strength and faith. Symbolising enduring burdens, underscores the need for perseverance and constancy. Advises against allowing oppressive beliefs to hinder growth. Acceptance, calmness, patience in adversity are key. It suggests finding internal solutions, resisting impatience, staying open to new possibilities.'),
  Hexagram(
      hexNo: '48',
      pattern: ['yin', 'yang', 'yin', 'yang', 'yang', 'yin'],
      title: 'Ching - the Well',
      definition:
          'The Well promotes broadening horizons and embracing inherent goodness. It symbolises abundance, urging gratitude for resources. Embodies universal truth and spiritual nourishment, advocating purity and reliability. It advises staying free from personal motives, seeking help when necessary, and maintaining sincerity, simplicity, and serenity. Focus is on nurturing oneself and others with wisdom, trusting inner guidance, fostering self-development and compassion.'),
  Hexagram(
      hexNo: '49',
      pattern: ['yin', 'yang', 'yang', 'yang', 'yin', 'yang'],
      title: 'Ko - the Revolution (Molting)',
      definition:
          'Revolution underscores truth and honesty for change. It heralds significant shifts, promoting adaptability and steady direction during transition. This hexagram urges transforming attitudes, fostering inner independence, and trusting the unknown. It advises calm adaptability, a clear purpose, and steadfast values, emphasising patience, justice, and commitment for lasting transformation.'),
  Hexagram(
      hexNo: '50',
      pattern: ['yang', 'yin', 'yang', 'yang', 'yang', 'yin'],
      title: 'Ting - the Cauldron',
      definition:
          'The Cauldron promotes divine guidance, humility, and wisdom, inspiring others by setting aside ego. Symbolises nourishment, highlighting balance and harmony in home and community, focusing on others\' needs. Embodies sacrifice, spiritual growth, and divine nourishment, emphasizing purity of thought, ego surrender, and balancing self-care with nurturing. Advises humility, open-mindedness, staying true to values, being a source of guidance.'),
  Hexagram(
      hexNo: '51',
      pattern: ['yin', 'yin', 'yang', 'yin', 'yin', 'yang'],
      title: 'Chên - the Arousing (Shock, Thunder)',
      definition:
          'The Arousing (Shock) recommends facing disruptions neutrally, seeking higher truth. Thunder symbolizes sudden change, with positive and negative potential. This hexagram stresses openness and flexibility in handling change. During shocks, withdrawal into stillness and meditation is advised. It encourages growth through shocks, openness to learning, inner calm, accepting new perspectives, and finding clarity in stillness.'),
  Hexagram(
      hexNo: '52',
      pattern: ['yang', 'yin', 'yin', 'yang', 'yin', 'yin'],
      title: 'Kên - the Keeping Still, Mountain',
      definition:
          'Keeping Still emphasises inner calm via meditation, pursuing emotional equilibrium and composure. Symbolised by a mountain, it signifies stillness, stability, and inner peace as routes to the highest good. In trials, it suggests seeking inner peace, avoiding fear-driven decisions, nurturing clarity and creativity through detachment, self-reflection, resisting ego-driven impulses, embracing uncertainty, and maintaining serenity amidst external chaos.'),
  Hexagram(
      hexNo: '53',
      pattern: ['yang', 'yang', 'yin', 'yang', 'yin', 'yin'],
      title: 'Chien - the Development (Gradual Progress)',
      definition:
          'Gradual Progress highlights patience, persistence, and steadfastness for continuous advancement. It stresses consistent, persistent effort for lasting success, cautioning against impulsiveness. Advises steady, continuous striving over quick results, emphasizing adaptability to life\'s changes and commitment to principles during adversity. Advises patience in self-growth, sharing prosperity, seeing challenges as growth opportunities, adapting to circumstances, and persevering with trust.'),
  Hexagram(
      hexNo: '54',
      pattern: ['yin', 'yin', 'yang', 'yin', 'yang', 'yang'],
      title: 'Kuei Mei - the Marrying Maiden',
      definition:
          'The Marrying Maiden explores balanced relationships and desire management to avert misfortunes. Focused on matrimony and responsibilities, it features a young woman guided by experience. Symbolises ethical choices and relationships, emphasizing harmony between masculine and feminine energies, forming wise alliances, and understanding the power of surrender. Key lessons involve recognizing limited influence, practising patience, avoiding ego and self-indulgence.'),
  Hexagram(
      hexNo: '55',
      pattern: ['yin', 'yin', 'yang', 'yang', 'yin', 'yang'],
      title: 'Fêng - the Abundance (Fullness)',
      definition:
          'Abundance uncovers potential in challenges, urging inner truth for success. It explores fullness with benefits and perils, emphasizing gratitude, humility, and wise resource use. Teaches navigating abundance cycles, staying humble in prosperity, and fostering diverse abundance. Key lessons involve respecting influence cycles, embracing trust and humility, recognizing ego\'s impact, and valuing humility and generosity to create a positive, abundant environment.'),
  Hexagram(
      hexNo: '56',
      pattern: ['yang', 'yin', 'yang', 'yang', 'yin', 'yin'],
      title: 'Lu - the Wanderer',
      definition:
          'The Wanderer explores life\'s mysteries with the Sage\'s guidance, balancing self-reliance and modesty. It delves into physical and mental wandering during transitions, emphasising inner strength and authenticity. The hexagram advises staying connected to higher powers and universal justice. Key insights involve mindful time use, modesty, generosity, ego transcendence, aligned desires, detachment, and vigilance on the transformative journey.'),
  Hexagram(
      hexNo: '57',
      pattern: ['yang', 'yang', 'yin', 'yang', 'yang', 'yin'],
      title: 'Sun - the Gentle (The Penetrating, Wind)',
      definition:
          'The Gentle wields gentle persuasion, blending firm belief and compassion to influence positively. Symbolising the wisdom of a gentle wind, it achieves goals through persistence and adaptability. Unveils the power of humility and the right inner attitude for profound insights, embodying scholarly virtues. Key lessons involve the warrior\'s perseverance, facing internal foes like negative thoughts, embracing modesty for effortless success.'),
  Hexagram(
      hexNo: '58',
      pattern: ['yin', 'yang', 'yang', 'yin', 'yang', 'yang'],
      title: 'Tui - the Joyous, Lake',
      definition:
          'The Joyous, Lake finds authentic joy in inner strength and harmony with life. It promotes success through inner peace, symbolised by a serene lake, and advises finding joy within, being adaptable, and valuing balance, good relationships, and life\'s pleasures. Key insights: inner harmony, authenticity, and humility for genuine joy.'),
  Hexagram(
      hexNo: '59',
      pattern: ['yang', 'yang', 'yin', 'yin', 'yang', 'yin'],
      title: 'Huan - the Dispersion (Dissolution)',
      definition:
          'Dispersion advocates embracing gentleness, compassion, and change, breaking inner barriers. It guides release and shedding the unhelpful, fostering inner growth by dissolving rigid thinking. Addressing misunderstandings, cultivating patience, acting with integrity, and striving for universal harmony are key. Transformation requires adaptability, open-mindedness, and faith in the change process.'),
  Hexagram(
      hexNo: '60',
      pattern: ['yin', 'yang', 'yin', 'yin', 'yang', 'yang'],
      title: 'Chieh - the Limitation',
      definition:
          'Limitation stresses setting boundaries for growth, balancing stability and caution. It guides in reasonable limits, emphasising humility, cooperation, and balance. Key lessons: respect boundaries, timing, and awareness; avoid self-importance; work within limitations; guide others through self-limitation; recognise the need for limits in crises for protection and kindness.'),
  Hexagram(
      hexNo: '61',
      pattern: ['yang', 'yang', 'yin', 'yin', 'yang', 'yang'],
      title: 'Chung Fu - the Inner Truth',
      definition:
          'Inner Truth tackles challenges with elusive solutions, urging honesty and mindfulness. It unravels complexities by emphasizing understanding and abandoning prejudices. Key lessons: strengthen core values, project true self, maintain inner balance amid distractions, promote unity through truth, and encourage self-development with understanding and trust. Focus on nurturing thoughts, values, and principles to inspire honesty and integrity.'),
  Hexagram(
      hexNo: '62',
      pattern: ['yin', 'yin', 'yang', 'yang', 'yin', 'yin'],
      title: 'Hsiao Kuo - the Preponderance of the Small',
      definition:
          'Preponderance of the Small guides graceful navigation through uncertainty, emphasising patience, humility, and trust. It advocates steady, incremental progress for transformation, highlighting the value of non-action and openness in turbulent times. Key lessons include patience, cautious decision-making, avoiding impulsivity, fostering unity, and overcoming pride with humility. Underscores adaptability and ethics as essential in life\'s ever-changing landscape.'),
  Hexagram(
      hexNo: '63',
      pattern: ['yin', 'yang', 'yin', 'yang', 'yin', 'yang'],
      title: 'Chi Chi - the After Completion',
      definition:
          'After Completion emphasises mindfulness and balance in success, symbolising tranquillity while cautioning against complacency. It stresses staying principled and avoiding ego resurgence, focusing on self-control and humility. Key lessons include letting go of outcome attachments, resisting complacency, upholding emotional independence, and maintaining modesty and correctness in achievements.'),
  Hexagram(
      hexNo: '64',
      pattern: ['yang', 'yin', 'yang', 'yin', 'yang', 'yin'],
      title: 'Wei Chi - the Before Completion',
      definition:
          'Before Completion represents a journey from confusion to clarity, emphasising patience and focused understanding. It symbolises an ongoing journey, advocating for caution and preparedness. The hexagram encourages embracing change with humility and inner peace, emphasising avoiding ego, maintaining discipline, and upholding values in the face of challenges and progress.'),
];

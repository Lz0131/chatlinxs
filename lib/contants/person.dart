const persons = [
  {
    'email': 'anna.miller@example.com',
    'gender': 'female',
    'phone_number': '0757-774-062',
    'birthdate': 1378090803,
    'location': {
      'street': '3577 chester road',
      'city': 'ely',
      'state': 'berkshire',
      'postcode': 'W9 1BP'
    },
    'username': 'orangemouse723',
    'password': 'siobhan',
    'first_name': 'anna',
    'last_name': 'miller',
    'title': 'miss',
    'picture':
        'https://raw.githubusercontent.com/pixelastic/fakeusers/master/pictures/women/84.jpg'
  },
  {
    'email': 'mustafa.hamzaoğlu@example.com',
    'gender': 'male',
    'phone_number': '(645)-838-2501',
    'birthdate': 364873588,
    'location': {
      'street': '8151 necatibey cd',
      'city': 'muş',
      'state': 'afyonkarahisar',
      'postcode': 59197
    },
    'username': 'whitegoose675',
    'password': 'clancy',
    'first_name': 'mustafa',
    'last_name': 'hamzaoğlu',
    'title': 'mr',
    'picture':
        'https://raw.githubusercontent.com/pixelastic/fakeusers/master/pictures/men/54.jpg'
  },
  {
    'email': 'ستایش.یاسمی@example.com',
    'gender': 'female',
    'phone_number': '0930-256-0917',
    'birthdate': 1394744991,
    'location': {
      'street': '1897 هویزه',
      'city': 'بجنورد',
      'state': 'لرستان',
      'postcode': 21321
    },
    'username': 'silverostrich141',
    'password': 'kill',
    'first_name': 'ستایش',
    'last_name': 'یاسمی',
    'title': 'miss',
    'picture':
        'https://raw.githubusercontent.com/pixelastic/fakeusers/master/pictures/women/10.jpg'
  },
  {
    'email': 'james.warren@example.com',
    'gender': 'male',
    'phone_number': '0789-598-522',
    'birthdate': 524471247,
    'location': {
      'street': '4605 st. john’s road',
      'city': 'dundee',
      'state': 'south yorkshire',
      'postcode': 'LL99 9QJ'
    },
    'username': 'ticklishbird503',
    'password': 'coconut',
    'first_name': 'james',
    'last_name': 'warren',
    'title': 'mr',
    'picture':
        'https://raw.githubusercontent.com/pixelastic/fakeusers/master/pictures/men/43.jpg'
  },
  {
    'email': 'nívia.cardoso@example.com',
    'gender': 'female',
    'phone_number': '(14) 9768-6550',
    'birthdate': 69649846,
    'location': {
      'street': '7199 rua piauí ',
      'city': 'gravataí',
      'state': 'mato grosso',
      'postcode': 57670
    },
    'username': 'organicleopard979',
    'password': 'gregor',
    'first_name': 'nívia',
    'last_name': 'cardoso',
    'title': 'ms',
    'picture':
        'https://raw.githubusercontent.com/pixelastic/fakeusers/master/pictures/women/54.jpg'
  },
  {
    'email': 'ariana.thompson@example.com',
    'gender': 'female',
    'phone_number': '(403)-255-8521',
    'birthdate': 508616445,
    'location': {
      'street': '2962 esmonde road',
      'city': 'christchurch',
      'state': 'northland',
      'postcode': 90291
    },
    'username': 'brownostrich745',
    'password': 'hungry',
    'first_name': 'ariana',
    'last_name': 'thompson',
    'title': 'ms',
    'picture':
        'https://raw.githubusercontent.com/pixelastic/fakeusers/master/pictures/women/52.jpg'
  },
  {
    'email': 'valtteri.pulkkinen@example.com',
    'gender': 'male',
    'phone_number': '041-829-79-61',
    'birthdate': 9608479,
    'location': {
      'street': '6489 hermiankatu',
      'city': 'parikkala',
      'state': 'northern savonia',
      'postcode': 77761
    },
    'username': 'brownfish540',
    'password': 'peepee',
    'first_name': 'valtteri',
    'last_name': 'pulkkinen',
    'title': 'mr',
    'picture':
        'https://raw.githubusercontent.com/pixelastic/fakeusers/master/pictures/men/49.jpg'
  },
  {
    'email': 'aloïs.moulin@example.com',
    'gender': 'male',
    'phone_number': '(334)-138-2260',
    'birthdate': 787209800,
    'location': {
      'street': '6574 rue cyrus-hugues',
      'city': 'berolle',
      'state': 'genève',
      'postcode': 8691
    },
    'username': 'silvergorilla196',
    'password': 'silver',
    'first_name': 'aloïs',
    'last_name': 'moulin',
    'title': 'monsieur',
    'picture':
        'https://raw.githubusercontent.com/pixelastic/fakeusers/master/pictures/men/28.jpg'
  },
  {
    'email': 'noélie.roux@example.com',
    'gender': 'female',
    'phone_number': '06-68-19-42-68',
    'birthdate': 669873438,
    'location': {
      'street': '6224 rue barrème',
      'city': 'paris',
      'state': 'ain',
      'postcode': 89564
    },
    'username': 'blueelephant373',
    'password': '282828',
    'first_name': 'noélie',
    'last_name': 'roux',
    'title': 'mrs',
    'picture':
        'https://raw.githubusercontent.com/pixelastic/fakeusers/master/pictures/women/51.jpg'
  },
  {
    'email': 'نيما.جعفری@example.com',
    'gender': 'male',
    'phone_number': '0912-030-9784',
    'birthdate': 532295794,
    'location': {
      'street': '7577 میدان 7 تیر',
      'city': 'همدان',
      'state': 'اردبیل',
      'postcode': 57685
    },
    'username': 'beautifullion345',
    'password': 'insert',
    'first_name': 'نيما',
    'last_name': 'جعفری',
    'title': 'mr',
    'picture':
        'https://raw.githubusercontent.com/pixelastic/fakeusers/master/pictures/men/42.jpg'
  }
];

const sentences = [
  "For some unfathomable reason, the response team didn't consider a lack of milk for my cereal as a proper emergency.",
  "Don't step on the broken glass.",
  "When she didn’t like a guy who was trying to pick her up, she started using sign language.",
  "Courage and stupidity were all he had.",
  "I think I will buy the red car, or I will lease the blue one.",
  "Her scream silenced the rowdy teenagers.",
  "The tart lemonade quenched her thirst, but not her longing.",
  "She finally understood that grief was her love with no place for it to go.",
  "I'd always thought lightning was something only I could see.",
  "All she wanted was the answer, but she had no idea how much she would hate it.",
];

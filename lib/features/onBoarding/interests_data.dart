class InterestCategory {
  final String category;
  final List<String> subcategories;

  InterestCategory({required this.category, required this.subcategories});

  String get formattedCategory {
    if (category.contains("\n")) {
      return category.replaceAll("\n", " ");
    }
    return category;
  }
}

final List<InterestCategory> interestCategories = [
  InterestCategory(
    category: 'Fashion & beauty',
    subcategories: [
      'Makeup',
      'Skincare',
      'Hair',
      'Nail Art',
      'Fragrance',
      'Jewelry',
      'Fashion Shows',
      'Style Tips',
      'Wardrobe Essentials',
      'Beauty Influencers'
    ],
  ),
  InterestCategory(
    category: 'Outdoors',
    subcategories: [
      'Hiking',
      'Camping',
      'Fishing',
      'Bird Watching',
      'Mountain Biking',
      'Rock Climbing',
      'Kayaking',
      'Nature Photography',
      'Trail Running',
      'Wildlife Conservation'
    ],
  ),
  InterestCategory(
    category: 'Arts & culture',
    subcategories: [
      'Painting',
      'Sculpture',
      'Literature',
      'Photography',
      'Theater',
      'Opera',
      'Ballet',
      'Art History',
      'Cultural Festivals',
      'Museum Visits'
    ],
  ),
  InterestCategory(
    category: 'Animation\n& comics',
    subcategories: [
      'Anime',
      'Manga',
      'Comics',
      'Cartoons',
      'Graphic Novels',
      'Superheroes',
      'Animation Studios',
      'Comic Conventions',
      'Webtoons',
      'Fan Art'
    ],
  ),
  InterestCategory(
    category: 'Business\n& finance',
    subcategories: [
      'Investing',
      'Stock Market',
      'Economics',
      'Entrepreneurship',
      'Personal Finance',
      'Real Estate',
      'Cryptocurrency',
      'Market Trends',
      'Business News',
      'Startup Culture'
    ],
  ),
  InterestCategory(
    category: 'Food',
    subcategories: [
      'Cooking',
      'Baking',
      'Dining Out',
      'Wine Tasting',
      'Street Food',
      'Gourmet Cuisine',
      'Recipe Sharing',
      'Food Blogging',
      'Vegan Cooking',
      'Food Photography'
    ],
  ),
  InterestCategory(
    category: 'Travel',
    subcategories: [
      'Adventure Travel',
      'Beaches',
      'Cultural Travel',
      'Road Trips',
      'Cruises',
      'Travel Tips',
      'Backpacking',
      'Luxury Travel',
      'Travel Blogging',
      'Eco Travel'
    ],
  ),
  InterestCategory(
    category: 'Music',
    subcategories: [
      'Rap',
      'R&B soul',
      'Grammy Awards',
      'Pop',
      'K=pop',
      'Music industry',
      'Hip hop',
      'Reggae'
    ],
  ),
  InterestCategory(
    category: 'Entertainment',
    subcategories: [
      'Anime',
      'Movies & TV',
      'Harry Potter',
      'Marvel Universe',
      'K=drama',
      'Grammy Award',
      'Parraside',
      'Reggae',
    ],
  ),
  InterestCategory(
    category: 'Animals',
    subcategories: [
      "Pets",
      "Wildlife",
      "Animal Care",
      "Zoos",
      "Aquariums",
      "Animal Rescue",
      "Pet Training",
      "Pet Nutrition",
      "Exotic Animals",
      "Animal Photography"
    ],
  ),
  InterestCategory(
    category: 'Daily Life',
    subcategories: [
      "Vlogging",
      "Lifestyle Tips",
      "Personal Stories",
      "Daily Routines",
      "Home Organization",
      "Minimalism",
      "Self-Improvement",
      "Time Management",
      "Productivity Tips",
      "Life Coaching",
    ],
  ),
  InterestCategory(
    category: 'Arts & Crafts',
    subcategories: [
      "Knitting",
      "Scrapbooking",
      "Jewelry Making",
      "Painting",
      "Ceramics",
      "Embroidery",
      "Quilting",
      "Paper Crafts",
      "Woodworking",
      "Calligraphy"
    ],
  ),
];

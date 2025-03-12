class Restaurant {
  final String title;
  final String description;
  final String date;

  Restaurant({
    required this.title,
    required this.description,
    required this.date,
  });
}

List<Restaurant> _restaurants = [
  Restaurant(
    title: "Volta e Maia",
    description:
        "An elegant restaurant offering refined dishes inspired by Portuguese cuisine. Features a diverse menu with fresh seafood and local wines.",
    date: "Open daily, 12:00 PM - 11:00 PM",
  ),
  Restaurant(
    title: "Puro",
    description:
        "A modern restaurant with a minimalist concept, specializing in healthy and fresh dishes, including vegan and vegetarian options.",
    date: "Open daily, 8:00 AM - 10:00 PM",
  ),
  Restaurant(
    title: "Trinta e Dois",
    description:
        "A restaurant with a relaxing atmosphere, perfect for romantic dinners or business meetings. Serves traditional dishes with a modern twist.",
    date: "Open daily, 1:00 PM - 12:00 AM",
  ),
  Restaurant(
    title: "Zagallo Steakhouse",
    description:
        "A paradise for meat lovers, offering premium-quality steaks, grilled to perfection. Known for its cozy ambiance and excellent service.",
    date: "Open daily, 6:00 PM - 11:30 PM",
  ),
  Restaurant(
    title: "Chez Bernardo",
    description:
        "A charming French-Portuguese fusion restaurant, offering exquisite flavors and a sophisticated dining experience.",
    date: "Open daily, 7:00 PM - 12:00 AM",
  ),
  Restaurant(
    title: "Joia",
    description:
        "A seafood restaurant famous for its fresh fish, shellfish, and delicious traditional Portuguese dishes with a touch of elegance.",
    date: "Open daily, 12:30 PM - 11:00 PM",
  ),
  Restaurant(
    title: "Marujo",
    description:
        "A cozy, nautical-themed restaurant specializing in seafood and Mediterranean dishes, offering a warm and welcoming atmosphere.",
    date: "Open daily, 12:00 PM - 10:30 PM",
  ),
];

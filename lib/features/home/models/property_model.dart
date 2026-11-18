class PropertyModel {
  final String id;
  final String title;
  final String type;
  final String purpose;
  final double price;
  final String formattedPrice;
  final String location;
  final int beds;
  final int baths;
  final int sqft;
  final String description;
  final String image;
  final List<String> images;
  final List<String> features;
  bool isFavorite;

  PropertyModel({
    required this.id,
    required this.title,
    required this.type,
    required this.purpose,
    required this.price,
    required this.formattedPrice,
    required this.location,
    required this.beds,
    required this.baths,
    required this.sqft,
    required this.description,
    required this.image,
    this.images = const [],
    this.features = const [],
    this.isFavorite = false,
  });

  PropertyModel copyWith({
    bool? isFavorite,
  }) {
    return PropertyModel(
      id: id,
      title: title,
      type: type,
      purpose: purpose,
      price: price,
      formattedPrice: formattedPrice,
      location: location,
      beds: beds,
      baths: baths,
      sqft: sqft,
      description: description,
      image: image,
      images: images,
      features: features,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}

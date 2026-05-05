import 'package:equatable/equatable.dart';

class ProviderEntity extends Equatable {
  final String id;
  final String name;
  final String categoryId; // Reference to the service category
  final String description;
  final double rating;
  final int reviewsCount;
  final String profilePictureUrl;
  final List<String> portfolioImageUrls; // Interactive image gallery
  final bool isFeatured;
  final double distanceInKm; // Useful for 'Nearby Services'
  final bool isAvailableNow;
  // Complex schedule could be represented as an entity itself, keeping it simple for scope.
  final Map<String, List<String>> availabilityCalendar; // e.g. {'Monday': ['09:00', '10:00']}

  const ProviderEntity({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.description,
    this.rating = 0.0,
    this.reviewsCount = 0,
    this.profilePictureUrl = '',
    this.portfolioImageUrls = const [],
    this.isFeatured = false,
    this.distanceInKm = 0.0,
    this.isAvailableNow = true,
    this.availabilityCalendar = const {},
  });

  @override
  List<Object?> get props => [
        id,
        name,
        categoryId,
        description,
        rating,
        reviewsCount,
        profilePictureUrl,
        portfolioImageUrls,
        isFeatured,
        distanceInKm,
        isAvailableNow,
        availabilityCalendar,
      ];
}

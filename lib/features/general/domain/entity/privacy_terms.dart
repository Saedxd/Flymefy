import 'package:equatable/equatable.dart';

class PrivacyTermsList extends Equatable {
  final PrivacyTerms privacyTerms;

  const PrivacyTermsList({
    required this.privacyTerms,
  });

  factory PrivacyTermsList.fromJson(Map<String, dynamic> json) {
    return PrivacyTermsList(
      privacyTerms: PrivacyTerms.fromJson(json['data']),
    );
  }

  @override
  List<Object?> get props => [privacyTerms];
}

class PrivacyTerms extends Equatable {
  final String title;
  final String description;

  const PrivacyTerms({
    required this.title,
    required this.description,
  });

  factory PrivacyTerms.fromJson(Map<String, dynamic> json) {
    return PrivacyTerms(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
    );
  }

  @override
  List<Object?> get props => [title, description];
}

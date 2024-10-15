import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';

enum AffirmationLang { ru, en, esp, de, it, fr, custom }

enum AffirmationGender { male, female, trans, other, custom }

class Affirmation extends Equatable implements Insertable<Affirmation> {
  final String id;
  final String createdAt;
  final String? seenAt;
  final String categoryID;
  final AffirmationLang lang;
  final AffirmationGender gender;
  final String text;

  const Affirmation(
      {required this.id,
      required this.createdAt,
       this.seenAt,
      required this.categoryID,
      required this.lang,
      required this.gender,
      required this.text});

  @override
  List<Object?> get props => [id, createdAt, seenAt, categoryID, lang, gender, text];

  @override
  Map<String, Expression<Object>> toColumns(bool nullToAbsent) {
    // TODO: implement toColumns
    throw UnimplementedError();
  }
}

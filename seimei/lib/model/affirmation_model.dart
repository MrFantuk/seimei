enum AffirmationLang { ru, en, esp, de, it, fr, custom }

enum AffirmationGender { male, female, trans, other, custom }

class DocumentModel {
  final int id;
  final String createdAt;

  DocumentModel({required this.id, required this.createdAt});
}

class Affirmation extends DocumentModel {
  final int categoryID;
  final AffirmationLang lang;
  final AffirmationGender gender;
  final String text;

  Affirmation(
      {required super.id,
      required super.createdAt,
      required this.categoryID,
      required this.lang,
      required this.gender,
      required this.text});
}

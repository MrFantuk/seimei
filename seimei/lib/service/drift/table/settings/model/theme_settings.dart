import 'dart:convert';

import 'package:drift/drift.dart';

enum BackgroundLayoutType {
  image,

  video,

  gradient,

  theme
}

enum GradientLayoutType {
  linear,

  radial,
}

enum AlignmentGeometryType {
  topLeft,

  topCenter,

  topRight,

  centerLeft,

  center,

  centerRight,

  bottomLeft,

  bottomCenter,

  bottomRight,
}


class ThemeConfig {
  final BackgroundLayout backgroundLayout;

  ThemeConfig({required this.backgroundLayout});


}


class BackgroundLayout {
  final BackgroundLayoutType type;
  final MediaFile? file;
  final GradientLayoutSettings? gradient;
  final double? backgroundOpacity;

  BackgroundLayout({required this.type, this.file, this.gradient, this.backgroundOpacity = 0.5});

  static BackgroundLayout defaultVideoLayout = BackgroundLayout(
      type: BackgroundLayoutType.video,
      file: MediaFile(
          userId: "application",
          fileType: MediaFileType.video,
          storageType: MediaFileStorageType.assets,
          referenceTo: ReferenceTo.layout,
          createdAt: DateTime.now(),
          localPath: "assets/app/bg.MP4",
          size: 5,
          mimeType: 'video/mp4'),
      backgroundOpacity: 0.63);

  static BackgroundLayout defaultImageLayout = BackgroundLayout(
      type: BackgroundLayoutType.image,
      file: MediaFile(
          userId: "application",
          fileType: MediaFileType.image,
          storageType: MediaFileStorageType.assets,
          referenceTo: ReferenceTo.layout,
          createdAt: DateTime.now(),
          localPath: "assets/app/bg.PNG",
          size: 1,
          mimeType: 'image/png'),
      backgroundOpacity: 0.63);

  static BackgroundLayout defaultThemeLayout = BackgroundLayout(
    type: BackgroundLayoutType.theme,
  );

  /// factory.
  factory BackgroundLayout.fromJson(Map<String, dynamic> json) => _$BackgroundLayoutFromJson(json);

  /// Connect the generated JsonSerializable function to the `toJson` method.
  Map<String, dynamic> toJson() => _$BackgroundLayoutToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GradientLayoutSettings {
  final GradientLayoutType type;
  final AlignmentGeometryType? begin;
  final AlignmentGeometryType? end;
  final List<int>? gradient;
  final List<double>? stops;

  GradientLayoutSettings(this.type, this.begin, this.end, this.gradient, this.stops);

  /// factory.
  factory GradientLayoutSettings.fromJson(Map<String, dynamic> json) => _$GradientLayoutSettingsFromJson(json);

  /// Connect the generated JsonSerializable function to the `toJson` method.
  Map<String, dynamic> toJson() => _$GradientLayoutSettingsToJson(this);
}

class ThemeConfingConverter extends TypeConverter<ThemeConfig, String> {
  @override
  ThemeConfig fromSql(String fromDb) {
    return ThemeConfig.fromJson(json.decode(fromDb));
  }

  @override
  String toSql(ThemeConfig value) {
    return jsonEncode(value.toJson());
  }
}

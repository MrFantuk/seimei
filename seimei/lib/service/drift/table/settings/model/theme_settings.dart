import 'package:flutter/material.dart';

enum BackgroundLayoutType {
  theme,
  image,
  video,
}

enum BackgroundFileSource { local, assets }

class ThemeSettings {
  final BackgroundLayout backgroundLayout;
  final FontStyle fontStyle;

  ThemeSettings({required this.backgroundLayout, this.fontStyle = FontStyle.normal});
}

class BackgroundLayout {
  final BackgroundLayoutType type;
  final BackgroundFile? file;
  final double? backgroundOpacity;

  BackgroundLayout({required this.type, this.file, this.backgroundOpacity = 0.5});

  static BackgroundLayout defaultVideoLayout = BackgroundLayout(
      type: BackgroundLayoutType.video,
      file: BackgroundFile(
        BackgroundFileSource.assets,
        "assets/app/bg.MP4",
      ),
      backgroundOpacity: 0.63);

  static BackgroundLayout defaultImageLayout = BackgroundLayout(
      type: BackgroundLayoutType.image,
      file: BackgroundFile(
        BackgroundFileSource.assets,
        "assets/app/bg.PNG",
      ),
      backgroundOpacity: 0.63);

  static BackgroundLayout defaultThemeLayout = BackgroundLayout(
    type: BackgroundLayoutType.theme,
  );
}

class BackgroundFile {
  final BackgroundFileSource source;
  final String localPath;

  BackgroundFile(this.source, this.localPath);
}

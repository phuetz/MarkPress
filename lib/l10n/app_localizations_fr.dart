// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'MarkPress';

  @override
  String get actionOpen => 'Ouvrir Fichiers';

  @override
  String get actionExport => 'Exporter PDF';

  @override
  String get actionInfo => 'À propos';

  @override
  String get actionLanguage => 'Langue';

  @override
  String get tabWelcome => 'Bienvenue';

  @override
  String msgSavedTo(Object path) {
    return 'Enregistré sous $path';
  }

  @override
  String msgErrorOpen(Object error) {
    return 'Erreur à l\'ouverture : $error';
  }

  @override
  String msgErrorExport(Object error) {
    return 'Erreur d\'exportation PDF : $error';
  }

  @override
  String labelPath(Object path) {
    return 'Chemin : $path';
  }

  @override
  String get aboutDev => 'Développé par SergeT';

  @override
  String get aboutDesc =>
      'MarkPress est un visualiseur Markdown moderne et léger pour ordinateur. Consultez plusieurs fichiers dans des onglets, naviguez facilement et exportez vos documents en PDF de haute qualité.';

  @override
  String get welcomeContent =>
      '# Bienvenue sur MarkPress\n\nCliquez sur l\'icône **dossier** en haut à droite pour ouvrir des fichiers `.md`.\n\n## Fonctionnalités\n- **Support multi-onglets**\n- **Export vers PDF** (Moteur MarkPress)\n- **Diagrammes Mermaid** intégrés\n- **Multi-langue**\n- Interface simple et rapide';

  @override
  String get msgCopiedToClipboard => 'Copié dans le presse-papiers';

  @override
  String get actionZoomIn => 'Zoomer';

  @override
  String get actionZoomOut => 'Dézoomer';

  @override
  String get actionResetZoom => 'Réinitialiser le zoom';

  @override
  String get actionToC => 'Table des matières';

  @override
  String get labelTableOfContents => 'Table des matières';

  @override
  String get actionPresentationMode => 'Mode présentation';

  @override
  String get actionExitPresentationMode => 'Quitter le mode présentation';

  @override
  String get msgFileChanged => 'Fichier modifié sur le disque. Rechargement...';

  @override
  String get actionReload => 'Recharger';

  @override
  String get actionScrollTop => 'Haut de page';

  @override
  String get actionScrollBottom => 'Bas de page';
}

enum Environnement { dev, prod }

class AppEnvironnments {
  static Environnement environnement = Environnement.dev;

  static String get baseUrl {
    switch (environnement) {
      case Environnement.dev:
        return 'https://padiwan.linkia.qa';
      case Environnement.prod:
        return 'https://padiwan.linkia.qa';
    }
  }
}

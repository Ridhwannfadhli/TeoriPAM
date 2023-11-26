class ModelTeams {
  List<Teams>? teams;

  ModelTeams({
    this.teams,
  });

  ModelTeams.fromJson(Map<String, dynamic> json) {
    teams = (json['teams'] as List?)?.map((dynamic e) => Teams.fromJson(e as Map<String,dynamic>)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['teams'] = teams?.map((e) => e.toJson()).toList();
    return json;
  }
}

class Teams {
  String? idTeam;
  dynamic idSoccerXML;
  String? idAPIfootball;
  dynamic intLoved;
  String? strTeam;
  dynamic strTeamShort;
  String? strAlternate;
  String? intFormedYear;
  String? strSport;
  String? strLeague;
  String? idLeague;
  dynamic strLeague2;
  dynamic idLeague2;
  dynamic strLeague3;
  dynamic idLeague3;
  dynamic strLeague4;
  dynamic idLeague4;
  dynamic strLeague5;
  dynamic idLeague5;
  dynamic strLeague6;
  dynamic idLeague6;
  dynamic strLeague7;
  dynamic idLeague7;
  dynamic strDivision;
  String? strStadium;
  String? strKeywords;
  String? strRSS;
  dynamic strStadiumThumb;
  String? strStadiumDescription;
  String? strStadiumLocation;
  String? intStadiumCapacity;
  String? strWebsite;
  String? strFacebook;
  String? strTwitter;
  String? strInstagram;
  String? strDescriptionEN;
  dynamic strDescriptionDE;
  dynamic strDescriptionFR;
  dynamic strDescriptionCN;
  dynamic strDescriptionIT;
  dynamic strDescriptionJP;
  dynamic strDescriptionRU;
  dynamic strDescriptionES;
  dynamic strDescriptionPT;
  dynamic strDescriptionSE;
  dynamic strDescriptionNL;
  dynamic strDescriptionHU;
  dynamic strDescriptionNO;
  dynamic strDescriptionIL;
  dynamic strDescriptionPL;
  dynamic strKitColour1;
  dynamic strKitColour2;
  dynamic strKitColour3;
  String? strGender;
  String? strCountry;
  String? strTeamBadge;
  dynamic strTeamJersey;
  dynamic strTeamLogo;
  dynamic strTeamFanart1;
  dynamic strTeamFanart2;
  dynamic strTeamFanart3;
  dynamic strTeamFanart4;
  dynamic strTeamBanner;
  String? strYoutube;
  String? strLocked;

  Teams({
    this.idTeam,
    this.idSoccerXML,
    this.idAPIfootball,
    this.intLoved,
    this.strTeam,
    this.strTeamShort,
    this.strAlternate,
    this.intFormedYear,
    this.strSport,
    this.strLeague,
    this.idLeague,
    this.strLeague2,
    this.idLeague2,
    this.strLeague3,
    this.idLeague3,
    this.strLeague4,
    this.idLeague4,
    this.strLeague5,
    this.idLeague5,
    this.strLeague6,
    this.idLeague6,
    this.strLeague7,
    this.idLeague7,
    this.strDivision,
    this.strStadium,
    this.strKeywords,
    this.strRSS,
    this.strStadiumThumb,
    this.strStadiumDescription,
    this.strStadiumLocation,
    this.intStadiumCapacity,
    this.strWebsite,
    this.strFacebook,
    this.strTwitter,
    this.strInstagram,
    this.strDescriptionEN,
    this.strDescriptionDE,
    this.strDescriptionFR,
    this.strDescriptionCN,
    this.strDescriptionIT,
    this.strDescriptionJP,
    this.strDescriptionRU,
    this.strDescriptionES,
    this.strDescriptionPT,
    this.strDescriptionSE,
    this.strDescriptionNL,
    this.strDescriptionHU,
    this.strDescriptionNO,
    this.strDescriptionIL,
    this.strDescriptionPL,
    this.strKitColour1,
    this.strKitColour2,
    this.strKitColour3,
    this.strGender,
    this.strCountry,
    this.strTeamBadge,
    this.strTeamJersey,
    this.strTeamLogo,
    this.strTeamFanart1,
    this.strTeamFanart2,
    this.strTeamFanart3,
    this.strTeamFanart4,
    this.strTeamBanner,
    this.strYoutube,
    this.strLocked,
  });

  Teams.fromJson(Map<String, dynamic> json) {
    idTeam = json['idTeam'] as String?;
    idSoccerXML = json['idSoccerXML'];
    idAPIfootball = json['idAPIfootball'] as String?;
    intLoved = json['intLoved'];
    strTeam = json['strTeam'] as String?;
    strTeamShort = json['strTeamShort'];
    strAlternate = json['strAlternate'] as String?;
    intFormedYear = json['intFormedYear'] as String?;
    strSport = json['strSport'] as String?;
    strLeague = json['strLeague'] as String?;
    idLeague = json['idLeague'] as String?;
    strLeague2 = json['strLeague2'];
    idLeague2 = json['idLeague2'];
    strLeague3 = json['strLeague3'];
    idLeague3 = json['idLeague3'];
    strLeague4 = json['strLeague4'];
    idLeague4 = json['idLeague4'];
    strLeague5 = json['strLeague5'];
    idLeague5 = json['idLeague5'];
    strLeague6 = json['strLeague6'];
    idLeague6 = json['idLeague6'];
    strLeague7 = json['strLeague7'];
    idLeague7 = json['idLeague7'];
    strDivision = json['strDivision'];
    strStadium = json['strStadium'] as String?;
    strKeywords = json['strKeywords'] as String?;
    strRSS = json['strRSS'] as String?;
    strStadiumThumb = json['strStadiumThumb'];
    strStadiumDescription = json['strStadiumDescription'] as String?;
    strStadiumLocation = json['strStadiumLocation'] as String?;
    intStadiumCapacity = json['intStadiumCapacity'] as String?;
    strWebsite = json['strWebsite'] as String?;
    strFacebook = json['strFacebook'] as String?;
    strTwitter = json['strTwitter'] as String?;
    strInstagram = json['strInstagram'] as String?;
    strDescriptionEN = json['strDescriptionEN'] as String?;
    strDescriptionDE = json['strDescriptionDE'];
    strDescriptionFR = json['strDescriptionFR'];
    strDescriptionCN = json['strDescriptionCN'];
    strDescriptionIT = json['strDescriptionIT'];
    strDescriptionJP = json['strDescriptionJP'];
    strDescriptionRU = json['strDescriptionRU'];
    strDescriptionES = json['strDescriptionES'];
    strDescriptionPT = json['strDescriptionPT'];
    strDescriptionSE = json['strDescriptionSE'];
    strDescriptionNL = json['strDescriptionNL'];
    strDescriptionHU = json['strDescriptionHU'];
    strDescriptionNO = json['strDescriptionNO'];
    strDescriptionIL = json['strDescriptionIL'];
    strDescriptionPL = json['strDescriptionPL'];
    strKitColour1 = json['strKitColour1'];
    strKitColour2 = json['strKitColour2'];
    strKitColour3 = json['strKitColour3'];
    strGender = json['strGender'] as String?;
    strCountry = json['strCountry'] as String?;
    strTeamBadge = json['strTeamBadge'] as String?;
    strTeamJersey = json['strTeamJersey'];
    strTeamLogo = json['strTeamLogo'];
    strTeamFanart1 = json['strTeamFanart1'];
    strTeamFanart2 = json['strTeamFanart2'];
    strTeamFanart3 = json['strTeamFanart3'];
    strTeamFanart4 = json['strTeamFanart4'];
    strTeamBanner = json['strTeamBanner'];
    strYoutube = json['strYoutube'] as String?;
    strLocked = json['strLocked'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['idTeam'] = idTeam;
    json['idSoccerXML'] = idSoccerXML;
    json['idAPIfootball'] = idAPIfootball;
    json['intLoved'] = intLoved;
    json['strTeam'] = strTeam;
    json['strTeamShort'] = strTeamShort;
    json['strAlternate'] = strAlternate;
    json['intFormedYear'] = intFormedYear;
    json['strSport'] = strSport;
    json['strLeague'] = strLeague;
    json['idLeague'] = idLeague;
    json['strLeague2'] = strLeague2;
    json['idLeague2'] = idLeague2;
    json['strLeague3'] = strLeague3;
    json['idLeague3'] = idLeague3;
    json['strLeague4'] = strLeague4;
    json['idLeague4'] = idLeague4;
    json['strLeague5'] = strLeague5;
    json['idLeague5'] = idLeague5;
    json['strLeague6'] = strLeague6;
    json['idLeague6'] = idLeague6;
    json['strLeague7'] = strLeague7;
    json['idLeague7'] = idLeague7;
    json['strDivision'] = strDivision;
    json['strStadium'] = strStadium;
    json['strKeywords'] = strKeywords;
    json['strRSS'] = strRSS;
    json['strStadiumThumb'] = strStadiumThumb;
    json['strStadiumDescription'] = strStadiumDescription;
    json['strStadiumLocation'] = strStadiumLocation;
    json['intStadiumCapacity'] = intStadiumCapacity;
    json['strWebsite'] = strWebsite;
    json['strFacebook'] = strFacebook;
    json['strTwitter'] = strTwitter;
    json['strInstagram'] = strInstagram;
    json['strDescriptionEN'] = strDescriptionEN;
    json['strDescriptionDE'] = strDescriptionDE;
    json['strDescriptionFR'] = strDescriptionFR;
    json['strDescriptionCN'] = strDescriptionCN;
    json['strDescriptionIT'] = strDescriptionIT;
    json['strDescriptionJP'] = strDescriptionJP;
    json['strDescriptionRU'] = strDescriptionRU;
    json['strDescriptionES'] = strDescriptionES;
    json['strDescriptionPT'] = strDescriptionPT;
    json['strDescriptionSE'] = strDescriptionSE;
    json['strDescriptionNL'] = strDescriptionNL;
    json['strDescriptionHU'] = strDescriptionHU;
    json['strDescriptionNO'] = strDescriptionNO;
    json['strDescriptionIL'] = strDescriptionIL;
    json['strDescriptionPL'] = strDescriptionPL;
    json['strKitColour1'] = strKitColour1;
    json['strKitColour2'] = strKitColour2;
    json['strKitColour3'] = strKitColour3;
    json['strGender'] = strGender;
    json['strCountry'] = strCountry;
    json['strTeamBadge'] = strTeamBadge;
    json['strTeamJersey'] = strTeamJersey;
    json['strTeamLogo'] = strTeamLogo;
    json['strTeamFanart1'] = strTeamFanart1;
    json['strTeamFanart2'] = strTeamFanart2;
    json['strTeamFanart3'] = strTeamFanart3;
    json['strTeamFanart4'] = strTeamFanart4;
    json['strTeamBanner'] = strTeamBanner;
    json['strYoutube'] = strYoutube;
    json['strLocked'] = strLocked;
    return json;
  }
}
library common;

class Common {
  Common._();

  static const baseUrl = "https://api.openweathermap.org/";
  static const apiKey = "aa703bec01fd63b008a8dbd60b68ee69";

  static String getIconUrl(String icon) =>
      "https://openweathermap.org/img/wn/$icon@2x.png";
}

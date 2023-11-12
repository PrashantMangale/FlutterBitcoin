class ApiUrls {
  static const String strBaseUrl = "https://pro-api.coinmarketcap.com";

  static const String strLatestCryptoCoins =
      "$strBaseUrl/v1/cryptocurrency/listings/latest?start=1&limit=20&convert=USD";
  static const String strGetCryptoInfo = "$strBaseUrl/v2/cryptocurrency/info";
}

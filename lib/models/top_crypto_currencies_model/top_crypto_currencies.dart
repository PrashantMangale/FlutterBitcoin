class TopCryptoCurrencies {
  List<CryptoCurrency>? data;
  Status? status;

  TopCryptoCurrencies({this.data, this.status});

  TopCryptoCurrencies.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CryptoCurrency>[];
      json['data'].forEach((v) {
        data!.add(CryptoCurrency.fromJson(v));
      });
    }
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (status != null) {
      data['status'] = status!.toJson();
    }
    return data;
  }
}

class CryptoCurrency {
  int? id;
  String? name;
  String? symbol;
  String? slug;
  int? cmcRank;
  int? numMarketPairs;

  // int? circulatingSupply;
  // int? totalSupply;
  // int? maxSupply;
  // bool? infiniteSupply;
  // String? lastUpdated;
  // String? dateAdded;
  // List<String>? tags;
  // dynamic platform;
  // dynamic selfReportedCirculatingSupply;
  // dynamic selfReportedMarketCap;
  Quote? quote;

  CryptoCurrency(
      {this.id,
      this.name,
      this.symbol,
      this.slug,
      this.cmcRank,
      this.numMarketPairs,
      // this.circulatingSupply,
      // this.totalSupply,
      // this.maxSupply,
      // this.infiniteSupply,
      // this.lastUpdated,
      // this.dateAdded,
      // this.tags,
      // this.platform,
      // this.selfReportedCirculatingSupply,
      // this.selfReportedMarketCap,
      this.quote});

  CryptoCurrency.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    slug = json['slug'];
    cmcRank = json['cmc_rank'];
    numMarketPairs = json['num_market_pairs'];
    // circulatingSupply = json['circulating_supply'];
    // totalSupply = json['total_supply'];
    // maxSupply = json['max_supply'];
    // infiniteSupply = json['infinite_supply'];
    // lastUpdated = json['last_updated'];
    // dateAdded = json['date_added'];
    // tags = json['tags'].cast<String>();
    // platform = json['platform'];
    // selfReportedCirculatingSupply = json['self_reported_circulating_supply'];
    // selfReportedMarketCap = json['self_reported_market_cap'];
    quote = json['quote'] != null ? Quote.fromJson(json['quote']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['symbol'] = symbol;
    data['slug'] = slug;
    data['cmc_rank'] = cmcRank;
    data['num_market_pairs'] = numMarketPairs;
    // data['circulating_supply'] = circulatingSupply;
    // data['total_supply'] = totalSupply;
    // data['max_supply'] = maxSupply;
    // data['infinite_supply'] = infiniteSupply;
    // data['last_updated'] = lastUpdated;
    // data['date_added'] = dateAdded;
    // data['tags'] = tags;
    // data['platform'] = platform;
    // data['self_reported_circulating_supply'] = selfReportedCirculatingSupply;
    // data['self_reported_market_cap'] = selfReportedMarketCap;
    if (quote != null) {
      data['quote'] = quote!.toJson();
    }
    return data;
  }
}

class Quote {
  USD? uSD;
  BTC? bTC;
  ETH? eTH;

  Quote({this.uSD, this.bTC, this.eTH});

  Quote.fromJson(Map<String, dynamic> json) {
    uSD = json['USD'] != null ? USD.fromJson(json['USD']) : null;
    bTC = json['BTC'] != null ? BTC.fromJson(json['BTC']) : null;
    eTH = json['ETH'] != null ? ETH.fromJson(json['ETH']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (uSD != null) {
      data['USD'] = uSD!.toJson();
    }
    if (bTC != null) {
      data['BTC'] = bTC!.toJson();
    }
    if (eTH != null) {
      data['ETH'] = eTH!.toJson();
    }
    return data;
  }
}

class USD {
  double? price;
  dynamic volume24h;
  dynamic volumeChange24h;
  double? percentChange1h;
  double? percentChange24h;
  double? percentChange7d;

  // double? marketCap;
  // double? marketCapDominance;
  // double? fullyDilutedMarketCap;
  String? lastUpdated;

  USD(
      {this.price,
      this.volume24h,
      this.volumeChange24h,
      this.percentChange1h,
      this.percentChange24h,
      this.percentChange7d,
      // this.marketCap,
      // this.marketCapDominance,
      // this.fullyDilutedMarketCap,
      this.lastUpdated});

  USD.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    volume24h = json['volume_24h'];
    volumeChange24h = json['volume_change_24h'];
    percentChange1h = json['percent_change_1h'];
    percentChange24h = json['percent_change_24h'];
    percentChange7d = json['percent_change_7d'];
    // marketCap = json['market_cap'];
    // marketCapDominance = json['market_cap_dominance'];
    // fullyDilutedMarketCap = json['fully_diluted_market_cap'];
    lastUpdated = json['last_updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['price'] = price;
    data['volume_24h'] = volume24h;
    data['volume_change_24h'] = volumeChange24h;
    data['percent_change_1h'] = percentChange1h;
    data['percent_change_24h'] = percentChange24h;
    data['percent_change_7d'] = percentChange7d;
    // data['market_cap'] = marketCap;
    // data['market_cap_dominance'] = marketCapDominance;
    // data['fully_diluted_market_cap'] = fullyDilutedMarketCap;
    data['last_updated'] = lastUpdated;
    return data;
  }
}

class BTC {
  int? price;
  int? volume24h;
  int? volumeChange24h;
  int? percentChange1h;
  int? percentChange24h;
  int? percentChange7d;
  int? marketCap;
  int? marketCapDominance;

  // double? fullyDilutedMarketCap;
  String? lastUpdated;

  BTC(
      {this.price,
      this.volume24h,
      this.volumeChange24h,
      this.percentChange1h,
      this.percentChange24h,
      this.percentChange7d,
      this.marketCap,
      this.marketCapDominance,
      // this.fullyDilutedMarketCap,
      this.lastUpdated});

  BTC.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    volume24h = json['volume_24h'];
    volumeChange24h = json['volume_change_24h'];
    percentChange1h = json['percent_change_1h'];
    percentChange24h = json['percent_change_24h'];
    percentChange7d = json['percent_change_7d'];
    marketCap = json['market_cap'];
    marketCapDominance = json['market_cap_dominance'];
    // fullyDilutedMarketCap = json['fully_diluted_market_cap'];
    lastUpdated = json['last_updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['price'] = price;
    data['volume_24h'] = volume24h;
    data['volume_change_24h'] = volumeChange24h;
    data['percent_change_1h'] = percentChange1h;
    data['percent_change_24h'] = percentChange24h;
    data['percent_change_7d'] = percentChange7d;
    data['market_cap'] = marketCap;
    data['market_cap_dominance'] = marketCapDominance;
    // data['fully_diluted_market_cap'] = fullyDilutedMarketCap;
    data['last_updated'] = lastUpdated;
    return data;
  }
}

class ETH {
  int? price;
  int? volume24h;
  double? volumeChange24h;
  int? percentChange1h;
  int? percentChange24h;
  int? percentChange7d;
  int? marketCap;
  int? marketCapDominance;

  // double? fullyDilutedMarketCap;
  String? lastUpdated;

  ETH(
      {this.price,
      this.volume24h,
      this.volumeChange24h,
      this.percentChange1h,
      this.percentChange24h,
      this.percentChange7d,
      this.marketCap,
      this.marketCapDominance,
      // this.fullyDilutedMarketCap,
      this.lastUpdated});

  ETH.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    volume24h = json['volume_24h'];
    volumeChange24h = json['volume_change_24h'];
    percentChange1h = json['percent_change_1h'];
    percentChange24h = json['percent_change_24h'];
    percentChange7d = json['percent_change_7d'];
    marketCap = json['market_cap'];
    marketCapDominance = json['market_cap_dominance'];
    // fullyDilutedMarketCap = json['fully_diluted_market_cap'];
    lastUpdated = json['last_updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['price'] = price;
    data['volume_24h'] = volume24h;
    data['volume_change_24h'] = volumeChange24h;
    data['percent_change_1h'] = percentChange1h;
    data['percent_change_24h'] = percentChange24h;
    data['percent_change_7d'] = percentChange7d;
    data['market_cap'] = marketCap;
    data['market_cap_dominance'] = marketCapDominance;
    // data['fully_diluted_market_cap'] = fullyDilutedMarketCap;
    data['last_updated'] = lastUpdated;
    return data;
  }
}

class Status {
  String? timestamp;
  int? errorCode;
  String? errorMessage;
  int? elapsed;
  int? creditCount;

  Status(
      {this.timestamp,
      this.errorCode,
      this.errorMessage,
      this.elapsed,
      this.creditCount});

  Status.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    errorCode = json['error_code'];
    errorMessage = json['error_message'];
    elapsed = json['elapsed'];
    creditCount = json['credit_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['timestamp'] = timestamp;
    data['error_code'] = errorCode;
    data['error_message'] = errorMessage;
    data['elapsed'] = elapsed;
    data['credit_count'] = creditCount;
    return data;
  }
}

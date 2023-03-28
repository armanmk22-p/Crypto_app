class CryptoModel {
  final String id;
  final String name;
  final String rank;
  final String symbol;
  final String marketCapUsd;
  final String priceUsd;
  final String changePercent24Hr;

  CryptoModel({
    required this.id,
    required this.name,
    required this.rank,
    required this.symbol,
    required this.marketCapUsd,
    required this.priceUsd,
    required this.changePercent24Hr,
  });

  factory CryptoModel.fromJson(Map<String,dynamic> json)=>CryptoModel(
    id: json['id'],
    name: json['name'],
    rank: json['rank'],
    symbol: json['symbol'],
    marketCapUsd: json['marketCapUsd'],
    priceUsd: json['priceUsd'],
    changePercent24Hr: json['changePercent24Hr'],
  );

  Map<String,dynamic> toJson(){

    final Map<String, dynamic> data = <String, dynamic>{};

    data['id']=id;
    data['name']=name;
    data['rank']=rank;
    data['symbol']=symbol;
    data['marketCapUsd']=marketCapUsd;
    data['priceUsd']=priceUsd;
    data['changePercent24Hr']=changePercent24Hr;
    
    return data;
  }
}

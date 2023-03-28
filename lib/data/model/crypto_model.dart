

class CryptoModel {
  final String id;
  final String name;
  final int rank;
  final String symbol;
  final double marketCapUsd;
  final double priceUsd;
  final double changePercent24Hr;

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
    rank: int.parse(json['rank']),
    symbol: json['symbol'],
    marketCapUsd:double.parse( json['marketCapUsd']),
    priceUsd:double.parse( json['priceUsd']),
    changePercent24Hr:double.parse( json['changePercent24Hr']),
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

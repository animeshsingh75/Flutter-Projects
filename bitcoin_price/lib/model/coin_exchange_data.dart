import 'dart:convert';

class CoinExchangeData {
  String? time;
  String? assetidquote;
  double? rate;

  CoinExchangeData({this.time, this.assetidquote, this.rate});

  CoinExchangeData.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    assetidquote = json['asset_id_quote'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['asset_id_quote'] = assetidquote;
    data['rate'] = rate;
    return data;
  }
}

class CoinExchangeDataList {
  String? assetidbase;
  List<CoinExchangeData?>? coinExchangeData;

  CoinExchangeDataList({this.assetidbase, this.coinExchangeData});

  CoinExchangeDataList.fromJson(String body) {
    Map<String, dynamic> json = jsonDecode(body);
    assetidbase = json['asset_id_base'];
    if (json['rates'] != null) {
      coinExchangeData = <CoinExchangeData>[];
      json['rates'].forEach((v) {
        coinExchangeData?.add(CoinExchangeData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['asset_id_base'] = assetidbase;
    data['rates'] = coinExchangeData?.map((v) => v?.toJson()).toList();
    return data;
  }
}

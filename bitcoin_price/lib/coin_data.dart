import 'package:bitcoin_price/model/coin_exchange_data.dart';
import 'package:http/http.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate/';
const apiKey = '8CE2DA5A-4EF4-4C1E-A629-868B542C9D98';

class CoinData {
  Map<String, Map<String, CoinExchangeData?>> cryptoMap = {
    for (String i in cryptoList)
      i: {
        for (String j in currenciesList) j: null,
      },
  };
  Future<void> getCoinData() async {
    String concatenatedCurrencyList = '';
    for (String currency in currenciesList) {
      concatenatedCurrencyList += '$currency,';
    }
    concatenatedCurrencyList.substring(0, concatenatedCurrencyList.length - 1);
    for (MapEntry<String, Map<String, CoinExchangeData?>> mapEntry
        in cryptoMap.entries) {
      Uri uri =
          Uri.https('rest.coinapi.io', '/v1/exchangerate/${mapEntry.key}', {
        'filter_asset_id': concatenatedCurrencyList,
        'apikey': apiKey,
      });
      Response response = await get(uri);
      if (response.statusCode == 200) {
        List<CoinExchangeData?>? coinExchangeDataList =
            CoinExchangeDataList.fromJson(response.body).coinExchangeData;

        if (coinExchangeDataList != null) {
          for (CoinExchangeData? coinExchangeData in coinExchangeDataList) {
            mapEntry.value[coinExchangeData?.assetidquote ?? ''] =
                coinExchangeData;
          }
        }
      } else {
        Future.error(response.body);
      }
    }
  }

  // Future<CoinExchangeData> getSingleCoinData(
  //     String crypto, String selectedCurrency) async {

  //   );
  //   if (response.statusCode == 200) {
  //     return CoinExchangeData.fromJson(response.body);
  //   } else {
  //     return Future.error(response.body);
  //   }
  // }
}

import 'package:bitcoin_ticker/networking.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


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


const kApiKey = '247A1047-F0F2-4339-AFA1-F329DBD9528D';
const String bitcoinAverageUrl = 'https://apiv2.bitcoinaverage.com/indices/global/ticker/BTCUSD';


class CoinData {
  Future getCoinData()async{
      http.Response response = await http.get(bitcoinAverageUrl, headers: {'x-ba-key': kApiKey});
      if(response.statusCode == 200){
        String data = response.body;
        var lastPrice = jsonDecode(data)['last'];
        return lastPrice;
      }else{
        print(response.statusCode);
      }
  }
}

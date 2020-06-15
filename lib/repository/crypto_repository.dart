import 'dart:convert';

import '../models/coin_model.dart';
import 'base_crypto_repository.dart';
import 'package:http/http.dart' as http;

class CryptoRepository extends BaseCryptoRepository {
  static const String _baseUrl = 'https://min-api.cryptocompare.com';
  static const int _coinsPErPage = 20;
  final http.Client _httpClint;
  CryptoRepository({http.Client httpClint})
      : _httpClint = httpClint ?? http.Client();
  @override
  void dispose() {
    _httpClint.close();
  }

  @override
  Future<List<Coin>> getTopCoins({int page}) async {
    List<Coin> coins = [];
    String requestUrl =
        '$_baseUrl/data/top/totalvolfull?limit=$_coinsPErPage&tsym=USD&page=$page';
    try {
      final respond = await _httpClint.get(requestUrl);
      if (respond.statusCode == 200) {
        Map<String, dynamic> data = json.decode(respond.body);
        List<dynamic> coinList = data['Data'];
        coinList.forEach(
          (json) => coins.add(
            Coin.fromJson(json),
          ),
        );
      }
      return coins;
    } catch (e) {
      throw (e);
    }
  }
}

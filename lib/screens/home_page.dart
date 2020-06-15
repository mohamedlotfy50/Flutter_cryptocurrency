import 'package:flutter/material.dart';
import '../repository/crypto_repository.dart';
import '../models/coin_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _cryptoRepository = CryptoRepository();
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF212121),
      appBar: AppBar(
        title: Text('Top Coins'),
        centerTitle: true,
      ),
      body: Container(
        child: FutureBuilder(
          future: _cryptoRepository.getTopCoins(page: _page),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation(Theme.of(context).accentColor),
                ),
              );
            }
            final List<Coin> coins = snapshot.data;
            return RefreshIndicator(
              color: Theme.of(context).accentColor,
              onRefresh: () async {
                setState(() {
                  _page = 0;
                });
              },
              child: ListView.builder(
                itemCount: coins.length,
                itemBuilder: (BuildContext context, int index) {
                  final coin = coins[index];
                  return ListTile(
                    leading: Image.network(
                      'https://www.cryptocompare.com${coin.imageUrl}',
                      width: 42,
                    ),
                    title: Text(
                      coin.fullName,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                    subtitle: Text(
                      coin.name,
                      style: TextStyle(
                        color: Colors.grey[400],
                      ),
                    ),
                    trailing: Text(
                      '\$${coin.price.toStringAsFixed(4)}',
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 15.8,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

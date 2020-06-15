import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Coin extends Equatable {
  final String imageUrl;
  final String name;
  final String fullName;
  final double price;

  const Coin({
    @required this.imageUrl,
    @required this.fullName,
    @required this.price,
    @required this.name,
  });

  @override
  List<Object> get props => [
        name,
        fullName,
        price,
      ];
  String toString() =>
      'Coin{ image:$imageUrl, name:$name, fullName:$fullName, price:$price}';
  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      fullName: json['CoinInfo']['FullName'],
      imageUrl: json['CoinInfo']['ImageUrl'],
      name: json['CoinInfo']['Name'],
      price: (json['RAW']['USD']['PRICE'] as num).toDouble(),
    );
  }
}

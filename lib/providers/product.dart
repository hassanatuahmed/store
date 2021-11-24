import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
  });

  void _setFavValue(bool newValue){
    isFavorite = newValue;
    notifyListeners();

  }
  Future<void> toggleFavoriteStatus() async {
    final oldStatus = isFavorite;
    final uri =Uri.parse('https://store-b1a45-default-rtdb.firebaseio.com/products/$id.json');
    isFavorite = !isFavorite;
    notifyListeners();
    try{
     var response= await http.patch(uri,body:json.encode({
        'isFavorite':isFavorite,

      }));
      if(response.statusCode>=400){
        // isFavorite = oldStatus;
        // notifyListeners();
        _setFavValue(oldStatus);
      }
    }catch(err){
      _setFavValue(oldStatus);



    }

  }
}

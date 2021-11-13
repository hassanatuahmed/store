import 'package:flutter/material.dart';


class ChartItem{
  final String id;
  final String title;
  final int quantity;
  final double price;

  ChartItem({@required this.id,  @required this.title,@required this.quantity, @required this.price});
}
class Chart with ChangeNotifier{
  Map<String, ChartItem>_items;

  Map<String,ChartItem>get  items{
    return {..._items};
}

void addItem(String id,double price,String title){
    if(_items.containsKey(productId)){
      _items.update(productId, (existingCartItem) => ChartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          quantity: existingCartItem.quantity + 1,
          price: existingCartItem.price));

    }else{
      _items.putIfAbsent(productId, ()=>ChartItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: 1,
          ));
    }

}

}
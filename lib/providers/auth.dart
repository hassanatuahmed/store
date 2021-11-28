import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:http/http' as http;

class Auth with ChangeNotifier{
  String _token;
  DateTime expiryDate;
  String userId;


  Future<void> signup (String email,String password){
    final url = 'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyAzjW8a677LrW6O95-UhYPpjkSZHei0Ag8';
   final response = await http.post(url,body: json.encode({
      'email':email,
      'password':password,
      'returnSecureToken':true,
    }));
  }
}
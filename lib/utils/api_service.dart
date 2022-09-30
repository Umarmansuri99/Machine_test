import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
 static late final BuildContext context;
  /*-----------------SHYAM TRUST---------------------------*/
  static final String BASE_URL = "http://restapi.adequateshop.com/api/";
 //http://restapi.adequateshop.com/api/authaccount/login
 //http://restapi.adequateshop.com/api/users?page=1
 //http://restapi.adequateshop.com/api/users/163700
 //https://jsonplaceholder.typicode.com/photos
  static final String SIGNUP = "authaccount/registration";
  static final String LOGIN = "authaccount/login";
  static final String User = "users?page=";
  static final String Single_User = "users/";
  static final String get_image = "https://jsonplaceholder.typicode.com/photos";



 final String authHeader =
     "Authorization"; // X-Authorization if server doesn't support Authorization header


// final String isBearer = authHeader == "X-Authorization" ? "" : "Bearer ";
  /*----------------EYE KANDY---------------------------*/

 Future LoginUser(String email, String password) async {
   print("{$email  $password  }");
   final response = await http.post(Uri.parse(BASE_URL + LOGIN),
       headers: {HttpHeaders.contentTypeHeader: 'application/json'},
       body: jsonEncode({
         'email': email,
         'password': password,
       }));
   var ConvertDataToJson = jsonDecode(response.body);
   return ConvertDataToJson;
 }



 Future Signup(String email, String password, String name) async {
   print("{$email  $password  $name}");
   final response = await http.post(Uri.parse(BASE_URL + SIGNUP),
       headers: {HttpHeaders.contentTypeHeader: 'application/json'},
       body: jsonEncode({
         'name': name,
         'email': email,
         'password': password,
       }));
   var ConvertDataToJson = jsonDecode(response.body);
   return ConvertDataToJson;
 }




 Future all_user_data(String token,String page) async {
   print("{$token}");
   final response = await http.get(Uri.parse(BASE_URL + User + page),
     headers: {HttpHeaders.AUTHORIZATION: 'Bearer ${token}'},
        );
   var ConvertDataToJson = jsonDecode(response.body);
   return ConvertDataToJson;
 }
 Future Get_profile() async {
  // print("{$token}");
   final response = await http.get(Uri.parse(get_image),
    // headers: {HttpHeaders.AUTHORIZATION: 'Bearer ${token}'},
        );
   var ConvertDataToJson = jsonDecode(response.body);
   return ConvertDataToJson;
 }


  Future All_user_data_single(String token,String id) async {
    final response = await http.get(Uri.parse(BASE_URL + Single_User + id),
      headers: {HttpHeaders.AUTHORIZATION: 'Bearer '+token},
    );
    var ConvertDataToJson = jsonDecode(response.body);
    return ConvertDataToJson;
  }

}

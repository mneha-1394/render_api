
import 'package:render_api/model/second.dart';

import '../model/first.dart';
import'package:http/http.dart' as http;

class RemoteService{
  Future<List<Firstpagedata>?> getData() async{
     var  uri =Uri.parse('http://universities.hipolabs.com/search?country=United+States');
       var response=await http.get(uri);
       if(response.statusCode==200){
        var json = response.body;
        return firstpagedataFromJson(json);
       } 
       return null;
  }

   Future<Secondpagedata?> getinformation() async{
           var  uri =Uri.parse('https://api.coindesk.com/v1/bpi/currentprice.json');
       var response=await http.get(uri);
       if(response.statusCode==200){
        var json = response.body;
        return secondpagedataFromJson(json);
       } 
       return null;
   }  
  
   }  

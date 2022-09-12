import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class ThirdPage extends StatefulWidget {
    static const routeName = '/third';
  const ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
 
  List users = [];
  bool isLoading = false;
  @override
  void initState() {
  
    super.initState();
    fetchUser();
  }
  fetchUser() async {
    setState(() {
      isLoading = true;
    });
   var  uri =Uri.parse('https://randomuser.me/api/');
       var response=await http.get(uri);
    // print(response.body);
    if(response.statusCode == 200){
      var items = json.decode(response.body)['results'];
      setState(() {
        users = items;
        isLoading = false;
      });
    }else{
      users = [];
      isLoading = false;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listing Users"),
      ),
      body: getBody(),
    );
  }
  Widget getBody(){
    if(users.contains(null) || users.length < 0 || isLoading){
      return const Center(child: CircularProgressIndicator(valueColor:AlwaysStoppedAnimation<Color>(Colors.amber),));
    }
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context,index){
      return getCard(users[index]);
    });
  }
  Widget getCard(item){
    var fullName = item['name']['title']+" "+item['name']['first']+" "+item['name']['last'];
    var email = item['email'];
    var profileUrl = item['picture']['large'];
    return Card(
      elevation: 1.5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          title: Row(
            children: <Widget>[
            CircleAvatar(child: Image.network(profileUrl,fit: BoxFit.scaleDown,)),
              const SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width-140,
                    child: Text(fullName,style: const TextStyle(fontSize: 17),)),
                  const SizedBox(height: 10,),
                  Text(email.toString(),style: const TextStyle(color: Colors.grey),)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../model/first.dart';
import '../services/remoteservice.dart';
import '../screens/secondpage.dart';
import 'package:url_launcher/url_launcher.dart';

class FirstPage extends StatefulWidget {
  static const routeName = '/';
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    super.initState();
    getdata();
  }

  List<Firstpagedata>? firstpage;
  void getdata() async {
    firstpage = (await RemoteService().getData());
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(
          () {},
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('1st API')),
      body: firstpage == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: ((context, index) {
                return Card(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                      const Padding(padding: EdgeInsets.all(5)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text("University Name:",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(firstpage![index].name,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text("AlphaTwoCode: ",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(firstpage![index].alphaTwoCode.toString()),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text("Country: ",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(firstpage![index].country.toString()),
                        ],
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text("Domains: ",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            InkWell(
                              child: Text(firstpage![index].domains.toString(),style: const TextStyle(color: Colors.blue),),
                              onTap: () => launchUrlString(
                                  firstpage![index].domains.toString()),
                            )
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text("Web Page: ",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            InkWell(
                                child:
                                    Text(firstpage![index].webPages.toString(),style: const TextStyle(color: Colors.blue),),
                                onTap: () => launchUrlString(
                                    firstpage![index].webPages.toString()))
                          ]),
                    ]));
              }),
              itemCount: firstpage!.length,
            ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(SecondPage.routeName);
          },
          child: const Icon(
            Icons.keyboard_arrow_right_sharp,
          )),
    );
  }
}

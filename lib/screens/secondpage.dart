import 'package:flutter/material.dart';
import 'package:render_api/model/second.dart';
import 'package:render_api/screens/thirdpage.dart';

import '../services/remoteservice.dart';

class SecondPage extends StatefulWidget {
  static const routeName = '/second';
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  void initState() {
    super.initState();
    getdata();
  }

  Secondpagedata? secondpage;
  void getdata() async {
    secondpage = (await RemoteService().getinformation());
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(
          () {},
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('2nd API')),
      body: secondpage == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(children: [
              const Padding(
                padding: EdgeInsets.all(2),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text("Chart Name: "),
                  Text(secondpage!.chartName)
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(2),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text("EURO Code: "),
                  Text(secondpage!.bpi.eur.code)
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(2),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text("EURO Description; "),
                  Text(secondpage!.bpi.eur.description)
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(2),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text("EURO Rate: "),
                  Text(secondpage!.bpi.eur.rate)
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(2),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text("EURO Symbol:"),
                  Text(secondpage!.bpi.eur.symbol)
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(2),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text("EURO RateFloat:"),
                  Text(secondpage!.bpi.eur.rateFloat.toString())
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(2),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text("GBP Code:"),
                  Text(secondpage!.bpi.gbp.code)
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(2),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text("GBP Description:"),
                  Text(secondpage!.bpi.gbp.description)
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(2),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text("GBP Rate:"),
                  Text(secondpage!.bpi.gbp.rate)
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(2),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text("GBP Symbol:"),
                  Text(secondpage!.bpi.gbp.symbol)
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(2),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text("GBP RateFloat:"),
                  Text(secondpage!.bpi.gbp.rateFloat.toString())
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(2),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text("USD Code:"),
                  Text(secondpage!.bpi.usd.code)
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(2),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text("USD Description:"),
                  Text(secondpage!.bpi.usd.description)
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(2),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text("USD Rate:"),
                  Text(secondpage!.bpi.usd.rate)
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(2),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text("USD Symbol:"),
                  Text(secondpage!.bpi.usd.symbol)
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(2),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text("USD RateFloat:"),
                  Text(secondpage!.bpi.usd.rateFloat.toString())
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(2),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text("Time Updated:"),
                  Text(secondpage!.time.updated)
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(2),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text("Time Updateduk"),
                  Text(secondpage!.time.updateduk)
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(2),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text("Time UpdatedIso"),
                  Text(secondpage!.time.updatedIso.toString())
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(3),
              ),
              Column(children: [
                Text("Disclaimer:   ${secondpage!.disclaimer}",style:const TextStyle(fontWeight: FontWeight.bold))
              ],)
            ]
            ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(ThirdPage.routeName);
          },
          child: const Icon(
            Icons.keyboard_arrow_right_sharp,
          )),
    );
  }
}

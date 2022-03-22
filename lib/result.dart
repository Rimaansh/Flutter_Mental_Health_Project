import 'package:flutter/material.dart';
import 'package:mental_health_quiz/provider.dart';
import 'package:mental_health_quiz/suggestions.dart';
import 'chart.dart';
import 'series.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'main.dart';
import 'package:provider/provider.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;
  final VoidCallback onPressed;

  Result(this.resultScore, this.resetHandler, this.onPressed);

//Remark Logic
  String get resultPhrase {
    String resultText;
    if (resultScore >= 41) {
      resultText = 'You are awesome!';
      print(resultScore);
    } else if (resultScore >= 31) {
      resultText = 'Pretty likeable!';
      print(resultScore);
    } else if (resultScore >= 21) {
      resultText = 'You need to work more!';
    } else if (resultScore >= 1) {
      resultText = 'You need to work hard!';
    } else {
      resultText = 'This is a poor score!';
      print(resultScore);
    }
    return resultText;
  }

/*
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ), //Text
          Text(
            'Score ' '$resultScore',
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ), //Text
          FlatButton(
            child: Text(
              'Restart Quiz!',
            ), //Text
            textColor: Colors.blue,
            onPressed: onPressed,
          ), //FlatButton
        ], //<Widget>[]
      ), //Column
    ); //Center
  }

*/
  @override
  Widget build(BuildContext context) {
    final List<BitcoinPriceSeries> data = [
      BitcoinPriceSeries(
        month: "Teaching (Average)",
        price: 3.334,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
      BitcoinPriceSeries(
        month: "Teaching (You)",
        price: avgTeaching / 15,
        barColor: charts.ColorUtil.fromDartColor(Colors.yellow),
      ),
      BitcoinPriceSeries(
        month: "Peers (Average)",
        price: 3.273,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
      BitcoinPriceSeries(
        month: "Peers (You)",
        price: avgPeers / 7,
        barColor: charts.ColorUtil.fromDartColor(Colors.yellow),
      ),
      BitcoinPriceSeries(
        month: "Student-Teacher Relationship (Average)",
        price: 3.167,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
      BitcoinPriceSeries(
        month: "Student-Teacher Relationship (You)",
        price: avgstRel / 10,
        barColor: charts.ColorUtil.fromDartColor(Colors.yellow),
      ),
      BitcoinPriceSeries(
        month: "School Management (Average)",
        price: 3.377,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
      BitcoinPriceSeries(
        month: "School Management (You)",
        price: avgschMan / 3,
        barColor: charts.ColorUtil.fromDartColor(Colors.yellow),
      ),
    ];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFff7e5f),
          title: Text("Here are your results!"),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              resultPhrase,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ), //Text
            Text(
              'Score ' '$resultScore',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ), //Text
            BitcoinPriceChart(
              data: data,
            ),
            ElevatedButton(
                onPressed: (() => showDialog(
                    context: context, builder: (context) => Suggestions())),
                child: Text(
                    "Want to improve your Happiness Index?\n Get suggestions here."))
          ],
        )));
  }
}

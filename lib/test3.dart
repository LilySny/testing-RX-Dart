import 'package:rxdart/rxdart.dart';

main() {
  List<String> list = [
    "Will",
    "Will Smith",
    "Smith",
    "Will Smith Will",
    "Smith Will",
    "Smith Will Smith"
  ];
  var will$ = ReplaySubject<String>();
  var smith$ = ReplaySubject<String>();
  will$.add("Will");
  smith$.add("Smith");
  will$.add("WUEUNWUENWUEN");
  will$.add("Will");
  will$.add("ill");
  smith$.add("Smithation");
  smith$.add("Smeething");
  will$.add("Hill");
  smith$.add("Smite");


  Observable.merge([will$, smith$]) // merge the both controllers and then print them
  .where((i) => i.toLowerCase().contains("sm"))
  .listen((i) => print("Merge: $i")); // it will print each element of both controller separately
  
  Observable.concat([will$, smith$]) // it only emits the values of the second stream, when the previous streams terminate succefully
  .where((v) => v.contains("ill"))//concats the ones who has "ill"
  .listen((i) => print("Concat:$i")); // it only prints the will$(first stream), cause it never ends

  Observable.fromIterable(list).expand<String>((v) => [v]) //expands the elements from the list
  ..listen((n) => print("expand names: $n")); //print each one separately 

  Observable.combineLatest2(will$, smith$, (w, s) => // it really combines the values of both streams
  print("CombineLatest: $w " + "$s")) //combines the values of each controller
  .take(3)
  ..listen((i) => i); 

  Observable.zip2(will$, smith$, (w, s) => // zips the both streams into one observable
  print("Smitation: $s"  + "$w"))
  .take(2)
  ..listen((i) => i);

  // resume:
  // merge: gets each element of the merged streams
  // concat: it only emits the values of the second stream, when the previous streams terminate succefully
  // combineLatest: combine the streams values
  // zip: zips the streams into one observable 
}
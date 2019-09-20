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

  Observable.merge([will$, smith$])..listen((i) => print("Test3 = name: $i")); // merge the both controllers and then print them
  Observable.concat([will$, smith$]).where((v) => v.contains("ill"))//concats the ones who has "ill"
  ..listen((i) => print("Test3 = concat:$i ")); //prints the result

  Observable.fromIterable(list).expand<String>((v) => [v]) //expands the elements from the list
  ..listen((n) => print("expand names: $n")); //print each one separately

  Observable.combineLatest2(will$, smith$, (w, s) => print("$w " + "$s")) //combines the values of each controller
  ..listen(print);

  Observable.zip2(will$, smith$, (w, s) => print("Smitation: $s"  + "$w"))// zips the both controllers (waits until get data)
  ..listen((i) => i);
}
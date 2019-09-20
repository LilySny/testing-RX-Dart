import 'package:rxdart/rxdart.dart';

main() async {
var controllerB1 = BehaviorSubject<int>.seeded(1);
var controllerB2 = BehaviorSubject<int>.seeded(2);


controllerB1.add(2);
controllerB1.listen((i) => print("b1 controller: $i"));
controllerB2.listen((i) => print("b2 controller: $i"));

Observable.combineLatest2(controllerB1, controllerB2, (c1, c2) => c1 + c2) // combines the both controllers, getting the latest value of each one and combining
..listen((i) => print("result of combineLatest2 $i")); // prints result
controllerB2.add(7);

Observable.merge([controllerB1, controllerB2])
// .buffer(Stream.periodic(Duration(seconds: 5), (i) => i)) will be listening in every 5 seconds
..listen((i) => print("merge: $i"));

var controllerP1 = PublishSubject<int>();

controllerP1.add(1); 
controllerP1.listen((d) => print("result of publish: $d"));
controllerP1.add(2); // it doesn't add after .listen


}

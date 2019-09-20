import 'package:rxdart/rxdart.dart';
main(){
  final counter$ = BehaviorSubject<int>();

  counter$
      .where((i) => i > 5)
      .map((e) => e * 10)
      .take(4)
      .skip(3)
      .listen((i) => print(i));

  //counter$.scan<List>((acc,curr,i) => acc..add(curr),[]).listen((e) => print(e));

  //counter$.scan((acc, curr, i) => acc + curr, 0).listen((i) => print(i));

  counter$.add(5);
  counter$.add(2);
  counter$.add(30);
  counter$.add(30);
  counter$.add(30);
  counter$.add(30);
  counter$.add(30);
  counter$.add(30);
  counter$.add(30);
}
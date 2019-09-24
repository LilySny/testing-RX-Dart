import 'package:rxdart/rxdart.dart';

main() {
  final letter$ = BehaviorSubject<String>();
  final number$ = BehaviorSubject<int>();
  Observable.forkJoin([letter$, number$], (l) => l.shuffle()).listen(print);
  number$.map((i) => i + 1).skipWhile((i) => i > 6).listen((i) => print("SkipWhile: $i"));//gives a condition, and skips the values while funfill the condition(true)
  number$.map((i) => i *2).takeWhile((i) => i > 6).listen((i) => print("TakeWhile: $i"));//gives a condition, and only take values while funfill the condition(true)
  letter$.withLatestFrom(number$, (i, e) => print("$i" + "$e")).listen((i) => i);//combines the latest values from the both streams, and pass them a function
  letter$
      .throttle((_) => TimerStream(true, const Duration(seconds: 1)))
      .asBroadcastStream()
      .listen(print); //emits the first item of the stream
  letter$.add("A");
  letter$.add("B");
  letter$.add("C");
  letter$.add("D");
  letter$.add("E");
  Observable.range(1, 12)
      .listen(print); //emits a sequence of Integers within a specified range
  number$.add(10);
  number$.add(11);
  number$.add(3);
}

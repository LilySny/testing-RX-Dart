//groupBy
//transform
//maps
//withLastestFrom
//takeWhile
//skipWhile
//forkJoin
//range
//sequenceEqual
//timestamp()
//throttle
//share && publish
//reduce
//sample
//do

import 'dart:async';

import 'package:rxdart/rxdart.dart';

main() {
  // final transformer = StreamTransformer<int,int>.fromHandlers(handleData: (value, sink) {
  //   sink.add(value * 2);
  // });

  final c1 = BehaviorSubject<int>();
  // c1  .map((i) => i * 2)
  //     .where((i) => i > 10)
  //     //.transform(transformer)
  //     .listen((i) => print("map: $i"));

  c1
      .asyncMap((d) => Future.value(1000))
      .listen((e) => print("Async: $e")); // returns a future

  c1.switchMap((e) => Observable.just(e)).listen((e) =>
      print("Switch: $e")); // returns the last value and cancels the previous

  c1
      .flatMap((e) => Observable.just(1).startWithMany([1, 2, 3, 4, 5, 6]))
      .listen((i) => print("Flat: $i")); // async* returns all the values

  c1
      .concatMap((e) => Observable.just(1))
      .listen((e) => print("ConcatMap: $e")); // iterates over the stream sync*

  c1
      .flatMapIterable((e) => Observable.just([1, 2, 3, 4, 5, 6]))
      .map((e) => e * 10)
      .listen((e) => print(
          " flatMapIterable: $e")); //operates individualy over each value of the stream-list

  c1.mapTo(true).listen(
      print); //when the stream emits a value, transforms to mapTo(value)


      //exhaustMap

  c1.add(3);
  c1.add(5);
  c1.add(4);
  c1.add(10);
  c1.add(11);
}

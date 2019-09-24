import 'package:rxdart/rxdart.dart';

//debounce, buffer, sampleTime,throttleTime, timeInterval,timeout, timestamp,windowTime, timer, delay
main() {
  final tc$ = ReplaySubject<int>();
  tc$.add(3);
  tc$.add(4);
  tc$.add(7);
  tc$.add(6);
  tc$.add(20);
  tc$.add(10);

  tc$
      .map((v) => v * 3)
      .debounceTime(Duration(milliseconds: 1))
      .listen((v) => print("DebounceTime: $v"));
  //tc$.map((v) => v + 2).bufferTime(Duration(seconds: 2)).listen((v) => print("BufferTime: $v")); //(returns a list)emits values in every: (durationTime),(for example 1 in 1 second), if doesnt have values in the stream, it will output a empty list: []  
  tc$.map((v) => v + 1).sampleTime(Duration(seconds: 10)).listen((v) => print("SampleTime: $v")); // emits the most recenttly emmited item, after the span time
  tc$.throttleTime(Duration(seconds: 5)).listen((v) => print("ThrottleTime: $v"));//emits only the first item added in the stream, whitin a time span
  tc$.where((v)=> v>3).interval(Duration(seconds: 2)).timeInterval().listen((v) => print("TimeInterval: $v"));
  // interval:  emits each item in the Stream after a given duration
  //timeInterval: records the time interval between the values
  tc$.interval(Duration(seconds: 1)).timeout((Duration(seconds: 5))).listen((v) => print("Timeout: $v")).onError(print);//gives a specified duration for the stream emit values
  tc$.timestamp().listen((v) => print("Timestamp: $v")); //gives the timestamp of the emmited values
  tc$.windowTime(Duration(seconds: 4)).flatMap((v) => v).listen((v) => print("WindowTime: $v"));//emits each item with a time frame
  Observable.timer("Example of timer", Duration(seconds: 4)).listen(print); // emits the given value after the specified durationTime
  tc$.map((v) => v * 2).delay(Duration(seconds: 3)).listen((v) => print("Delay: $v"));//delays the values emission
} 

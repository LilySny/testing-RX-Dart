import 'package:rxdart/rxdart.dart';

main() {
  var name$ = BehaviorSubject<Homem>();

  name$
      .distinct((a, b) => a.nome == b.nome ? true : false)
      .listen((e) => print("DADOS: ${e.nome}"));

  name$.add(Homem()..nome = "João");
  name$.add(Homem()..nome = "Carlos");
    name$.add(Homem()..nome = "João");

  // var lastName$ = BehaviorSubject<String>();
  // List<String> students = [
  //   "Ana",
  //   "Pedro",
  //   "Pedro",
  //   "Gustavo",
  //   "Camilla",
  //   "Camilla",
  //   "Vitória",
  // ];

  // name$.add("Ana");
  // name$.add("Beatriz");
  // name$.add("Jorge");
  // name$.add("Ana");
  // lastName$.add("Silva");
  // lastName$.add("Santiago");
  // lastName$.add("Camargo");
  // lastName$.add("Rodriguez");

  // Observable.fromIterable(students)
  //     .expand<String>((i) => [i])
  //     .distinct()
  //     .listen((i) => print("Expand Distinc: $i"));
  // Observable.merge([name$, lastName$])
  //     .distinct()
  //     .listen((i) => print("Distinc: $i"));
}

class Homem {
  String nome;
  String sobrenome;

  // @override
  // bool operator ==(other) => other is Homem && other.nome == nome;

  // int get hashCode => super.hashCode ^ nome.hashCode ^ sobrenome.hashCode;
}

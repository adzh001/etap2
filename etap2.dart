import 'dart:io';
import 'dart:math';

void main(List<String> args) {
  int min = 0;
  int max = 100;
  Gen gen = Gen(0, 0);
  //gen.random(max, min);
  //gen.binary(max, min);
  //gen.randomComp(max, min);
  //gen.compare();
  average();
}

class Gen {
  int binCount = 0;
  int randomCount = 0;

  Gen(this.binCount, this.randomCount);

  void random(int max, int min) {
    int a = min + Random().nextInt(max - min);
    String answ = "less";

    while (answ != "yes") {
      if (answ == "less") {
        max = a;
        min = min;
        a = min + Random().nextInt(max - min);
        print("Is it $a? \n");
        randomCount++;
        answ = stdin.readLineSync()!;
      } else if (answ == "greater") {
        min = a;
        max = max;
        a = min + Random().nextInt(max - min);
        print("Is it $a? \n");
        randomCount++;
        answ = stdin.readLineSync()!;
      }
    }
    print("Count of steps: $randomCount");
  }

//part 2
  void randomComp(int max, int min) {
    int randomNum = min + Random().nextInt(max - min);
    int answ = Random().nextInt(101);
    print('вы загадали $answ');

    while (randomNum != answ) {
      if (answ < randomNum) {
        max = randomNum;
        min = min;
        randomNum = min + Random().nextInt(max - min);
        print("Is it $randomNum? \n");
        randomCount++;
      } else if (answ > randomNum) {
        min = randomNum;
        max = max;
        randomNum = min + Random().nextInt(max - min);
        print("Is it $randomNum? \n");
        randomCount++;
      }
    }
    print("Count of steps: $randomCount");
  }

//part 3;
//  int randomCounter = 5;
  void compare() {
    if (randomCount > binCount) {
      print("Random is faster");
    } else if (randomCount < binCount) {
      print("Binary is faster");
    } else {
      print("Both of them are equal");
    }
  }

//Этап 3;

  void binary(int max, int min) {
    int number = (max / 2).round();
    max = (max / 2).round();
    //number = (max / 2).round();
    int answ = Random().nextInt(101);
    print('binary вы загадали $answ');
    print("Is it $number? \n");
    binCount++;

    while (number != answ) {
      if (answ < number) {
        binCount++;
        max = number;
        min = min;
        number = (number - (number - min) / 2).round();
        print("Is it $number? \n");
      } else if (answ > number) {
        binCount++;
        min = number;
        max = max;
        number = (number + (max + number) / 2).round();
        print("Is it $number? \n");
      }
    }
    print("Count of steps: $binCount");
  }
}

void average() {
  List myList = [];
  int sum = 0;
  for (int i = 0; i < 100; i++) {
    myList.add(Random().nextInt(101));
  }
  for (int i = 0; i < 100; i++) {}
  print(myList);
}

void random(int myNum, int min, int max) {
  int a = min + Random().nextInt(max - min);
  if (a < myNum) {}
}

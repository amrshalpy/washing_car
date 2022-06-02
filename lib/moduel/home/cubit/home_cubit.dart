import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:washing/model/fatorah.dart';
import 'package:washing/moduel/home/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());
  static HomeCubit get(context) => BlocProvider.of(context);

  List<String> lists = ["مجانية", "مدفوعة"];
  String dropVal = 'مدفوعة';
  void onChanged(val) {
    dropVal = val;
    if (dropVal == 'مجانية') {
      isFree = true;
    }
    isFree = !isFree;
    emit(DropChanged());
  }

  bool isButton = false;
  void addItems() {
    isButton = !isButton;
    emit(ButtonChange());
  }

  int sizeCarPrice = 0;
  int radioVal = 1;

  void changevalue(int index) {
    radioVal = index;
    if (radioVal == 0) {
      sizeCarPrice = 12;
    } else if (radioVal == 1) {
      sizeCarPrice = 10;
    } else if (radioVal == 2) {
      sizeCarPrice = 12;
    }
    emit(RadioChanged());
  }

  // void changeRadio(value) {
  //   radioVal = value;
  //   if (value == 1) {
  //     radioVal = "ديانة";
  //   } else if (value == 2) {
  //     radioVal = "حجم صغير";
  //   } else if (value == 3) {
  //     radioVal = "حجم كبير";
  //   }

  //   emit(RadioChanged());
  // }

  int carKindPrice = 0;
  bool isKind = false;
  List<String> listsKind = ["بستم", "بودي", "لا يوجد"];
  String dropValKind = 'بستم';
  void onChangedKind(val) {
    isKind = !isKind;

    dropValKind = val;
    if (dropValKind == 'لايوجد') {
      isKind = true;
      carKindPrice = 0;
    } else if (dropValKind == "بودي") {
      isKind = false;

      carKindPrice = 4;
    } else if (dropValKind == "بستم") {
      isKind = false;

      carKindPrice = 6;
    }
    emit(DropChanged());
  }

  bool check = false;
  bool chekbox = false;
  void changeCheck(val) {
    check = val;
    emit(CheckChange());
  }

  void changeCheckBox(val) {
    chekbox = val;
    emit(CheckChange());
  }

  bool isFree = false;
  int servicesPrice = 0;
  List<String> services = [
    "غسيل زيادة",
    "غسيل ماكينه",
    "تشحيم",
    "تكبيس",
    "تلميع كفرات",
    "مسح زجاج",
    "تلميع سيارة",
    "تغيير زيت",
    "تغيير زيت مع فلتر",
    "ديزيل",
    "اخري"
  ];
  String servicesVal = 'غسيل ماكينه';
  void onChangedservices(val) {
    servicesVal = val;
    if (servicesVal == 'غسيل ماكينه') {
      servicesPrice = 10;
    } else if (servicesVal == "ديزيل") {
      servicesPrice = 12;
    } else if (servicesVal == "تشحيم") {
      servicesPrice = 20;
    } else if (servicesVal == "تكبيس") {
      servicesPrice = 14;
    } else if (servicesVal == "غسيل زيادة") {
      servicesPrice = 16;
    } else if (servicesVal == "تلميع كفرات") {
      servicesPrice = 7;
    } else if (servicesVal == "مسح زجاج") {
      servicesPrice = 4;
    } else if (servicesVal == "تغيير زيت") {
      servicesPrice = 8;
    } else if (servicesVal == "تغيير زيت مع فلتر") {
      servicesPrice = 13;
    } else if (servicesVal == "تلميع سيارة") {
      servicesPrice = 10;
    }
    emit(ServicesChanged());
  }

  get totalPriceServices => carKindPrice + servicesPrice + sizeCarPrice;
  get totalPriceServicesDisount =>
      (carKindPrice + servicesPrice + sizeCarPrice) - carKindPrice;
  late Database database;
  List<Map> tasks = [];
  // List<Map> done = [];
  // List<Map> archive = [];
  void createDatabase() {
    openDatabase('todo.db', version: 1, onCreate: (database, version) async {
      await database
          .execute(
              'CREATE TABLE clinic(id INTEGER PRIMARY KEY, carNumber TEXT,totalPriceServices INTEGER, discount INTEGER ,pay BOOL, recieve BOOL ,date TEXT, carKind TEXT, carSize TEXT,washingKind TEXT,count TEXT,countServices TEXT,status TEXT)')
          .then((value) {
        print('created table');
        emit(CreateTableSucsses());
      });
    }, onOpen: (database) {
      print('opened table');
    }).then((value) {
      database = value;
      getDatabse(database);
      emit(CreateTableSucsses());
    }).catchError((er) {
      print(er.toString());
      emit(CreateTableError());
    });
  }

  Future insertDatabse({
    required String carNumber,
    required int totalPriceServices,
    required int discount,
    required bool pay,
    required bool recieve,
    required String date,
    required String carKind,
    required String count,
    required String carSize,
    required String washingKind,
    required String countServices,
  }) async {
    return await database.transaction((txn) async {
      return txn.rawInsert(
          'INSERT INTO clinic(carNumber,discount,totalPriceServices,pay,recieve, date, carKind,carSize,washingKind,count,countServices,status)VALUES("$carNumber","$discount","$totalPriceServices","$pay","$recieve","$date","$carKind","$carSize","$washingKind","$count","$countServices","new")');
    }).then((value) {
      print('insert$value tasks');
      getDatabse(database);
      emit(InsertTableSucsses());
    }).catchError((er) {
      print(er.toString());
      emit(InsertTableError());
    });
  }

  void getDatabse(database) {
    tasks = [];
    // done = [];
    // archive = [];
    database.query('clinic', orderBy: ('id DESC')).then((value) {
      tasks = value;
      emit(GetTableSucsses());

      // value.forEach((element) {
      //   if (element['status'] == 'new') {
      //     tasks.add(element);
      //   } else if (element['status'] == 'done') {
      //     done.add(element);
      //   } else {
      //     archive.add(element);
      //   }
      //   emit(GetTableSucsses());
      // });
    }).catchError((er) {
      print(er.toString());
      emit(GetTableError());
    });
  }

  void updateDatabse({
    required String status,
    required int id,
  }) {
    database.rawUpdate('UPDATE clinic SET status = ? WHERE id = ?',
        ['$status', id]).then((value) {
      print(value);
      getDatabse(database);
      emit(UpdateTableSucsses());
    }).catchError((er) {
      print(er.toString());
      emit(UpdateTableError());
    });
  }

  String name = "السلام";

  // void logout() {
  //   FirebaseAuth.instance.signOut().then((value) {
  //     emit(LogOutUser());
  //   }).catchError((er) {
  //     print(er.toString());
  //   });
  // }

  void deleteallNotes() {
    database.delete('clinic').then((value) {
      emit(DeleteTableSucsses());
      getDatabse(database);
    }).catchError((er) {
      print(er.toString());
    });
  }

  void deleteDatabase({required int id}) {
    database.rawDelete('DELETE FROM clinic WHERE id = ?', [id]).then((value) {
      getDatabse(database);

      emit(DeleteTableSucsses());
    }).catchError((er) {
      emit(DeleteTableError());

      print(er.toString());
    });
  }

  var searching = [];
  void searchNote(String items) async {
    searching = await database.rawQuery(
        "SELECT * FROM clinic WHERE carNumber LIKE '%${items}%' OR  carKind LIKE '%${items}%'");
    print(searching);
    emit(FilterSearchSucses());
  }

  List<Map> filteredTasks = [];
  void filterSearch(String minDate, String maxDate) async {
    emit(FilterSearchLoading());
    await database.rawQuery(
        '''SELECT * FROM clinic WHERE date BETWEEN '$minDate' AND '$maxDate' ''').then((value) {
      filteredTasks = value;
      emit(FilterSearchSucses());
    }).catchError((er) {
      print(er.toString());
    });
  }

  List<Map> items = [];
  void addNote(int id) {
    items = [];
    items.add(tasks.firstWhere((element) => element['id'] == id));
    emit(AddNotes());
  }

  var notesMap = {};
  void increaseNotes(Washing washing) {
    if (notesMap.containsKey(washing)) {
      notesMap[washing] += 1;
    } else {
      notesMap[washing] = 1;
    }
  }

  void decreaseNotes(Washing washing) {
    if (notesMap.containsKey(washing) && notesMap[washing] >= 1) {
      notesMap.removeWhere((key, value) => key == washing);
    } else {
      notesMap[washing] -= 1;
    }
  }

  void removeNotes(Washing washing) {
    notesMap.removeWhere((key, value) => key == washing);
  }

  get price {
    return notesMap.entries.map((e) => e.key[''] * e.key['']).toList();
  }

  get totalPrice {
    return notesMap.entries
        .map((e) => e.key[''] * e.key[''])
        .toList()
        .reduce((value, element) => value + element);
  }

  List get count {
    return notesMap.entries
        .map((e) => e.value)
        .toList()
        .reduce((value, element) => value + element);
  }

  String dir = Directory.current.path;

  void createPrint() {
    Process.run('$dir/images/installerX64/install.exe', [' start '])
        .then((ProcessResult results) {
      print("port poen");
    });
    emit(CreatePrint());
  }

  }
  // List<Fatorah> items = [];
  // dynamic price = 0;
  // void add(Fatorah item) {
  //   items.add(item);
  //   price += item.name;
  // }

  // void remove(Fatorah item) {
  //   items.remove(item);
  //   price -= item.name;
  // }

  // int get count {
  //   return items.length;
  // }

  // dynamic get totalPrice {
  //   return price;
  // }

  // List<Fatorah> get listCount {
  //   return items;
  // }


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testing_project/Utils/seure_page_storage.dart';
import 'package:testing_project/Widgets/birthday_widget.dart';
import 'package:testing_project/Widgets/button.dart';
import 'package:testing_project/Widgets/pets_button.dart';
import 'package:testing_project/Widgets/title.dart';
import 'package:encrypt/encrypt.dart';
import 'dart:io';
import 'package:encrypt/encrypt.dart';
import 'package:pointycastle/asymmetric/api.dart';
import 'package:testing_project/code.dart';
import 'package:intl/intl.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final formKey = GlobalKey<FormState>();
  final controllerName = TextEditingController();
  DateTime? birthday = DateTime.now();
  List<String> pets = [];


  @override
  void initState() {
    super.initState();

    init();
  }

  Future init() async {
    final name = await UserSecureStorage.getUsername() ?? '';
    final birthday = await UserSecureStorage.getBirthday();
    final pets = await UserSecureStorage.getPets() ?? [];

    setState(() {
      this.controllerName.text = name;
      this.birthday = birthday;
      this.pets = pets;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: ListView(
        padding: EdgeInsets.all(16),
        children: [
          TitleWidget(icon: Icons.lock, text: 'Secure\nStorage'),
          const SizedBox(height: 32),
          buildName(),
          const SizedBox(height: 12),
          buildBirthday(),
          const SizedBox(height: 12),
          // buildPets(),
           const SizedBox(height: 32),
          buildButton(),
        ],
      ),
    ),
  );

  Widget buildName() => buildTitle(
    title: 'Name',
    child: TextFormField(
      controller: controllerName,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Your Name',
      ),
    ),
  );

  Widget buildBirthday() => buildTitle(
    title: 'Birthday',
    child: BirthdayWidget(
      birthday: birthday,
      onChangedBirthday: (birthday) =>
          setState(() => this.birthday = birthday),
    ),
  );

  // Widget buildPets() => buildTitle(
  //   title: 'Pets',
  //   child: PetsButtonsWidget(
  //     pets: pets,
  //     onSelectedPet: (pet) => setState(
  //             () => pets.contains(pet) ? pets.remove(pet) : pets.add(pet)),
  //   ),
  // );

  Widget buildButton() => ButtonWidget(
      text: 'Save',
      onClicked: () async {
        await UserSecureStorage.setUsername(controllerName.text);
        await UserSecureStorage.setPets(pets);

        if (birthday != null) {
          await UserSecureStorage.setBirthday(birthday!);
        }

        final DateFormat formatter = DateFormat('yyyy-MM-dd');
        var formatted = formatter.format(birthday!);


        main();


      });

  Widget buildTitle({
    required String title,
    required Widget child,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 8),
          child,
        ],
      );
}
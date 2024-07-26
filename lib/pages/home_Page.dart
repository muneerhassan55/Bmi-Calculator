import 'dart:math';

import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedGender = 0, _height = 170, _age = 23, _weight = 65;
  double _bmi = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI Calculator'),
      ),
      body: _buildUI(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _bmi = _weight / pow(_height / 100, 2);
          });
        },
        child: Icon(Icons.calculate),
      ),
    );
  }

  Widget _buildUI() {
    return Column(
      children: [
        _genderSelector(),
        _heightInput(),
        _weightAndAgeInputRow(),
        _bmiResult()
      ],
    );
  }

  Widget _genderSelector() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              IconButton(
                  color: _selectedGender == 0
                      ? Theme.of(context).colorScheme.primary
                      : Colors.black,
                  iconSize: 60,
                  onPressed: () {
                    setState(() {
                      _selectedGender = 0;
                    });
                  },
                  icon: Icon(Icons.male)),
              Text(
                'Male',
                style: TextStyle(fontSize: 25),
              )
            ],
          ),
          Column(
            children: [
              IconButton(
                  color: _selectedGender == 1
                      ? Theme.of(context).colorScheme.primary
                      : Colors.black,
                  iconSize: 60,
                  onPressed: () {
                    setState(() {
                      _selectedGender = 1;
                    });
                  },
                  icon: Icon(Icons.female)),
              Text(
                'Female',
                style: TextStyle(fontSize: 25),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _heightInput() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Text(
            'Height',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Slider(
              min: 0,
              max: 300,
              divisions: 300,
              value: _height.toDouble(),
              onChanged: (value) {
                setState(() {
                  _height = value.toInt();
                });
              }),
          Text(
            '$_height cm',
            style: TextStyle(
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }

  Widget _weightAndAgeInputRow() {
    return Row(
      children: [_widgetInput(), _ageInput()],
    );
  }

  Widget _widgetInput() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Text(
            'Weight',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          ItemCount(
              buttonSizeHeight: 30,
              buttonSizeWidth: 60,
              initialValue: _weight,
              minValue: 40,
              maxValue: 350,
              onChanged: (value) {
                setState(() {
                  _weight = value.toInt();
                });
              },
              decimalPlaces: 0),
        ],
      ),
    );
  }

  Widget _ageInput() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Text(
            'Age',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          ItemCount(
              buttonSizeHeight: 30,
              buttonSizeWidth: 60,
              initialValue: _age,
              minValue: 1,
              maxValue: 100,
              onChanged: (value) {
                setState(() {
                  _age = value.toInt();
                });
              },
              decimalPlaces: 0),
        ],
      ),
    );
  }

  Widget _bmiResult() {
    return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Text(
          'BMI: ${_bmi.toStringAsFixed(1)} kg/m^2',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ));
  }
}

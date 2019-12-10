import 'package:flutter/material.dart';

import 'package:care_app/ui/components/my_text_form_field.dart';


class GasolinePage extends StatefulWidget {
  const GasolinePage({Key key}) : super(key: key);

  @override
  _GasolinePageState createState() => _GasolinePageState();

  static const String ID = 'gasolinePage';
}

class _GasolinePageState extends State<GasolinePage> {
  final TextEditingController _type = TextEditingController();
  final TextEditingController _value = TextEditingController();
  final TextEditingController _date = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _address = TextEditingController();

  bool isEco = false;
  bool isSuper = false;
  bool isDiesel = false;
  bool isCash = false;
  bool isCard = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'NUEVO GASTO',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 30.0),
        children: <Widget>[
          const Text('Tipo'),
          MyTextFormField(
              controller: _type,
              capitalization: TextCapitalization.words,
              textInputType: TextInputType.text,
              label: 'Gasolina',
              icon: Icons.local_gas_station,
              errorMsg: 'Ingresa tipo de Gasolina'),
          MyTextFormField(
              controller: _value,
              capitalization: TextCapitalization.none,
              textInputType: TextInputType.number,
              label: 'Precio',
              icon: Icons.attach_money,
              errorMsg: 'Ingresa valor de compra'),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Checkbox(
                        value: isEco,
                        onChanged: (bool value) {
                          setState(() {
                            isEco = value;
                          });
                        },),
                      const Text('Eco'),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Checkbox(
                        value: isSuper,
                        onChanged: (bool value) {
                          setState(() {
                            isSuper = value;
                          });
                        },),
                      const Text('Super'),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Checkbox(
                        value: isDiesel,
                        onChanged: (bool value) {
                          setState(() {
                            isDiesel = value;
                          });
                        },),
                      const Text('Diesel'),
                    ],
                  ),
                ],
              ),
          const SizedBox(height: 20,),
          const Text('Forma de Pago'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Checkbox(
                    value: isCash,
                    onChanged: (bool value) {
                      setState(() {
                        isCash = value;
                      });
                    },),
                  const Text('Efectivo'),
                ],
              ),
              Column(
                children: <Widget>[
                  Checkbox(
                    value: isCard,
                    onChanged: (bool value) {
                      setState(() {
                        isCard = value;
                      });
                    },),
                  const Text('Tarjeta'),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20,),
          MyTextFormField(
              controller: _date,
              capitalization: TextCapitalization.none,
              textInputType: TextInputType.datetime,
              label: 'Fecha',
              icon: Icons.date_range,
              errorMsg: 'Ingresa la fecha de compra'),
          MyTextFormField(
              controller: _name,
              capitalization: TextCapitalization.words,
              textInputType: TextInputType.text,
              label: 'Nombre',
              icon: Icons.text_fields,
              errorMsg: 'Ingresa nombre del local'),
          MyTextFormField(
              controller: _address,
              capitalization: TextCapitalization.words,
              textInputType: TextInputType.text,
              label: 'Dirección',
              icon: Icons.map,
              errorMsg: 'Ingresa la dirección del local'),
            ],

          ),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromRGBO(203, 99, 51, 1),
        child: MaterialButton(
          onPressed: () {

          },
          child: const Text(
            'Registrar',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

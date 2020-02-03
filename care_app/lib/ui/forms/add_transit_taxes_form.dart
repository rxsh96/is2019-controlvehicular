import 'package:care_app/ui/components/my_text_form_field.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart' show CalendarCarousel;


class AddTransitTaxesForm extends StatefulWidget {
  @override
  _AddTransitTaxesFormState createState() => _AddTransitTaxesFormState();
}

class _AddTransitTaxesFormState extends State<AddTransitTaxesForm> {

    final TextEditingController _controller = TextEditingController();
    final List<String> _agency = <String>[ 'ATM', 'CTE'];
    bool flag = true;
    DateTime _currentDate;


Widget calendar() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 16.0),
    child: CalendarCarousel<Event>(
      onDayPressed: (DateTime date, List<Event> events) {
        setState(() => _currentDate = date);
        //enviar al api solo con _currentDate
        print('$_currentDate  ${_currentDate.day} ${_currentDate.month} ${_currentDate.year}');
      },
      weekendTextStyle: const TextStyle(
        color: Color.fromRGBO(203, 99, 51, 1),
      ),
      thisMonthDayBorderColor: Colors.grey,
      weekFormat: false,
      //markedDatesMap: _markedDateMap,
      height: 350.0,
      selectedDateTime: _currentDate,
      daysHaveCircularBorder: true,
      selectedDayButtonColor: const Color.fromRGBO(203, 99, 51, 1),
      locale: 'es',
      todayTextStyle: TextStyle(
        color: Colors.white,
      ),
      todayButtonColor: Colors.black,
      headerTextStyle: TextStyle(color: Colors.black),
    ),
  );
}
  

void _buttonPressed(){
  setState(() {
    flag= false;   
  });
}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          MyTextFormField(
              controller: _controller,
              capitalization: TextCapitalization.words,
              textInputType: TextInputType.text,
              label: 'Motivo',
              icon: Icons.power_input,
              errorMsg: 'Ingrese su motivo',
          ),
          const SizedBox(height: 10.0,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text('Fecha de emisión'),
              const SizedBox(height: 10.0,),
              IconButton(
                alignment: Alignment.topLeft,
                icon: Icon(Icons.calendar_today),
                onPressed: (){
                  _buttonPressed();              
                },
              ),
            ],
          ),
          Offstage(
            offstage: flag,
            child: calendar(),
          ),          
          const SizedBox(height: 10.0,),
          MyTextFormField(

              controller: _controller,
              capitalization: TextCapitalization.words,
              textInputType: TextInputType.number,
              label: 'Valor a pagar',
              icon: Icons.monetization_on,
              errorMsg: 'Ingrese sus datos',
            ),
            const SizedBox(height: 10.0,),
            MyTextFormField(
              controller: _controller,
              capitalization: TextCapitalization.words,
              textInputType: TextInputType.text,
              label: 'Lugar',
              icon: Icons.place,
              errorMsg: 'Ingrese sus datos',
            ),
            const SizedBox(height: 25.0,),
            DropDownField(
                  value: 'Ingresa la agencia ',
                  itemsVisibleInDropdown: 2,
                  //icon: Icon(Icons.directions_car),
                  labelText: 'Marca',
                  items: _agency,
                  strict: false,
                  onValueChanged: (dynamic value) {
                    
                  },
            ),
            const SizedBox(height: 25.0,),

        ],
      ),
    );
  }
}
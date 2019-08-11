import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';



class VehiculosPage extends StatefulWidget {
  VehiculosPage() : super();

  static final String routeName = 'vehiculos';

  @override
  _VehiculosPageState createState() => _VehiculosPageState();
}


class Vehiculos {
  int id;
  String name;
 
  Vehiculos(this.id, this.name);
 
  static List<Vehiculos> getVehiculos() {
    return <Vehiculos>[
      Vehiculos(1, 'Ford'),
      Vehiculos(2, 'Chevrolet'),
      Vehiculos(3, 'Kia'),
      Vehiculos(4, 'Korando'),
      Vehiculos(5, 'Mercedes'),
    ];
  }
}


class _VehiculosPageState extends State<VehiculosPage> {
  List<Vehiculos> _vehiculos = Vehiculos.getVehiculos();
  List<DropdownMenuItem<Vehiculos>> _dropdownMenuItems;
  Vehiculos _selectedVehiculos;

  @override
  void initState() {
  _dropdownMenuItems = buildDropdownMenuItems(_vehiculos);
  _selectedVehiculos = _dropdownMenuItems[0].value;
  super.initState();
}

List<DropdownMenuItem<Vehiculos>> buildDropdownMenuItems(List vehiculos) {
  List<DropdownMenuItem<Vehiculos>> items = List();
  for (Vehiculos vehiculo in vehiculos) {
    items.add(
      DropdownMenuItem(
        value: vehiculo,
        child: Text(vehiculo.name),
      ),
    );
  }
  return items;
}

onChangeDropdownItem(Vehiculos selectedVehiculos) {
  setState(() {
    _selectedVehiculos = _selectedVehiculos;
  });
}

@override
Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MIS VEHICULOS" , style: TextStyle(fontSize: 17)),
        actions: <Widget>[
          //Esto puede reducirse
          IconButton(
            icon: Icon(Icons.add),
            color: Color.fromRGBO(203, 99, 51, 1),
            onPressed: (){
              Navigator.pushNamed(context, '/agregarVehiculos');
            },
          ),
          IconButton(
            icon: Icon(Icons.note_add),
            color: Color.fromRGBO(203, 99, 51, 1),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.event_note),
            color: Color.fromRGBO(203, 99, 51, 1),
            onPressed: (){},
          ),
        ],
      ),
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              //Text("Selecciona tu vehículo"),
              Center(
                child: DropdownButton(
                              
                  value: _selectedVehiculos,
                  items: _dropdownMenuItems,
                  onChanged: onChangeDropdownItem,
                ),
              ),

              //Text('Tu vehículo: ${_selectedVehiculos.name}'),
              
              Container(
                child: _imagenesAuto()
              ),

              Row(
                children: <Widget>[
                  SizedBox(width : 15),
                  Text("Tipo de registro:" ),
                  SizedBox(width : 20 , height: 40),
                  Center(
                    child: DropdownButton(                               
                      value: _selectedVehiculos,
                      items: _dropdownMenuItems,
                      onChanged: onChangeDropdownItem,
                    ),
                  ),
                ],
              ),
              SizedBox( height: 20.0 ),
              _crearFranjas("FILTROS" , 1),
              SizedBox( height: 8.0 ),
              _crearFranjas("FRENOS" , 0.85),
              SizedBox( height: 8.0 ),
              _crearFranjas("LUCES" , 0.7)
            ],
          ),
        ),
      ),
      drawer: _crearMenu()
    );
  
  }

  Widget _crearMenu(){
    return Drawer(
      child: Container(
        color: Color.fromRGBO(32, 32, 32, 1),
        child: ListView(       
          children: <Widget>[          
            //Container(color: Color.fromRGBO(32, 32, 32, 1)),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: CircleAvatar(
                    //backgroundImage: NetworkImage(''),
                      backgroundColor: Colors.grey,
                      child: Text('User'),
                      radius: 40.0,
                      
                    ),
                  ),
                  Text('NOMBRE USUARIO', 
                    style: TextStyle(fontWeight: FontWeight.bold , color: Color.fromRGBO(203, 99, 51, 1) , fontSize: 16 )
                  )
                ],
              )
            ) ,

            Divider(color: Colors.grey),

            _crearLista('Locales'),
            _crearLista('Viajes'),
            _crearLista('Notificaciones'),
            _crearLista('Encuesta'),
            _crearLista('Guía de mantenimiento'),
            _crearLista('Reporte de accidentes'),

            Divider(color: Colors.grey , height: 65.0),
            _crearLista('Configuración'),

            
          ],
        ),
      ),
    );
  }


  Widget _crearLista( String listaNombre){

    return ListTile(
              leading: Icon(Icons.pages , color: Color.fromRGBO(203, 99, 51, 1) ),
              title: Text(listaNombre , style: TextStyle(color: Colors.white , fontSize: 20 ) ),
              onTap: (){},
              
    );
  }


  Widget _crearFranjas( String mantenimiento , double transparencia ){
    return BottomAppBar(
      color: Color.fromRGBO(203, 99, 51, transparencia),
      child: Row(
        children: <Widget>[
          
          MaterialButton(
              //Para hacer el ruteo
              onPressed: () {
                Navigator.pushNamed(context, '/vehiculos');
              },
              
              child: Text(
                mantenimiento,
                textAlign: TextAlign.center,
                style: TextStyle(
                color: Colors.white,
                ),        
              ), 
              ),

            SizedBox( height: 85.0 ,width : 165),
            //Icon(Icons.airline_seat_flat_angled),
            Image(
              image: AssetImage('images/filtro.png'),
              height: 60,
              alignment: Alignment.bottomRight
            )
          
        ],
      ),
      );
  }



  Widget _imagenesAuto(){
      return Image(

        image: NetworkImage('https://www.expoknews.com/wp-content/uploads/2017/09/El-automo%CC%81vil-Prius-se-corona-en-el-mercado-verde-de-Me%CC%81xico2-1024x470.jpg')
      );
  }
}



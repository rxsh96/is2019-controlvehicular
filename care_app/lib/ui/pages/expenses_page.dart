import 'package:flutter/material.dart';

class ExpensesPage extends StatelessWidget {

  static const String ID = 'expensesPage';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ListView(
        children: <Widget>[
          _tablaGastos()
        ],
      ) ,
      floatingActionButton: FloatingActionButton(
        child: Image.asset('images/boton_agregar.png'),
        onPressed: (){ },
      ),
    );
  }



  Widget _tablaGastos(){
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: DataTable(
        rows: [
          DataRow(
            cells: [
              DataCell(Text('Stev')),
              DataCell(Text('Stev')),

            ],
          ),
          DataRow(
            cells: [
              DataCell(Text("Ho")),
              DataCell(Text("Ho")),

            ],
          ),
          DataRow(
            cells: [
              DataCell(Text("Hola")),
              DataCell(Text("Hola")),

            ],
          ),
        ],
        columns: [
          DataColumn(
            label: Text("TOTAL GASTOS"),
          ),
          DataColumn(
            label: Text("Valor total"),
          ),

        ],
      ),
    );
  }
}
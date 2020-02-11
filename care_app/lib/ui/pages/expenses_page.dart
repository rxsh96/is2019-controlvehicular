import 'package:flutter/material.dart';

class ExpensesPage extends StatefulWidget {

  static const String ID = 'expensesPage';

  @override
  _ExpensesPageState createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  final TextEditingController _expenseTypeController = TextEditingController();
  final TextEditingController _expenseController = TextEditingController();
  String controllerFirstCell = '';
  String controllerSecondCell = '';
  final List<DataRow> _rowList = <DataRow>[
    const DataRow(cells: <DataCell>[
      DataCell(Text('')),
      DataCell(Text('')),
    ]),
  ];

  @override
  void dispose() {
    _expenseTypeController.dispose();
    _expenseController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  'Mi Viaje',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Image.asset(
                'images/logo2.png',
                fit: BoxFit.contain,
                height: 32,
              ),
            ],
          ),
        ),
        body: ListView(
          children: <Widget>[
            _expensesTable(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Image.asset('images/boton_agregar.png'),
          onPressed: () => createDialog(context),
        ),
      ),
    );
  }

  DataCell _getFirstData(String controllerCellTotal) {
    final DataCell first = DataCell(Text(controllerCellTotal));
    return first;
  }

  DataCell _getSecondData(String controllerCellTotalValue) {
    final DataCell second = DataCell(Text(controllerCellTotalValue));
    return second;
  }

  void _addRow(DataCell first, DataCell second) {
    setState(() {
      _rowList.add(DataRow(selected: true, cells: <DataCell>[first, second]));
    });
  }

  void cleanFields() {
    _expenseTypeController.text = _expenseController.text = '';
  }

  void createDialog(BuildContext context) {
    showDialog<AlertDialog>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Center(child: Text('Ingrese su nuevo gasto')),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: _expenseTypeController,
                  decoration: const InputDecoration(hintText: '¿En qué gastó?'),
                ),
                TextField(
                  controller: _expenseController,
                  decoration: const InputDecoration(hintText: '¿Cuánto gastó?'),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: const Text('Cancelar',
                    style: TextStyle(color: Colors.black)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: const Text('Agregar',
                    style: TextStyle(color: Colors.black)),
                onPressed: () {
                  setState(() {
                    //Una funcion que genere la row con los datos ingresados.
                    controllerFirstCell =
                        _expenseTypeController.text.toString();
                    controllerSecondCell = _expenseController.text.toString();
                    print(controllerFirstCell);

                    //_newDataRow( _getFirstData(controllerFirstCell),_getSecondData(controllerSecondCell));
                  });
                  _addRow(_getFirstData(controllerFirstCell),
                      _getSecondData(controllerSecondCell));
                  print('$_expenseController $_expenseTypeController');
                  Navigator.of(context).pop();
                  cleanFields();
                },
              )
            ],
          );
        });
  }

  Widget _expensesTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: DataTable(
          rows: _rowList,
          columns: const <DataColumn>[
            DataColumn(
              label: Text('Gasto'),
            ),
            DataColumn(
              label: Text('Valor Total'),
            ),
          ],
        ),
      ),
    );
  }
}

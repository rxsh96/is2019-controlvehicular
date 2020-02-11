import 'package:care_app/core/locator.dart';
import 'package:care_app/core/src/models/transit_tax_model.dart';
import 'package:care_app/core/src/provider/login_provider.dart';
import 'package:care_app/ui/pages/pages_files.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransitTaxesPage extends StatelessWidget {
  static const String ID = 'transitTaxPage';

  Widget makeGuideCard(TransitTaxModel model) {
    return Card(
      child: Center(
        child: Container(
          decoration:
          const BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
          child: makeListTile(model),
        ),
      ),
    );
  }

  Widget makeListTile(TransitTaxModel model) {
    return ListTile(
      contentPadding:
      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      trailing: Text(r'$'+model.value.toString(),
        style: const TextStyle(color: Colors.white, fontSize: 16),),
      leading: Container(
        padding: const EdgeInsets.only(right: 12.0),
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(width: 1.0, color: Colors.orange),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text(
              model.date.split('-')[0],
              style: const TextStyle(color: Colors.white, fontSize: 10),
            ),
            Text(
              model.date.split('-')[1],
              style: const TextStyle(color: Colors.white, fontSize: 10),
            ),
            Text(
              model.date.split('-')[2],
              style: const TextStyle(color: Colors.white, fontSize: 10),
            ),
          ],
        ),
      ),
      title: Text(
        model.reason,
        style: const TextStyle(
            color: Colors.white,
          fontWeight: FontWeight.bold
        ),
      ),
      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            model.address,
            style: const TextStyle(
                color: Colors.white,
              fontSize: 10,
            ),
          ),
          Text('Agente: ' +model.agent,
            style: const TextStyle(
                color: Colors.white,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
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
                  'Multas',
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
        body: ChangeNotifierProvider<LoginProvider>(
          create: (BuildContext context) => locator<LoginProvider>(),
          child: Consumer<LoginProvider>(
            builder: (BuildContext context, LoginProvider loginProvider,
                    Widget child) =>
                Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: FutureBuilder<List<TransitTaxModel>>(
                          future: loginProvider
                              .fetchTaxes(loginProvider.userRepository.user.id),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<TransitTaxModel>> snapshot) {
                            if (snapshot.connectionState == ConnectionState.done){
                              if (snapshot.data == null) {
                                return Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: const <Widget>[
                                      Text('Hubo un error. Inténtalo de nuevo más tarde.'),
                                    ],
                                  ),
                                );
                              }
                              if (snapshot.data.isEmpty) {
                                return const Center(
                                  child: Text('¡No tienes multas!'),
                                );
                              }
                              return ListView.builder(
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return makeGuideCard(snapshot.data[index]);
                                  });
                            }
                            else{
                              return const Center(
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Color.fromRGBO(203, 99, 51, 1),
                                  ),
                                ),
                              );
                            }
                          }),
                    ),
                  const SizedBox(height: 30.0),
                ]),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromRGBO(32, 32, 32, 1),
          child: const Image(
            image: AssetImage('images/agregar_auto.png'),
            height: 35,
          ),
          onPressed: () {
            Navigator.pushNamed(context, AddTransitTaxesPage.ID);
          },
        ),
      ),
    );
  }
}

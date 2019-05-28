import 'package:flutter/material.dart';

class BasicoPage extends StatelessWidget {
  final estiloTitulo = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  final estiloSubTitulo = TextStyle(fontSize: 18, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _crearImagen(),
            _crearTitulo(),
            _crearAcciones(),
            _crearTexto(),
            _crearTexto(),
          ],
        ),
      ),
    );
  }

  Widget _crearImagen() {
    return Container(
      width: double.infinity,
      child: Image(
        image: NetworkImage(
            'https://images.pexels.com/photos/414171/pexels-photo-414171.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
        height: 200,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _crearTitulo() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Lago con un puente', style: estiloTitulo),
                  SizedBox(height: 7),
                  Text('Un lago en Alemania', style: estiloSubTitulo),
                ],
              ),
            ),
            Icon(
              Icons.star,
              color: Colors.red,
              size: 30,
            ),
            Text(
              '41',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearAcciones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _accion(Icons.call, 'CALL'),
        _accion(Icons.near_me, 'ROUTE'),
        _accion(Icons.share, 'SHARE'),
      ],
    );
  }

  Widget _accion(IconData icon, String texto) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          color: Colors.blue,
          size: 40,
        ),
        SizedBox(height: 5),
        Text(
          texto,
          style: TextStyle(fontSize: 15, color: Colors.blue),
        ),
      ],
    );
  }

  Widget _crearTexto() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Text(
          'Lorem ipsum dolor sit amet consectetur adipiscing elit commodo tempus, condimentum enim sagittis dignissim sed tristique placerat fringilla elementum, felis tincidunt varius lectus hendrerit primis nulla pellentesque. Venenatis condimentum vulputate ut morbi arcu tortor taciti vestibulum gravida dapibus montes, potenti etiam blandit lectus viverra curae bibendum posuere inceptos tristique. Viverra volutpat risus egestas lobortis venenatis taciti tortor sem, leo orci ad fringilla curae cursus integer primis praesent, scelerisque mi class metus enim mus per. Porttitor conubia sed rhoncus convallis fusce justo aliquet lacinia turpis, augue nec diam nam ullamcorper pretium tempor platea, tristique lobortis netus senectus congue quisque parturient a.',
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}

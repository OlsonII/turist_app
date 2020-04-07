import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:turist_app/src/presentation/locations_page.dart';

class HomePageWeb extends StatefulWidget {
  HomePageWeb({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageWebState createState() => _HomePageWebState();
}

class _HomePageWebState extends State<HomePageWeb> {

  int _selectedIndex = 0;
  double _screenWidth = 0.0;
  double _screenHeight = 0.0;

  List<Widget> _lateralMenuButtons;

  List<Widget> _pages = [
    Container(),
    LocationPage(),
    Container(),
    Container(),
    Container(),
    Container()
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _lateralMenuButtons = [
      _buildLateralMenuButton('Inicio', 0, Colors.blue),
      _buildLateralMenuButton('Localidades', 1, Colors.blue),
      _buildLateralMenuButton('Sitios', 2, Colors.blue),
      _buildLateralMenuButton('Historias', 3, Colors.blue),
      _buildLateralMenuButton('Actividades', 4, Colors.blue),
      _buildLateralMenuButton('Eventos', 5, Colors.blue),
    ];
  }

  @override
  Widget build(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width;
    _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Row(
          children: <Widget>[
            _buildLateralMenu(),
            _buildContentPage()
          ],
        ),
    );

  }

  Expanded _buildContentPage() {
    return Expanded(
      child: Container (
        decoration: BoxDecoration(
            color: Colors.white
        ),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              width: double.infinity,
              child: Row(
                children: <Widget>[
                  RaisedButton(
                    child: Icon(Icons.search, color: Colors.blue),
                    color: Colors.white,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.white)
                    ),
                    onPressed: (){},
                  )
                ],
              ),
            ),
            Container(
              child: _pages[_selectedIndex],
            )
          ],
        ),
      ),
    );
  }

  void _changePage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Container _buildLateralMenu() {
    return Container(
      height: double.infinity,
      width: _screenWidth*0.15,
      decoration: BoxDecoration(
          color: Colors.blue
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(10.0),
                child: Text('TuristApp', style: TextStyle(fontSize: 27.0, color: Colors.white))
            ),
            Expanded(child: Container()),
            _lateralMenuButtons[0],
            _lateralMenuButtons[1],
            _lateralMenuButtons[2],
            _lateralMenuButtons[3],
            _lateralMenuButtons[4],
            _lateralMenuButtons[5],
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }

  _buildLateralMenuButton(String title, int index, Color color){
    return SizedBox(
      width: double.infinity,
      child: FlatButton(
        child: Text(title, style: TextStyle(color: Colors.white, fontSize: 17.0)),
        color: color,
        onPressed: () => _changePage(index),
      ),
    );
  }

}

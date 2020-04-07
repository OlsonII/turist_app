import 'package:flutter/material.dart';

class RegisterLocationForm extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final _deviceData = MediaQuery.of(context);
    final _screenHeight = _deviceData.size.height;
    final _screenWidth = _deviceData.size.width;

    return Scrollbar(
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(30.0))
          ),
          margin: EdgeInsets.all(20.0),
          child: _buildForm(),
        ),
      ),
    );
  }

  _buildForm(){
    return Form(
      autovalidate: false,
      child: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: Text('Registrar Localidad', style: TextStyle(color: Colors.black, fontSize: 22.0),),
              )
            ],
          ),
        ),
      ),
    );
  }
}

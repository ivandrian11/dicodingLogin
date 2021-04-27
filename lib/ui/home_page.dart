import 'package:dicoding_login/common/config.dart';
import 'package:dicoding_login/model/theme_model.dart';
import 'package:dicoding_login/widgets/menu_tile.dart';
import 'package:dicoding_login/widgets/reusable_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLight = true;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    Color _colorConfig = _isLight ? Colors.black : Colors.white;
    Color _buttonColorConfig = _isLight ? lightRedColor : lightBlueColor;

    AppBar _appBar = AppBar(
      iconTheme: IconThemeData(color: _colorConfig),
      leading: Switch(
        activeColor: lightRedColor,
        activeTrackColor: Colors.black,
        inactiveThumbColor: lightBlueColor,
        inactiveTrackColor: Colors.white,
        value: _isLight,
        onChanged: (value) {
          _isLight = value;
          Provider.of<ThemeModel>(context, listen: false).toggleMode(_isLight);
        },
      ),
    );

    Drawer _endDrawer = Drawer(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            MenuTile(title: 'Academy'),
            MenuTile(title: 'Challenge'),
            MenuTile(title: 'Event'),
            MenuTile(title: 'Job'),
            MenuTile(title: 'Developer'),
          ],
        ),
      ),
    );

    Column _textfields = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Email', style: headerTextStyle),
        TextField(
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintText: 'Alamat Email',
            border: OutlineInputBorder(),
            isDense: true,
          ),
        ),
        SizedBox(height: 16),
        Text('Password', style: headerTextStyle),
        TextField(
          obscureText: _obscureText,
          decoration: InputDecoration(
            isDense: true,
            hintText: 'Masukkan password',
            border: OutlineInputBorder(),
            suffixIcon: IconButton(
              icon:
                  Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                _obscureText = !_obscureText;
                setState(() {});
              },
            ),
          ),
        ),
      ],
    );

    Column _accountField = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Center(
          child: Image.asset('assets/illustration.png'),
        ),
        SizedBox(height: 16),
        _textfields,
        SizedBox(height: 8),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            'Lupa Password?',
            style: Theme.of(context)
                .textTheme
                .bodyText2
                ?.copyWith(decoration: TextDecoration.underline),
          ),
        ),
        SizedBox(height: 8),
        Center(
          child: ReusableButton(
            color: _buttonColorConfig,
            child: Text(
              'Masuk',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text('Atau masuk dengan', style: Theme.of(context).textTheme.bodyText2),
        SizedBox(height: 8),
        Row(
          children: <Widget>[
            ReusableButton(
              color: Colors.white,
              child: Image.network(
                'https://pngimg.com/uploads/google/google_PNG19644.png',
                width: 50,
              ),
            ),
            SizedBox(width: 16),
            ReusableButton(
              color: Colors.white,
              child: Image.network(
                'https://pngimg.com/uploads/facebook_logos/facebook_logos_PNG19749.png',
                width: 50,
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        RichText(
          text: TextSpan(
            text: 'Belum punya akun? Ayo ',
            style: Theme.of(context).textTheme.bodyText1,
            children: [
              TextSpan(
                text: 'Daftar',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Divider(color: _colorConfig),
        ),
        RichText(
          text: TextSpan(
            text: 'Dengan melakukan login, Anda setuju dengan ',
            style: Theme.of(context).textTheme.bodyText1,
            children: [
              TextSpan(
                text: 'syarat & ketentuan Dicoding',
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ],
          ),
        ),
      ],
    );

    return Scaffold(
      appBar: _appBar,
      endDrawer: _endDrawer,
      body: Theme(
        data: Theme.of(context).copyWith(primaryColor: _buttonColorConfig),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: _accountField,
          ),
        ),
      ),
    );
  }
}

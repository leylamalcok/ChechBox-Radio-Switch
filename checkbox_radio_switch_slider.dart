import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormElemanlari extends StatefulWidget {
  const FormElemanlari({Key? key}) : super(key: key);

  @override
  State<FormElemanlari> createState() => _FormElemanlariState();
}

class _FormElemanlariState extends State<FormElemanlari> {
  bool checkBoxState = false;
  String sehir = "";
  bool switchState = false;
  double sliderDeger = 10;
  String secilenRenk = "KIRMIZI";
  List<String> sehirler = ["ankara", "istanbul", "bolu", "antalya"];
  String secilensehir = "ankara";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add_circle),
      ),
      appBar: AppBar(
        title: Text("DİĞER FORM ELEMANLARI"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            //-----CHECKBOX-----
            CheckboxListTile(
              value: checkBoxState,
              onChanged: (secildi) {
                setState(() {
                  checkBoxState = secildi!;
                });
              },
              activeColor: Colors.purple,
              title: Text("Checkbox title"),
              subtitle: Text("Checkbox subtitle"),
              secondary: Icon(Icons.add),
              selected: false,
            ),
            //-----RADİO-----
            RadioListTile<String>(
              activeColor: Colors.purple,
              value: "Ankara",
              groupValue: sehir,
              onChanged: (deger) {
                setState(() {
                  sehir = deger!;
                  debugPrint("Seçilen Şehir : $deger");
                });
              },
              title: Text("Ankara"),
            ),
            RadioListTile<String>(
              activeColor: Colors.purple,
              value: "İstanbul",
              groupValue: sehir,
              onChanged: (deger) {
                setState(() {
                  sehir = deger!;
                  debugPrint("Seçilen Şehir : $deger");
                });
              },
              title: Text("İstanbul"),
            ),
            RadioListTile<String>(
              activeColor: Colors.purple,
              value: "Bolu",
              groupValue: sehir,
              onChanged: (deger) {
                setState(() {
                  sehir = deger!;
                  debugPrint("Seçilen Şehir : $deger");
                });
              },
              title: Text("Bolu"),
            ),
            //-----SWİTCH-----
            SwitchListTile.adaptive(
              value: switchState,
              onChanged: (deger) {
                setState(() {
                  switchState = deger;
                });
              },
              //activeColor: Colors.black,
              title: Text('Switch Title'),
              subtitle: Text("Switch subtitle"),
              secondary: Icon(Icons.abc),
            ),
            //-----SLİDER----
            Text("Değeri Sliderdan seçiniz"),
            Slider(
              value: sliderDeger,
              onChanged: (yeniDeger) {
                setState(() {
                  sliderDeger = yeniDeger;
                });
              },
              min: 10,
              max: 20,
              divisions: 100,
              label: sliderDeger.toString(),
            ),

            //******* DROP DOWN BUTTON ********
            DropdownButton<String>(
              items: [
                DropdownMenuItem<String>(
                  child: Row(
                    children: <Widget>[
                      Container(width: 12, height: 12, color: Colors.red),
                      Text("kırmızı"),
                    ],
                  ),
                  value: "kırmızı",
                ),
                DropdownMenuItem<String>(
                  child: Row(
                    children: [
                      Icon(Icons.reddit),
                      Text("mavi"),
                    ],
                  ),
                  value: "mavi",
                ),
                DropdownMenuItem<String>(
                  child: Row(
                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        color: Colors.green,
                        margin: const EdgeInsets.only(right: 5.0),
                      ),
                      Text("Yeşil"),
                    ],
                  ),
                  value: "Yeşil",
                ),
              ],
              onChanged: (secilen) {
                setState(() {
                  secilenRenk = secilen!;
                });
              },
              hint: Text("Seçiniz"),
              value: null,
            ),

            DropdownButton<String>(
              items: sehirler.map((oankisehir) {
                return DropdownMenuItem<String>(
                  child: Text(oankisehir),
                  value: oankisehir,
                );
              }).toList(),
              onChanged: (s) {
                setState(() {
                  secilensehir = s!;
                });
              },
              value: secilensehir,
            )
          ],
        ),
      ),
    );
  }
}

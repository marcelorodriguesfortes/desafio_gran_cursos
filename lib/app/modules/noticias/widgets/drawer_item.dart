import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget DrawerItem(String descricao, IconData icone, GestureTapCallback onTap){
  return Column(
    children: [
      ListTile(
          title: Text(descricao,
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                  color: Colors.black54,
                  letterSpacing: .5,
                  fontSize: 15,
                  fontStyle: FontStyle.normal
              ),
            ),
          ),
          leading: Icon(icone, size: 22,),
          onTap: onTap
      ),

      Padding(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
        child: Divider(
          color: Colors.black12,
          height: 0.1,
        ),
      ),
    ],
  );
}
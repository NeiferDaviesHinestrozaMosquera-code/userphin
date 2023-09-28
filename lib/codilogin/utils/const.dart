import 'package:flutter/material.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';

////INFORMACION
getAnimatedSnackbarInfo(String text ,BuildContext context){
 AnimatedSnackBar.material(text,
                          type: AnimatedSnackBarType.info,
                          mobileSnackBarPosition: MobileSnackBarPosition.bottom,
                          desktopSnackBarPosition:
                              DesktopSnackBarPosition.bottomLeft)
                      .show(context);
}

//ERROR
getAnimatedSnackbarError(String text ,BuildContext context){
 AnimatedSnackBar.material(
                    text,
                    type: AnimatedSnackBarType.error,
                    desktopSnackBarPosition: DesktopSnackBarPosition.topCenter,
                  ).show(context);
}

getAnimatedSnackbarSuccess(String text ,BuildContext context){
 AnimatedSnackBar.material(
                    text,
                    type: AnimatedSnackBarType.success,
                    mobileSnackBarPosition: MobileSnackBarPosition.bottom,
                    desktopSnackBarPosition: DesktopSnackBarPosition.topRight,
                  ).show(context);
}

getAnimatedSnackbarWarning(String text ,BuildContext context){
 AnimatedSnackBar.material(
                    text,
                    type: AnimatedSnackBarType.warning,
                  ).show(context);
}

///Cargando informacion 
showDownloading () {
  Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  Text("Cargando...."),
                ],
              ),
            );
}

class CardContainer extends StatelessWidget {
  final Widget child;

  const CardContainer({super.key, required this.child, required EdgeInsets padding});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
          padding: EdgeInsets.only(left:25 , right: 25, top:200 , bottom:200 ),
        //padding:  EdgeInsets.symmetric(horizontal: 26 , vertical: 1),
        child: Container(
          alignment: Alignment.centerLeft,
          width: double.infinity,
          padding: EdgeInsets.all(10),
          decoration: _createCardShape(),
          child: child,  ///DE LA LINEA SUPERIOR
        ),
      ),
    );
  }

  BoxDecoration _createCardShape() => BoxDecoration(
    
    color: Colors.white,
    borderRadius: BorderRadius.circular(20),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 15,
        offset: Offset(0,5), ///MOVIMIENTO DE LA SOMBRA
      )
    ]
  );
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ecommerce/core/resources/app_colors.dart';


class Alert {
  static void showLoading({required BuildContext context, required String message}){

    showDialog(context: context,
        barrierDismissible: false,
        builder: (context){
          return AlertDialog(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator( color:AppColors.primaryColor),
                SizedBox(width: 10,),
                Text(message,style: TextStyle(color: AppColors.primaryColor),)
              ],
            ),
          );
        }
    );
  }
  static void hideLoading({required BuildContext context}){
    Navigator.of(context).pop();
  }
  static void showAlert({required BuildContext context,String title='', required String content,String? firstbutton ,
    String? secondbutton,  Function? firstAction, Function? SecondAction }){
    List<Widget> actionList=[];
    if(firstbutton!=null){
      actionList.add(TextButton(onPressed: (){
        firstAction!=null ?firstAction.call():Navigator.of(context).pop();
      },child: Text(firstbutton,style: TextStyle(fontSize: 12,color: AppColors.primaryColor),),));
    }
    if(secondbutton!=null){
      actionList.add(TextButton(onPressed: (){
        SecondAction!=null? SecondAction.call():Navigator.of(context).pop();
      },child: Text(secondbutton,style: TextStyle(fontSize: 12,color: AppColors.primaryColor),),));
    }
    showDialog(
        context: context,
        builder: (context)=>AlertDialog(
            title:Text(title) ,
            content: Text(content),
            actions:actionList
        )
    );

  }
}




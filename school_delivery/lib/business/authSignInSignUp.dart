import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthSignInSignUp  {

 static Future signIn(BuildContext context,String email,String password) async {
    // await FirebaseAuth.instance.signInWithEmailAndPassword
    // (email: emailController.text.trim(),
    //   password: passwordController.text.trim());
   String message = '';
    try {
      UserCredential? userCredential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // handle successful login
      message = 'تم الدخول بنجاح${userCredential.user!.email}';
      // Show an error dialog
      showAlertDialog(context, message,"مرحبا");
      print("user in Sign In :${userCredential.user}");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // handle user not found
        message = 'لم يتم العثور على المستخدم الرجاء التاكد ومعاودة الدخول';
        print("Error : Invalid user not found");
        // Show an error dialog
        showAlertDialog(context, message,"خطأ");
        print(" خطأ:${e.code}");
      } else if (e.code == 'wrong-password') {
        // handle wrong password error
        message = ' حدث خطأ الرجاء التاكد من صحة كلمة المرور';
        print("Error : Invalid wrong password error");
        print("Wrong password : ${e.code}");
        showAlertDialog(context, message,"خطأ");
      } else {
        message = 'الرجاء معاودة المحاولة في وقت لاحق بسبب بطأ النت او الاتصال بقاعدة البيانات.';
        print("Error : An error occurred. Please try again later");
        showAlertDialog(context, message,"انتظار");
        return CircularProgressIndicator();
      }
    }
  }


static void showAlertDialog(BuildContext context, String message,String head) {
   // Create an AlertDialog
   AlertDialog alert = AlertDialog(
     title: Text("${head}"),
     content: Text(message),
     actions: [
       MaterialButton(
         child: Text("نعم"),
         onPressed: () {
           // Close the dialog
           Navigator.of(context).pop();
         },
       ),
     ],
   );

   // Show the dialog
   showDialog(
     context: context,
     builder: (BuildContext context) {
       return alert;
     },
   );
 }

static Future signUp(BuildContext context,String email,String password,String confirm) async{
   String message='';
   if(passwordConfirmed(password,confirm))
   {
     print("------------in create user---------");
     // انشاء مستخدم جديد في جدول التحقق الايميل وكلمة المرور فقط على فايربيس
     await FirebaseAuth.instance.createUserWithEmailAndPassword
       (email: email.trim(),
         password: email.trim());
     message="تم بنجاح انشاء مستخدم جديد";
     showAlertDialog(context, message,"مبروك");

   }else {
     message="لم تتطابق كلمتا المرور او لم تدخل كامل البيانات";
     showAlertDialog(context, message,"تحذير");
   }

 }

static bool passwordConfirmed(String password,String confirm){
   if(password.trim()==confirm.trim())
   {
     print("------------in true equal password the same ---------");

     return true;
   }else{
     print("------------in false equal password the same ---------");
     return false;
   }

   return true;
 }

}

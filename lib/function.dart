import 'package:shared_preferences/shared_preferences.dart';
Future<void>storedata(String name)async
{
SharedPreferences obj=await SharedPreferences.getInstance();
obj.setString("sname", name);

}
Future<String>retrievedata()async
{
SharedPreferences obj2=await SharedPreferences.getInstance();
var s=obj2.getString("sname")??"";
return s;

}
import 'package:shared_preferences/shared_preferences.dart';
Future<void>storeindex(String name)async
{
SharedPreferences obj=await SharedPreferences.getInstance();
obj.setString("index", name);

}
Future<String>retrieveindex()async
{
SharedPreferences obj2=await SharedPreferences.getInstance();
var s=obj2.getString("index")??"";
return s;

}
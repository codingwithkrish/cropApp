import 'package:http/http.dart ' as http;
Future<dynamic> getRequestServices(String uri)async{
  try{
    http.Response response =await  http.get(Uri.parse(uri));
    if(response.statusCode==200){
      return response.body;
    }else{
      throw Exception("Not Found");
    }
  }catch(e){
    throw Exception(e);
  }


}
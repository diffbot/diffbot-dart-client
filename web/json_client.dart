/***
 * @author: Anfal
 */
import 'dart:html';
import 'package:json_object/json_object.dart';
import 'dart:convert' as JSON;
import 'dart:core' as core;

void main() {
  querySelector("#load").onClick.listen(loadData);
}

void loadData(_) {
  print("Loading data");
  var masterURL = "http://api.diffbot.com/v2/article";
  var url = "http://www.diffbot.com/our-apis/article";
  var token = “DIFFBOT_TOKEN”;
  var fancyURL = masterURL+"?token="+token+"&url="+url;
  // call the web server asynchronously
  var request = HttpRequest.getString(fancyURL).then(onDataLoaded).catchError(JsonError);
}

onDataLoaded(responseText) {
  print(" Data Loaded");
  var jsonString = responseText;
  querySelector("#json_content").text = jsonString;   
}

void JsonError(Error){
  print(Error.toString());
}

/**
 * Override print() to have   
 */
void print(message) {
  core.print(message);
  querySelector("#log").innerHtml = querySelector("#log").innerHtml+message;
}
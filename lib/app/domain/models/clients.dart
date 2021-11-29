class Clients {
  String nameClients;
  String addressClients;
  String landlineClients;
  String phoneClients;
  String userClients;
  String passwordClients;

  Clients(
      {required this.nameClients,
      required this.addressClients,
      required this.landlineClients,
      required this.phoneClients,
      required this.userClients,
      required this.passwordClients});
}

const url =
    'https://script.google.com/macros/s/AKfycbxqEKrn1jj9UwC6Fhzl42Rl9zO-GsIdJ6ITu_FqsLBG38iFCcWL6U6_tL0C-73kRzB0LQ/exec?';

/* Future getLogin(user, pass) async {
  final response = await http.get(Uri.parse(url + '&acc=7&user=' + user + '&pass=' + pass));
  var validation ='';
  if (response.statusCode == 200) {
    var jsonData = jsonDecode(response.body);
    String temp = jsonData[1].toString();
    if (temp == 'n'){
      validation = 'true';
    } else if (temp == 'f'){
      validation = 'false';
    }
    //print(validation);
    return validation;
  } else {
    throw Exception('Falló el LogIn');
  }
} */
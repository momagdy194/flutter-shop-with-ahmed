
class LoginFaild implements Exception{
  @override
  String toString() {
    return'login failed please login';
  }
}


class RegisterException implements Exception {
  @override
  String toString() {
    return 'error register';
  }
}

class ResourceNotFound implements Exception{
  String NotFound;
  ResourceNotFound(this.NotFound);
  @override
  String toString() {
    return 'resourse not found';
  }
}


class RedurectionFound implements Exception{
  @override
  String toString() {
    return 'TOO MANY REDURCTION';
  }
}


class NoInterNetConnection implements Exception{
  @override
  String toString() {
    return 'noo Internet Connection available!!!!';
  }
}


class PropertyRequired implements Exception{
  String field;
  PropertyRequired(this.field);
  @override
  String toString() {
    return'proberty ${this.field} is Requerd';
  }
}
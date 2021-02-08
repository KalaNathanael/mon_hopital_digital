extension StringExtension on String {
  String capitalize(){
    if(this == "" || this == 'null') {
      return "- -";
    }else{
      return "${this[0].toUpperCase()}${this.substring(1)}";
    }
  }
}
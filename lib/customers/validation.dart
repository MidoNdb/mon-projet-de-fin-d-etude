import 'package:facturation/constants/messages.dart';

valid(String value , int min , int max){
          if (value.isEmpty) {
            return "$mEmpty";
          }
          else if (value.length < min) {
            return "$mMin $min";

          }
          if (value.length > max) {
            return "$mMax $max";
          }
        }
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';

import 'theme_settings.dart';

class AppSettings extends Equatable implements Insertable<AppSettings> {
  final bool isLaunchedFirstTime;
 
  const AppSettings({
     this.isLaunchedFirstTime = true,});
     
       @override
       List<Object?> get props => [isLaunchedFirstTime,];
     
       @override
       Map<String, Expression<Object>> toColumns(bool nullToAbsent) {
         // TODO: implement toColumns
         throw UnimplementedError();
       }

     
}

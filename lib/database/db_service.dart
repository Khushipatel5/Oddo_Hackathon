import 'package:oddo_hackathon_project/utils/import_export.dart';
class AppDatabase{
  Database? _database;

  Future<Database> initDatabase() async{
    if(_database != null){
      return _database!;
    }

    Directory directory = await getApplicationCacheDirectory();
    String path = join(directory.path , 'AppDatabase.db');

    _database = await openDatabase(path,
      version: 1,
      onCreate: (db, version) {
        db.execute(''' 
           CREATE TABLE $TBL_USERS_NAME (
              $COL_USER_ID INTEGER PRIMARY KEY AUTOINCREMENT,
              $COL_USER_NAME TEXT,
              $COL_USER_EMAIL TEXT,
              $COL_USER_BIO TEXT,
              $COL_USER_IS_PUBLIC BOOLEAN DEFAULT 1,
              $COL_USER_IMAGE_URL TEXT
            )
        ''');
        db.execute('''
          CREATE TABLE $TBL_SKILLS_NAME (
              $COL_SKILL_ID INTEGER PRIMARY KEY AUTOINCREMENT,
              $COL_SKILL_NAME TEXT,
              $COL_SKILL_CATAGORY TEXT
            )
        ''');

        db.execute('''
          CREATE TABLE $TBL_USER_SKILLS_OFFERED_NAME (
            $ID INTEGER PRIMARY KEY AUTOINCREMENT,
            $COL_USER_SKILL_OFFERED_USER_ID INTEGER,
            $COL_USER_SKILL_OFFERED_ID INTEGER,
            $COL_USER_SKILL_OFFERED_DESCRIPTION TEXT,
            FOREIGN KEY ($COL_USER_SKILL_OFFERED_USER_ID) REFERENCES $TBL_USERS_NAME($COL_USER_ID),
            FOREIGN KEY ($COL_USER_SKILL_OFFERED_ID) REFERENCES $TBL_SKILLS_NAME($COL_SKILL_ID)
          )
        ''');

        db.execute('''
              CREATE TABLE $TBL_USER_SKILLS_REQUESTED_NAME (
              $ID INTEGER PRIMARY KEY AUTOINCREMENT,
              $COL_USER_SKILL_REQUESTED_USER_ID INTEGER,
              $COL_USER_SKILL_REQUESTED_ID INTEGER,
              FOREIGN KEY ($COL_USER_SKILL_REQUESTED_USER_ID) REFERENCES $TBL_USERS_NAME($COL_USER_ID),
              FOREIGN KEY ($COL_USER_SKILL_REQUESTED_ID) REFERENCES $TBL_SKILLS_NAME($COL_SKILL_ID)
            )
        ''');

        db.execute('''
          CREATE TABLE $TBL_SWAP_REQUESTS_NAME (
            $COL_SWAP_ID INTEGER PRIMARY KEY AUTOINCREMENT,
            $COL_FROM_USER_ID INTEGER,
            $COL_TO_USER_ID INTEGER,
            $COL_OFFERED_SKILL_ID INTEGER,
            $COL_REQUESTED_SKILL_ID INTEGER,
            $COL_STATUS TEXT,
            FOREIGN KEY ($COL_FROM_USER_ID) REFERENCES $TBL_USERS_NAME($COL_USER_ID),
            FOREIGN KEY ($COL_TO_USER_ID) REFERENCES $TBL_USERS_NAME($COL_USER_ID),
            FOREIGN KEY ($COL_OFFERED_SKILL_ID) REFERENCES $TBL_SKILLS_NAME($COL_SKILL_ID),
            FOREIGN KEY ($COL_REQUESTED_SKILL_ID) REFERENCES $TBL_SKILLS_NAME($COL_SKILL_ID)
          )
        ''');
      },
    );

    return _database!;
  }


}
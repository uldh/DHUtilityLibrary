//
//  SQLiteHelper.m
//  WebCollector
//
//  Created by apple on 2018/12/16.
//  Copyright © 2018 apple. All rights reserved.
//

#import "SQLiteHelper.h"

static SQLiteHelper *sharedInstance = nil;

@interface SQLiteHelper()
{
    NSString *sqlVersion;
}
@end

@implementation SQLiteHelper
+ (instancetype)sharedHelper
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[SQLiteHelper alloc] initWithDatabaseNamed:@"WebCollector.db"];
        [sharedInstance openDatabase];
        [sharedInstance generateSql];
    });
    return sharedInstance;
}

- (void)generateSql
{
//    sqlVersion = @"2.31";
    /// 2.55 视频增加 articleId，和 type=1的文章
    sqlVersion = @"0.01";
    
    NSString *oldSqlVersion = [[[NSUserDefaults standardUserDefaults] objectForKey:@"SQL_VERSION"] stringValue];
    //coin beg and send
    [sharedInstance doQuery:@"CREATE TABLE IF NOT EXISTS receivecoins (id integer primary key autoincrement, uid text,fn text,status text, date text);"];
    
//    [sharedInstance doQuery:@"DROP TABLE IF EXISTS 'sendcoins'"];
    
//    [sharedInstance doQuery:@"CREATE TABLE IF NOT EXISTS sendcoins (id integer primary key autoincrement, uid text,time text);"];
    
    //[sharedInstance doQuery:@"CREATE TABLE IF NOT EXISTS sendcoins (id integer primary key autoincrement, uid text,time text);"];

//    [sharedInstance doQuery:@"CREATE TABLE IF NOT EXISTS sendcoins (id integer primary key autoincrement, uid text,fid text,time text);"];

//    if (oldSqlVersion < 1.0) { //加入以id区分不同用户。
    if ([oldSqlVersion compare:@"1.0" options:NSNumericSearch] == NSOrderedAscending) { //加入以id区分不同用户。
        [sharedInstance doQuery:@"DROP TABLE IF EXISTS 'sendcoins';"];
    }
    
    [sharedInstance doQuery:@"CREATE TABLE IF NOT EXISTS sendcoins (id integer primary key autoincrement, uid text,fid text,time text);"];

#pragma mark ---- 英雄之书数据
    //hero book ----- v 1.xx remove at v 2.0
    //[sharedInstance doQuery:@"CREATE TABLE IF NOT EXISTS hero (id integer primary key autoincrement, name text, download text"];
    //[sharedInstance doQuery:@"CREATE TABLE IF NOT EXISTS books (id integer primary key autoincrement,name text, version text);"];
    
    //new hero book ---add at v 2.0
//    [sharedInstance doQuery:@"CREATE TABLE IF NOT EXISTS heroes (id integer primary key autoincrement, name text, download text, version text DEFAULT '1.00');"];
    
    //heroes 添加天赋字段
    NSArray *old;
//    if (oldSqlVersion <= 2.2 ) {// update form 2.2
    if ([oldSqlVersion compare:@"2.2" options:NSNumericSearch] != NSOrderedDescending ) {// update form 2.2
        old = [sharedInstance queryTable:@"heroes"];
        [sharedInstance queryTable:@"DROP TABLE IF EXISTS 'heroes';"];
    }
   [sharedInstance doQuery:@"CREATE TABLE IF NOT EXISTS heroes (id integer primary key autoincrement, name text, download text DEFAULT '0',versionDownload text DEFAULT '0.00', version text DEFAULT '0.00', talentVDownload text DEFAULT '0.00',talentV DEFAULT '0.00');"];
    if (old && old.count > 0) {
        [sharedInstance insertIntoTable:@"heroes" withMutableParam:old];
    }
//    if ( (sqlVersion>oldSqlVersion) && [sharedInstance isTableExitsInDB:@"heroes"]) {
//        NSArray *old = [sharedInstance queryTable:@"heroes"];
//        [sharedInstance doQuery:@"DROP TABLE IF EXISTS 'heroes';"];
//
//        [sharedInstance doQuery:@"CREATE TABLE IF NOT EXISTS heroes (id integer primary key autoincrement, name text, download text DEFAULT '0',versionDownload text DEFAULT '0.00',, version text DEFAULT '1.00', talentVDownload text DEFAULT '0.00',talentV DEFAULT '1.00');"];
//
//        [sharedInstance insertIntoTable:@"heroes" withMutableParam:old];
//    }

    
    if ([sharedInstance isTableExitsInDB:@"hero"]) {
        [sharedInstance updateHeroes];
        [sharedInstance doQuery:@"DROP TABLE IF EXISTS 'hero';"];
        [sharedInstance doQuery:@"DROP TABLE IF EXISTS 'books';"];
    }

    
    //movie
    [sharedInstance doQuery:@"CREATE TABLE IF NOT EXISTS movie (id integer primary key autoincrement, mid text,title text, submit text,thumb text,flvUrl text,time text);"];
   
    
//        [sharedInstance doQuery:@"DROP TABLE IF EXISTS 'mymovie';"];
//        [sharedInstance doQuery:@"DROP TABLE IF EXISTS 'downloadmovie';"];
//        [sharedInstance doQuery:@"DROP TABLE IF EXISTS 'historymovie';"];
//        [sharedInstance doQuery:@"DROP TABLE IF EXISTS 'collectmovie';"];
    
#pragma mark - movie new ----
    NSArray *oldDownloads;
    NSArray *oldHistorys;
    NSArray *oldSaves;

    
    if ([oldSqlVersion compare:@"2.55" options:NSNumericSearch] != NSOrderedDescending ) {// update
        oldDownloads = [sharedInstance queryTable:@"downloadmovie"];
        [sharedInstance doQuery:@"DROP TABLE IF EXISTS 'downloadmovie';"];
        oldHistorys = [sharedInstance queryTable:@"historymovie"];
        [sharedInstance doQuery:@"DROP TABLE IF EXISTS 'historymovie';"];
        oldSaves = [sharedInstance queryTable:@"collectmovie"];
        [sharedInstance doQuery:@"DROP TABLE IF EXISTS 'collectmovie';"];
    }
    
    [sharedInstance doQuery:@"CREATE TABLE IF NOT EXISTS downloadmovie (id integer primary key autoincrement, mid text,title text, submit text,thumb text,flvUrl text,time text,category text,duration text DEFAULT '00:00:00', progress text DEFAULT '0.0',state text DEFAULT '0',description text, highVideoUrl text DEFAULT '', superVideoUrl text DEFAULT '', shareUrl text DEFAULT '', type text DEFAULT '',articleId text DEFAULT '');"];
    
    [sharedInstance doQuery:@"CREATE TABLE IF NOT EXISTS historymovie (id integer primary key autoincrement, mid text,title text, submit text,thumb text,flvUrl text,time text,category text,duration text DEFAULT '00:00:00',description text,highVideoUrl text DEFAULT '', superVideoUrl textDEFAULT '', shareUrl text DEFAULT '',type text DEFAULT '',articleId text DEFAULT '');"];
    
    [sharedInstance doQuery:@"CREATE TABLE IF NOT EXISTS collectmovie (id integer primary key autoincrement, mid text,title text, submit text,thumb text,flvUrl text,time text,category text,duration text DEFAULT '00:00:00',description text,highVideoUrl text DEFAULT '', superVideoUrl text DEFAULT '', shareUrl text DEFAULT '',type text DEFAULT '',articleId text DEFAULT '');"];
    
    if ([oldSqlVersion compare:@"2.55" options:NSNumericSearch] != NSOrderedDescending ) {// update
        [sharedInstance insertIntoTable:@"downloadmovie" withMutableParam:oldDownloads];
        [sharedInstance insertIntoTable:@"historymovie" withMutableParam:oldHistorys];
        [sharedInstance insertIntoTable:@"collectmovie" withMutableParam:oldSaves];
    }
    
    
    [sharedInstance doQuery:@"CREATE TABLE IF NOT EXISTS downloadmovie (id integer primary key autoincrement, mid text,title text, submit text,thumb text,flvUrl text,time text,category text,duration text DEFAULT '00:00:00', progress text DEFAULT '0.0',state text DEFAULT '0',description text, highVideoUrl text DEFAULT '', superVideoUrl text DEFAULT '', shareUrl text DEFAULT '');"];

    [sharedInstance doQuery:@"CREATE TABLE IF NOT EXISTS historymovie (id integer primary key autoincrement, mid text,title text, submit text,thumb text,flvUrl text,time text,category text,duration text DEFAULT '00:00:00',description text,highVideoUrl text DEFAULT '', superVideoUrl textDEFAULT '', shareUrl text DEFAULT '');"];

    [sharedInstance doQuery:@"CREATE TABLE IF NOT EXISTS collectmovie (id integer primary key autoincrement, mid text,title text, submit text,thumb text,flvUrl text,time text,category text,duration text DEFAULT '00:00:00',description text,highVideoUrl text DEFAULT '', superVideoUrl text DEFAULT '', shareUrl text DEFAULT '');"];
    


    [sharedInstance doQuery:@"CREATE TABLE IF NOT EXISTS mymovie (id integer primary key autoincrement, mid text, path text, status text, progress text DEFAULT '0.0',complete text DEFAULT '0' );"];
    
    //messages
    [sharedInstance doQuery:@"CREATE TABLE IF NOT EXISTS messages (id integer primary key autoincrement, senderID text, receiverID text, message text, time text, isreaded text);"];
    //systemmessage
    [sharedInstance doQuery:@"CREATE TABLE IF NOT EXISTS systemmessages (id integer primary key autoincrement, bk text, date text, idSystemMessage text, content text, push text, title text,isreaded text);"];
    
    //friends
//    [sharedInstance doQuery:@"CREATE TABLE IF NOT EXISTS friends (id integer primary key autoincrement, uid integer,name text,icon integer,gender integer,addr integer, btg text, sig text);"];

//    [sharedInstance doQuery:@"CREATE TABLE IF NOT EXISTS friends (id integer primary key autoincrement, uid text,name text,icon text,gender text,addr text, btg text, sig text,paras text, d3 text, hos text, hs text, sc2 text, wow text);"];
    
//add yunxinId at 2.2
//    if (oldSqlVersion <= 2.2) {
    if ([oldSqlVersion compare:@"2.2" options:NSNumericSearch] != NSOrderedDescending ) {// update form 2.2
        [sharedInstance doQuery:@"DROP TABLE IF EXISTS 'friends';"];
    }
    [sharedInstance doQuery:@"CREATE TABLE IF NOT EXISTS friends (id integer primary key autoincrement, uid text,name text,icon text,gender text,addr text, btg text, sig text,paras text, d3 text, hos text, hs text, sc2 text, wow text, yunxinid text);"];
    
    //person
    [sharedInstance doQuery:@"CREATE TABLE IF NOT EXISTS person (id integer primary key autoincrement, uid text, name text, icon text, gender text, btg text, sig text, addr text);"];
    
    //awards
    [sharedInstance doQuery:@"CREATE TABLE IF NOT EXISTS awards (id integer primary key autoincrement, category text, code text, get text, time text,type text,sdes text DEFAULT '');"];
    // user coin
//    if ([APP_VERSION floatValue] <= 1.0341) {
        NSMutableArray *array = [NSMutableArray arrayWithArray:[sharedInstance queryTable:@"awards"]];
        [sharedInstance doQuery:@"DROP TABLE IF EXISTS 'awards';"];
        [sharedInstance doQuery:@"CREATE TABLE IF NOT EXISTS awards (id integer primary key autoincrement, category text, code text, get text, time text,type text,sdes text DEFAULT '');"];
        [sharedInstance update:array table:@"awards"];
        
//    }

    [sharedInstance doQuery:@"CREATE TABLE IF NOT EXISTS coins (coin text DEFAULT '0');"];
    
    [sharedInstance resetCoin];
    

    // user Icon
    [sharedInstance doQuery:@"CREATE TABLE IF NOT EXISTS icons (num text);"];

    //coin beg and recieve
    [sharedInstance doQuery:@"CREATE TABLE IF NOT EXISTS coinscollection (sender text,time text);"];


//    [sharedInstance doQuery:@"DROP TABLE IF EXISTS 'recommendFriends';"];
//    [sharedInstance doQuery:@"DROP TABLE IF EXISTS 'requestFriends';"];
    
    [sharedInstance doQuery:@"CREATE TABLE IF NOT EXISTS recommendFriends (id integer primary key autoincrement, uid text, name text, icon text, gender text, btg text, sig text, addr text,paras text,status text, d3 text, hos text, hs text, sc2 text, wow text);"];

    [sharedInstance doQuery:@"CREATE TABLE IF NOT EXISTS requestFriends (id integer primary key autoincrement, uid text, name text, icon text, gender text, btg text, sig text, addr text,paras text,status text, d3 text, hos text, hs text, sc2 text, wow text);"];

    [sharedInstance doQuery:@"DROP TABLE IF EXISTS 'remoteno';"];
    [sharedInstance doQuery:@"CREATE TABLE IF NOT EXISTS remoteno (id integer primary key autoincrement,title text DEFAULT '00',url text DEFAULT '00', type text DEFAULT '0');"];
    
    //add map in 2.0
    [sharedInstance doQuery:@"CREATE TABLE IF NOT EXISTS maps (id integer primary key autoincrement, name text, version text DEFAULT '1.00',state text DEFAULT '0');"];
    
    [sharedInstance doQuery:@"CREATE TABLE IF NOT EXISTS mediaColumns (id integer primary key autoincrement, name text, latestPublishTime text DEFAULT '0000',columnAlias text DEFAULT '0',refreshTime text DEFAULT '0000');"];
    
    [sharedInstance doQuery:@"CREATE TABLE IF NOT EXISTS vodvisit (id integer primary key autoincrement,mid text DEFAULT '000000', total text DEFAULT '0',increase text DEFAULT '0',sync text DEFAULT '0');"];

    
    [sharedInstance doQuery:@"CREATE TABLE IF NOT EXISTS hosgroup (id integer primary key autoincrement,gid text,name text,owner text,num text,maxnum text,intro text,location text, longitude text,latitude text)"];
    
//    if (oldSqlVersion < 2.31) {
if ([oldSqlVersion compare:@"2.31" options:NSNumericSearch] == NSOrderedAscending) {// update form 2.2

        [self updateSQLForGroup];
    }
    

    [sharedInstance doQuery:@"CREATE TABLE IF NOT EXISTS mygroup (id integer primary key autoincrement,gid text)"];
    
    
    [[NSUserDefaults standardUserDefaults] setObject:sqlVersion forKey:@"SQL_VERSION"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)updateSQLForGroup {
    
    NSArray *oldGroups = [sharedInstance queryTable:@"hosgroup"];
    [sharedInstance doQuery:@"DROP TABLE IF EXISTS 'hosgroup';"];
    [sharedInstance doQuery:@"CREATE TABLE IF NOT EXISTS hosgroup (id integer primary key autoincrement,gid text,name text,owner text,maxnum text,num text,intro text,location text, longitude text,latitude text)"];
    [sharedInstance insertIntoTable:@"hosgroup" withMutableParam:oldGroups];
}

- (void)alterTable:(NSString *)table addColomn:(NSString *)columnName dataType:(NSString *)type defaultValue:(id)v
{
    NSString *addStr = [NSString stringWithFormat:@"alter table %@ add %@ %@ DEFAULT %@",table ,columnName, type,v];
    [sharedInstance doQuery:addStr];
}

- (void)updateHeroes
{
    NSArray *old = [sharedInstance queryTable:@"hero"];
    [sharedInstance insertIntoTable:@"heroes" withMutableParam:old];
//    [self dumpTable:@"heroes"];
}

- (void)update:(NSArray *)array table:(NSString *)tableName
{
    [self insertIntoTable:tableName withMutableParam:array];
}

- (BOOL)isTableExitsInDB:(NSString *)table
{
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM %@",table];
    NSError *error = [sharedInstance doQuery:sql];
    if (error) {
        return !(error.code==3);
    }
    return YES;
}

- (NSError *)createTable:(NSString *)table withParam:(NSString *)param
{
    NSString *sqlStr = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (id integer primary key autoincrement, %@);",table,param];
    NSError *error = [sharedInstance doQuery:sqlStr];
    return error;
}

- (NSArray *)queryTable:(NSString *)table
{
    return [self queryTable:table keyId:nil condition:nil orderBy:nil];
}

- (NSArray *)queryTable:(NSString *)table orderBy:(NSString *)orderKey Des:(BOOL)DES
{
    if (DES) {
        orderKey = [orderKey stringByAppendingString:@" DESC"];
    }else
    {
        orderKey = [orderKey stringByAppendingString:@" ACS"];
    }
    return [self queryTable:table keyId:nil condition:nil orderBy:orderKey];
}

- (NSArray *)queryTable:(NSString *)table keyId:(NSArray *)keys
{
    return [self queryTable:table keyId:keys condition:nil orderBy:nil];
}

- (NSArray *)queryTable:(NSString *)table condition:(NSDictionary *)condition
{
    return [self queryTable:table keyId:nil condition:condition orderBy:nil];
}



- (NSString *)valueInTable:(NSString *)table condition:(NSDictionary *)condition key:(NSString *)key
{
    NSArray *array = [self queryTable:table keyId:nil condition:condition orderBy:nil];
    if (!array || array.count <= 0) {
        return nil;
    }
    NSDictionary *reslut = [array objectAtIndex:0];
    return (NSString *)[reslut valueForKey:key];
}


- (NSArray *)queryTable:(NSString *)table keyId:(NSArray *)keys condition:(NSDictionary *)condition
{
    return [self queryTable:table keyId:keys condition:condition orderBy:nil];
}

- (NSString *)sqlStrFromDictionary:(NSDictionary *)dic
{
    NSArray *keys = [dic allKeys];
    NSMutableString *str = [NSMutableString string];
    for (NSString *key in keys) {
        NSString *value = [dic objectForKey:key];
        [str appendFormat:@"%@ = '%@'",key,value];
        if (![[keys lastObject] isEqual:key]) {
            [str appendString:@" AND "];
        }
    }
    return str;
}

- (NSArray *)queryTable:(NSString *)table keyId:(NSArray *)keys condition:(NSDictionary *)condition orderBy:(NSString *)order
{
    NSString *queryStr;
    NSString *keyStr ;
    if (keys) {
        keyStr = [keys componentsJoinedByString:@","];
    }else
    {
        keyStr = @"*";
    }
    
    if (!condition) {
        queryStr = [NSString stringWithFormat:@"SELECT %@ FROM %@",keyStr,table];
    }else if (condition.count == 1)
    {
        NSString *key = [[condition allKeys] objectAtIndex:0];
        NSString *value = (NSString*)[[condition allValues] objectAtIndex:0];
        queryStr = [NSString stringWithFormat:@"SELECT %@ FROM %@ where %@ = '%@'",keyStr,table,key,value];
    }else
    {
        queryStr = [NSString stringWithFormat:@"SELECT %@ FROM %@ where %@ ",keyStr,table,[self sqlStrFromDictionary:condition]];
    }
    
    if (order) {
        queryStr = [queryStr stringByAppendingString:[NSString stringWithFormat:@" ORDER BY %@",order]];
    }
    
    queryStr = [queryStr stringByAppendingString:@";"];
    
    NSArray *array = [sharedInstance getRowsForQuery: queryStr];
    return array;
}

- (NSArray *)queryTableWithSqlStr:(NSString *)condition
{
    NSArray *array = [sharedInstance getRowsForQuery: condition];
    return array;
}

- (NSError *)updateTable:(NSString *)table condition:(NSDictionary *)condition withParam:(NSDictionary *)params autoInsert:(BOOL)autoInsert
{
    autoInsert = YES;
    NSArray *array = [self queryTable:table condition:condition];
    if ((!array || array.count <= 0 ) && autoInsert) {
         return [self insertIntoTable:table withParam:params];
    }else{
        return [self updateTable:table condition:condition withParam:params];
    }
}

- (NSError *)updateTable:(NSString *)table condition:(NSDictionary *)condition withParam:(NSDictionary *)params
{
    NSArray *allKeys = [params allKeys];
    NSArray *allValue = [params allValues];
    
    NSString *keyStr = [allKeys componentsJoinedByString:@","];
    
    NSMutableArray *tropeArry = [NSMutableArray array];
    
    for (id value in allValue) {
        NSString *str = [NSString stringWithFormat:@"'%@'",value];
        [tropeArry addObject:str];
    }
    
    NSMutableArray* pairs = [NSMutableArray array];
    for (NSString* key in [params keyEnumerator])
    {
        NSObject *value = [params objectForKey:key];
        NSString* escaped_value = [NSString stringWithFormat:@"%@",value];
        [pairs addObject:[NSString stringWithFormat:@"%@ = '%@'", key, escaped_value]];
        
    }
    NSString* valueStr = [pairs componentsJoinedByString:@", "];

    NSString *sqlStr = [NSString stringWithFormat:@"UPDATE %@ SET %@ ",table,valueStr];
    
    if (condition) {
        sqlStr = [sqlStr stringByAppendingString:@"WHERE "];
        NSMutableArray *conditionArray = [NSMutableArray array];
        [condition enumerateKeysAndObjectsUsingBlock:^(id  key, id  obj, BOOL *  stop) {
            [conditionArray addObject:[NSString stringWithFormat:@"%@ = '%@'",key,obj]];
        }];
        sqlStr = [sqlStr stringByAppendingString:[conditionArray componentsJoinedByString:@" AND "]];
    }
    
    sqlStr = [sqlStr stringByAppendingString:@";"];

    NSError* error = [sharedInstance doQuery:sqlStr];
    return error;
}




- (NSError *)updateTable:(NSString *)table withParam:(NSDictionary *)params
{

    NSArray *allKeys = [params allKeys];
    NSArray *allValue = [params allValues];
    
    NSString *keyStr = [allKeys componentsJoinedByString:@","];
    
    NSMutableArray *tropeArry = [NSMutableArray array];
    
    for (id value in allValue) {
        NSString *str = [NSString stringWithFormat:@"'%@'",value];
        [tropeArry addObject:str];
    }
    
    NSString *valueStr = [tropeArry componentsJoinedByString:@","];
    
    NSString *sqlStr = [NSString stringWithFormat:@"UPDATE %@ SET (%@) values (%@);",table,keyStr,valueStr];
    if (allKeys.count == 1) {
        sqlStr = [NSString stringWithFormat:@"UPDATE %@ SET %@ = %@;",table,keyStr,valueStr];
    }
    
    NSError* error = [sharedInstance doQuery:sqlStr];
    return error;

}

- (NSError *)updateTable:(NSString *)table withParam:(NSDictionary *)params autoInsert:(BOOL)autoInsert
{
    
    NSArray *allKeys = [params allKeys];
    NSArray *allValue = [params allValues];
    
    NSString *keyStr = [allKeys componentsJoinedByString:@","];
    
    NSMutableArray *tropeArry = [NSMutableArray array];
    
    for (id value in allValue) {
        NSString *str = [NSString stringWithFormat:@"'%@'",value];
        [tropeArry addObject:str];
    }
    
    NSString *valueStr = [tropeArry componentsJoinedByString:@","];
    
    NSString *sqlStr = [NSString stringWithFormat:@"UPDATE %@ SET (%@) values (%@);",table,keyStr,valueStr];
    if (allKeys.count == 1) {
        sqlStr = [NSString stringWithFormat:@"UPDATE %@ SET %@ = %@;",table,keyStr,valueStr];
    }
    if (autoInsert) {
        NSArray *array = [sharedInstance queryTable:table];
        if (array.count <=0) {
            [self insertIntoTable:table withParam:params];
        }
    }
    
    NSError* error = [sharedInstance doQuery:sqlStr];
    return error;
    
}


- (NSError *)insertIntoTable:(NSString *)table Column:(NSString *)column Values:(NSString *)values
{
    
    
    //    INSERT INTO TABLE(col1, col2) SELECT val11, val12 UNION ALL SELECT val21, val22 ;
    
    NSString *sqlStr = [NSString stringWithFormat:@"INSERT INTO %@ (%@) VALUES (%@);",table,column,values];
//    NSLog(@"sql Str :%@",sqlStr);
    
    NSError* error = [sharedInstance doQuery:sqlStr];
    return error;
}


- (NSError *)insertIntoTable:(NSString *)table withParam:(NSDictionary *)params
{
//    NSLog(@"params :%@",params);
    NSArray *allKeys = [params allKeys];
    NSArray *allValue = [params allValues];

    NSString *keyStr = [allKeys componentsJoinedByString:@","];

    NSMutableArray *tropeArry = [NSMutableArray array];

    for (id value in allValue) {
        NSString *str = [NSString stringWithFormat:@"'%@'",value];
        [tropeArry addObject:str];
    }
    
    NSString *valueStr = [tropeArry componentsJoinedByString:@","];
    
    NSString *sqlStr = [NSString stringWithFormat:@"INSERT INTO %@ (%@) values (%@);",table,keyStr,valueStr];
    
    NSError* error = [sharedInstance doQuery:sqlStr];
    return error;
}

- (NSError *)insertIntoTable:(NSString *)table withMutableParam:(NSArray *)params
{
    
    
//    INSERT INTO TABLE(col1, col2) SELECT val11, val12 UNION ALL SELECT val21, val22 ;

    if (params.count <= 0) {
        return nil;
    }    
    
    NSMutableArray *allValue = [NSMutableArray array];
    for (NSDictionary *one in params) {
        NSArray *oneValue = [one allValues];
        NSMutableArray *tropeArry = [NSMutableArray array];
        for (id value in oneValue) {
            NSString *str = [NSString stringWithFormat:@"'%@'",value];
            [tropeArry addObject:str];
        }
        NSString *valueStr = [tropeArry componentsJoinedByString:@","];
        [allValue addObject:valueStr];
        
//        [self insertIntoTable:table withParam:one];
    }
//    return nil;
    
    NSArray *allKeys = [[params objectAtIndex:0] allKeys];
    
    
    NSString *keyStr = [allKeys componentsJoinedByString:@","];
    
    NSString *valueStr = [allValue componentsJoinedByString:@" UNION ALL SELECT "];
    
    NSString *sqlStr = [NSString stringWithFormat:@"INSERT INTO %@ (%@) SELECT %@;",table,keyStr,valueStr];
    
//    NSLog(@"sql Str :%@",sqlStr);
    
    NSError* error = [sharedInstance doQuery:sqlStr];
    return error;
}


- (NSError *)deleteTable:(NSString *)table keyId:(NSDictionary *)key
{
    NSString *sqlStr = nil;
    if (!key) {
        sqlStr = [NSString stringWithFormat:@"DELETE FROM %@ ;",table];
    }else
    {
        sqlStr = [NSString stringWithFormat:@"DELETE FROM %@ WHERE %@ = '%@' ;",table,[[key allKeys] objectAtIndex:0],[[key allValues] objectAtIndex:0]];
    }
    NSError* error = [sharedInstance doQuery:sqlStr];
    return error;
}

- (NSError *)deleteDataBeforeTime:(NSString *)timeStr table:(NSString *)table
{
    NSArray *array = [[SQLiteHelper sharedHelper] queryTable:table];
    NSMutableArray *deleteArray = [NSMutableArray array];
    for (NSDictionary *temp in array) {
        NSString *time = [temp valueForKey:@"time"];
        if (time && [timeStr compare:time] == NSOrderedDescending) {
            NSString *sqltime = [NSString stringWithFormat:@"'%@'",time];
            [deleteArray addObject:sqltime];
        }
    }
    NSString *sqlStr = [NSString stringWithFormat:@"DELETE FROM %@ WHERE time IN (%@);",table,[deleteArray componentsJoinedByString:@","]];
    return [[SQLiteHelper sharedHelper] executeSql:sqlStr];
}


- (NSError *)executeSql:(NSString *)sql
{
    return [sharedInstance doQuery:sql];
}

- (BOOL)table:(NSString *)table containRecordWithCondition:(NSDictionary *)condition
{
    NSArray *reslut = [[SQLiteHelper sharedHelper] queryTable:table condition:condition];
    if (reslut.count >= 1) {
        return YES;
    }
    return NO;
}

- (void)resetCoin
{
    if ([sharedInstance queryTable:@"coins"].count <= 0) {
        [sharedInstance insertIntoTable:@"coins" withParam:@{@"coin":@"0"}];
    }
}

- (void)resetCoin:(int)coin
{
    [[SQLiteHelper sharedHelper] deleteTable:@"coins" keyId:nil];
    [[SQLiteHelper sharedHelper] insertIntoTable:@"coins" withParam:@{@"coin":[NSNumber numberWithInteger:coin]}];
}

- (void)dumpTable:(NSString *)table
{

    NSArray *array = [ sharedInstance queryTable:table keyId:nil];
    NSLog(@"%@ :%@",table,array);
}

- (void)dumpTableComlun:(NSString *)table
{
    NSLog(@"dump :%@",[sharedInstance getRowsForQuery:[NSString stringWithFormat: @"PRAGMA table_info(%@)",table]]);
}
#pragma mark ------table receivecoins ----------

#pragma mark ------群数据处理 ----------

- (BOOL)isDataExistsWithSqlstr:(NSString *)sqlStr
{
    return ([sharedInstance getRowsForQuery:sqlStr].count > 0);
}



//- (NSArray *)myGroups
//{
//    NSMutableArray *mygroups = [NSMutableArray array];
//    NSArray*mygroupInfo = [sharedInstance queryTable:@"mygroup"];
//    if (mygroupInfo.count > 0) {
//        [mygroups addObjectsFromArray:[sharedInstance groupsInSQLWithGids:[mygroupInfo valueForKey:@"gid"]]];
//    }
//    return mygroups;
//}


- (void)cleanSQLDataFroCurrentPerson
{
    [[SQLiteHelper sharedHelper] deleteTable:@"awards" keyId:nil];
    [[SQLiteHelper sharedHelper] deleteTable:@"coinscollection" keyId:nil];
    [[SQLiteHelper sharedHelper] deleteTable:@"coins" keyId:nil];
    [[SQLiteHelper sharedHelper] deleteTable:@"icons" keyId:nil];
    [[SQLiteHelper sharedHelper] deleteTable:@"mygroup" keyId:nil];
}

@end

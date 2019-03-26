//
//  SQLiteHelper.h
//  WebCollector
//
//  Created by apple on 2018/12/16.
//  Copyright © 2018 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SQLiteManager.h"

/**
 *  数据库处理的单列，负责应用在整个过程中的数据存取数据库默认名为hos.db，此类在初始化时会自动创建应用需要使用的几张表格。
 如果以后要更新数据更新版本牵涉到数据库更新，需要做一次数据的迁移 并标注为哪个版本号
 */
@interface SQLiteHelper : SQLiteManager

/**
 *  单列方法
 *
 *  @return SQLiteHelper的单列
 */
+(SQLiteHelper *)sharedHelper;

/**
 *  在数据库创建一张表
 *
 *  @param table 表的名字
 *  @param param 表中的各种参数
 *
 *  @return nil＝代表成功
 */
- (NSError *)createTable:(NSString *)table withParam:(NSString *)param;

/**
 *  查询数据库中表的全部数据,表中的所有数据，以数组形式返回,[[@{key:value},@{key:value},....],[@{key:value},@{key:value},....],....]
 *
 *  @param table 表的名字
 *
 *  @return 数据数组
 */
- (NSArray *)queryTable:(NSString *)table;

/**
 *   查询数据库中表的全部数据,返回特定的列的数据,以数组形式返回,[[@{key:value},@{key:value},....],[@{key:value},@{key:value},....],....]
 *
 *  @param table 表的名字
 *  @param orderKey  特定列的数组
 *
 *  @return 数据数组
 */
- (NSArray *)queryTable:(NSString *)table orderBy:(NSString *)orderKey Des:(BOOL)DES;

/**
 *   查询数据库中表的全部数据,返回特定的列的数据,以数组形式返回,[[@{key:value},@{key:value},....],[@{key:value},@{key:value},....],....]
 *
 *  @param table 表的名字
 *  @param keys  特定列的数组
 *
 *  @return 数据数组
 */

- (NSArray *)queryTable:(NSString *)table keyId:(NSArray *)keys;

/**
 *  根据指定条件查询数据库的表，没有返回空数组
 *
 *  @param table     表名
 *  @param condition 查询条件 例如 @{"name":@"hos"}
 *
 *  @return 查询结果数组
 */
- (NSArray *)queryTable:(NSString *)table condition:(NSDictionary *)condition;

/**
 *  根据指定条件查询数据库的表， 按照指定的列名，指定的列排序，返回数据，默认排序时生序

 *
 *  @param table     表名
 *  @param keys      特定的列名
 *  @param condition 指定的查询条件
 *  @param order     排序的列
 *
 *  @return 查询数据数组
 */
- (NSArray *)queryTable:(NSString *)table keyId:(NSArray *)keys condition:(NSDictionary *)condition orderBy:(NSString *)order;

/**
 *  根据指定条件查询数据库的表， 按照指定的列名，返回数据
 *
 *  @param table     要查询的表名
 *  @param keys      要返回的列名
 *  @param condition 查询的条件
 *
 *  @return 查询结果，没有则返回空数组
 */
- (NSArray *)queryTable:(NSString *)table keyId:(NSArray *)keys condition:(NSDictionary *)condition;

/**
 *  根据指定条件查询数据库的表，返回查询到的数据中第一个指定列名的值，如果没有，返回nil。此方法适合查询数据库中唯一的值
 *
 *  @param table     要查询的表
 *  @param condition 查询的条件
 *  @param key       查询的列名
 *
 *  @return 查询的结果。
 */
- (NSString *)valueInTable:(NSString *)table condition:(NSDictionary *)condition key:(NSString *)key;

/**
 *  根据sql语句查询数据库
 *
 *  @param condition 要执行的SQL语句
 *
 *  @return 查询结果
 */
- (NSArray *)queryTableWithSqlStr:(NSString *)condition;

/**
 *  更新数据库表格，按指定的条件更新一张表的数据
 *
 *  @param tabel      要更新的表名
 *  @param condition  更新的条件
 *  @param params     要更新的数据
 *  @param autoInsert 根据条件未查到条目情况下，是否要自动插入
 *
 *  @return 更新的结果，nil代表成功
 */
- (NSError *)updateTable:(NSString *)tabel condition:(NSDictionary *)condition withParam:(NSDictionary *)params autoInsert:(BOOL)autoInsert;

/**
 *  更新一张表的数据，一般情况下是当一张表为空表时执行，效果类似插入值到一张表中，通常情况下时，先调用deletetable方法清空表的数据，在调用此方法更新数据
 *
 *  @param table  更新的表名
 *  @param params 更新的数据
 *
 *  @return 更新的结果
 */
- (NSError *)updateTable:(NSString *)table withParam:(NSDictionary *)params;

/**
 *  更新一张表的数据，
 *
 *  @param table     要更新的表名
 *  @param condition 更新时的条件
 *  @param params    更新的数据
 *
 *  @return 更新结果
 */
- (NSError *)updateTable:(NSString *)table condition:(NSDictionary *)condition withParam:(NSDictionary *)params;

/**
 *  更新数据库表数据
 *
 *  @param table      要更新的表
 *  @param params     更新的数据
 *  @param autoInsert 当不存在时 是否插入数据
 *
 *  @return nil 代表成功
 */
- (NSError *)updateTable:(NSString *)table withParam:(NSDictionary *)params autoInsert:(BOOL)autoInsert;

/**
 *  插入数据到表中，数据不足为null
 *
 *  @param table  要插入的表名
 *  @param params 要插入的数据
 *
 *  @return 执行结果，nil表示成功
 */
- (NSError *)insertIntoTable:(NSString *)table withParam:(NSDictionary *)params;

/**
 *  插入数据到表中，指定列名和数句
 *
 *  @param table  表名
 *  @param column 列名
 *  @param values 数据
 *
 *  @return 执行结果，nil代表成功
 */
- (NSError *)insertIntoTable:(NSString *)table Column:(NSString *)column Values:(NSString *)values;

/**
 *  插入一大堆数据到表中
 *
 *  @param table  表名
 *  @param params 要插入的数据
 *
 *  @return 执行结果，nil为成功
 */
- (NSError *)insertIntoTable:(NSString *)table withMutableParam:(NSArray *)params;

/**
 *  根据制定条件，删除相应的一条数据，若条件为nil，则清空表格
 *
 *  @param table 表名
 *  @param key   删除的条件
 *
 *  @return 执行结果，nil为成功
 */
- (NSError *)deleteTable:(NSString *)table keyId:(NSDictionary *)key;

/**
 *  根据指定时间删除时间以前的数据，此表中必须含有time列名
 *
 *  @param timeStr 时间
 *  @param table   表名
 *
 *  @return 返回结果 nil 代表成功
 */
- (NSError *)deleteDataBeforeTime:(NSString *)timeStr table:(NSString *)table;

/**
 *  执行一句完整的数据库语句
 *
 *  @param sql 数据库语句
 *
 *  @return 执行结果 nil 代表成功
 */
- (NSError *)executeSql:(NSString *)sql;

/**
 *  输出数据库表的全部内容
 *
 *  @param table 要输出的表名
 */
- (void)dumpTable:(NSString *)table;

/**
 *  输出数据库表的所有列名
 *
 *  @param table 要输出的表名
 */
- (void)dumpTableComlun:(NSString *)table;

/**
 *  判断一张表中是否含有某条记录
 *
 *  @param table     表名
 *  @param condition 判断的条件
 *
 *  @return YES，有；NO，没有
 */
- (BOOL) table:(NSString *)table containRecordWithCondition:(NSDictionary *)condition;

/**
 *  重置数据库表coins中的数据为coin
 *
 *  @param coin 要重置的金币熟
 */
- (void)resetCoin:(int)coin;

//- (void)updateSQL;


- (BOOL)isDataExistsWithSqlstr:(NSString *)sqlStr;
//- (NSArray *)groupsInSQLWithGids:(NSArray *)gids;
//- (NSArray *)myGroups;
//- (void)writeMyGroupsToSQL:(NSArray*)mygroups;

- (void)cleanSQLDataFroCurrentPerson;
@end

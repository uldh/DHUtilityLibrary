//
//  SQLiteManager.h
//  WebCollector
//
//  Created by apple on 2018/12/16.
//  Copyright © 2018 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"


enum errorCodes {
	kDBNotExists,
	kDBFailAtOpen, 
	kDBFailAtCreate,
	kDBErrorQuery,
	kDBFailAtClose
};

@interface SQLiteManager : NSObject {

	sqlite3 *db; // The SQLite db reference
	NSString *databaseName; // The database name
}
+ (instancetype)database;
//+ (instancetype)databaseWithNamed:(NSString *)name;

- (id)initWithDatabaseNamed:(NSString *)name;

// SQLite Operations
- (NSError *) openDatabase;
- (NSError *) doQuery:(NSString *)sql;
- (NSError *) doUpdateQuery:(NSString *)sql withParams:(NSArray *)params;
- (NSArray *) getRowsForQuery:(NSString *)sql;
- (NSError *) closeDatabase;
- (NSInteger) getLastInsertRowID;

- (NSString *) getDatabaseDump;

@end

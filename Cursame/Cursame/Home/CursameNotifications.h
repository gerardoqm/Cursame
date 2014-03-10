//
//  CursameNotifications.h
//
//  Created by Gerardo Quintanar Morales on 3/3/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface CursameNotifications : NSObject <NSCoding>

@property (nonatomic, assign) BOOL active;
@property (nonatomic, assign) double notificatorId;
@property (nonatomic, assign) double notificationsIdentifier;
@property (nonatomic, strong) NSString *notificatorType;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, strong) NSString *updatedAt;
@property (nonatomic, strong) NSString *kind;

+ (CursameNotifications *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

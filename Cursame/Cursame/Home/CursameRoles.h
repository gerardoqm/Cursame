//
//  CursameRoles.h
//
//  Created by Gerardo Quintanar Morales on 3/3/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface CursameRoles : NSObject <NSCoding>

@property (nonatomic, assign) id created;
@property (nonatomic, assign) double rolesIdentifier;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *rolesDescription;
@property (nonatomic, strong) NSString *updatedAt;
@property (nonatomic, strong) NSString *createdAt;

+ (CursameRoles *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

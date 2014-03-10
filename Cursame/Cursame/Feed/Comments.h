//
//  Comments.h
//
//  Created by Gerardo Quintanar Morales on 3/3/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Comments : NSObject <NSCoding>

@property (nonatomic, assign) double commentsIdentifier;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, assign) id netwokId;
@property (nonatomic, strong) NSArray *likes;
@property (nonatomic, assign) double userId;
@property (nonatomic, strong) NSString *comment;
@property (nonatomic, assign) double networkId;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *commentableType;
@property (nonatomic, assign) double commentableId;
@property (nonatomic, strong) NSString *updatedAt;
@property (nonatomic, strong) NSString *commentHtml;
@property (nonatomic, strong) NSString *role;

+ (Comments *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

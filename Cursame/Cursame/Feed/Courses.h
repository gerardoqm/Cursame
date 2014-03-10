//
//  Courses.h
//
//  Created by Gerardo Quintanar Morales on 3/3/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Coverphoto, Avatar;

@interface Courses : NSObject <NSCoding>

@property (nonatomic, assign) double coursesIdentifier;
@property (nonatomic, assign) double deliveryParamEvaluation;
@property (nonatomic, strong) NSString *publicStatus;
@property (nonatomic, strong) NSString *silabus;
@property (nonatomic, strong) Coverphoto *coverphoto;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, strong) NSArray *likes;
@property (nonatomic, assign) id deliveryId;
@property (nonatomic, assign) double surveyParamEvaluation;
@property (nonatomic, assign) double networkId;
@property (nonatomic, strong) Avatar *avatar;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *updatedAt;
@property (nonatomic, assign) BOOL activeStatus;
@property (nonatomic, strong) NSString *initial_Date;
@property (nonatomic, strong) NSString *finishDate;

+ (Courses *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

//
//  Publication.h
//
//  Created by Gerardo Quintanar Morales on 3/3/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Coverphoto, User, Avatar;

@interface Publication : NSObject <NSCoding>

@property (nonatomic, assign) double surveyParamEvaluation;
@property (nonatomic, strong) Coverphoto *coverphoto;
@property (nonatomic, assign) BOOL publish;
@property (nonatomic, assign) double publicationIdentifier;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, assign) id courseId;
@property (nonatomic, strong) NSString *state;
@property (nonatomic, strong) NSString *initial_Date;
@property (nonatomic, strong) NSArray *comments;
@property (nonatomic, assign) id pollId;
@property (nonatomic, assign) double porcentOfEvaluation;
@property (nonatomic, strong) NSString *publicationDescription;
@property (nonatomic, assign) double deliveryParamEvaluation;
@property (nonatomic, strong) NSString *comment;
@property (nonatomic, strong) NSString *role;
@property (nonatomic, strong) NSString *finishDate;
@property (nonatomic, assign) double networkId;
@property (nonatomic, strong) NSString *endDate;
@property (nonatomic, strong) User *user;
@property (nonatomic, strong) NSArray *likes;
@property (nonatomic, assign) id deliveryId;
@property (nonatomic, strong) NSString *publicStatus;
@property (nonatomic, strong) NSString *silabus;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *commentableType;
@property (nonatomic, strong) Avatar *avatar;
@property (nonatomic, strong) NSString *publishDate;
@property (nonatomic, strong) NSString *descriptionHtml;
@property (nonatomic, assign) BOOL activeStatus;
@property (nonatomic, assign) id netwokId;
@property (nonatomic, assign) double userId;
@property (nonatomic, strong) NSString *updatedAt;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *commentHtml;
@property (nonatomic, assign) double commentableId;

+ (Publication *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

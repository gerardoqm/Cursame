//
//  Courses.m
//
//  Created by Gerardo Quintanar Morales on 3/3/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "Courses.h"
#import "Coverphoto.h"
#import "Avatar.h"


NSString *const kCoursesId = @"id";
NSString *const kCoursesDeliveryParamEvaluation = @"delivery_param_evaluation";
NSString *const kCoursesPublicStatus = @"public_status";
NSString *const kCoursesSilabus = @"silabus";
NSString *const kCoursesCoverphoto = @"coverphoto";
NSString *const kCoursesCreatedAt = @"created_at";
NSString *const kCoursesLikes = @"likes";
NSString *const kCoursesDeliveryId = @"delivery_id";
NSString *const kCoursesSurveyParamEvaluation = @"survey_param_evaluation";
NSString *const kCoursesNetworkId = @"network_id";
NSString *const kCoursesAvatar = @"avatar";
NSString *const kCoursesTitle = @"title";
NSString *const kCoursesUpdatedAt = @"updated_at";
NSString *const kCoursesActiveStatus = @"active_status";
NSString *const kCoursesinitial_Date = @"init_date";
NSString *const kCoursesFinishDate = @"finish_date";


@interface Courses ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Courses

@synthesize coursesIdentifier = _coursesIdentifier;
@synthesize deliveryParamEvaluation = _deliveryParamEvaluation;
@synthesize publicStatus = _publicStatus;
@synthesize silabus = _silabus;
@synthesize coverphoto = _coverphoto;
@synthesize createdAt = _createdAt;
@synthesize likes = _likes;
@synthesize deliveryId = _deliveryId;
@synthesize surveyParamEvaluation = _surveyParamEvaluation;
@synthesize networkId = _networkId;
@synthesize avatar = _avatar;
@synthesize title = _title;
@synthesize updatedAt = _updatedAt;
@synthesize activeStatus = _activeStatus;
@synthesize initial_Date = _initial_Date;
@synthesize finishDate = _finishDate;


+ (Courses *)modelObjectWithDictionary:(NSDictionary *)dict
{
    Courses *instance = [[Courses alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.coursesIdentifier = [[self objectOrNilForKey:kCoursesId fromDictionary:dict] doubleValue];
            self.deliveryParamEvaluation = [[self objectOrNilForKey:kCoursesDeliveryParamEvaluation fromDictionary:dict] doubleValue];
            self.publicStatus = [self objectOrNilForKey:kCoursesPublicStatus fromDictionary:dict];
            self.silabus = [self objectOrNilForKey:kCoursesSilabus fromDictionary:dict];
            self.coverphoto = [Coverphoto modelObjectWithDictionary:[dict objectForKey:kCoursesCoverphoto]];
            self.createdAt = [self objectOrNilForKey:kCoursesCreatedAt fromDictionary:dict];
            self.likes = [self objectOrNilForKey:kCoursesLikes fromDictionary:dict];
            self.deliveryId = [self objectOrNilForKey:kCoursesDeliveryId fromDictionary:dict];
            self.surveyParamEvaluation = [[self objectOrNilForKey:kCoursesSurveyParamEvaluation fromDictionary:dict] doubleValue];
            self.networkId = [[self objectOrNilForKey:kCoursesNetworkId fromDictionary:dict] doubleValue];
            self.avatar = [Avatar modelObjectWithDictionary:[dict objectForKey:kCoursesAvatar]];
            self.title = [self objectOrNilForKey:kCoursesTitle fromDictionary:dict];
            self.updatedAt = [self objectOrNilForKey:kCoursesUpdatedAt fromDictionary:dict];
            self.activeStatus = [[self objectOrNilForKey:kCoursesActiveStatus fromDictionary:dict] boolValue];
            self.initial_Date = [self objectOrNilForKey:kCoursesinitial_Date fromDictionary:dict];
            self.finishDate = [self objectOrNilForKey:kCoursesFinishDate fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.coursesIdentifier] forKey:kCoursesId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.deliveryParamEvaluation] forKey:kCoursesDeliveryParamEvaluation];
    [mutableDict setValue:self.publicStatus forKey:kCoursesPublicStatus];
    [mutableDict setValue:self.silabus forKey:kCoursesSilabus];
    [mutableDict setValue:[self.coverphoto dictionaryRepresentation] forKey:kCoursesCoverphoto];
    [mutableDict setValue:self.createdAt forKey:kCoursesCreatedAt];
NSMutableArray *tempArrayForLikes = [NSMutableArray array];
    for (NSObject *subArrayObject in self.likes) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForLikes addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForLikes addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForLikes] forKey:@"kCoursesLikes"];
    [mutableDict setValue:self.deliveryId forKey:kCoursesDeliveryId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.surveyParamEvaluation] forKey:kCoursesSurveyParamEvaluation];
    [mutableDict setValue:[NSNumber numberWithDouble:self.networkId] forKey:kCoursesNetworkId];
    [mutableDict setValue:[self.avatar dictionaryRepresentation] forKey:kCoursesAvatar];
    [mutableDict setValue:self.title forKey:kCoursesTitle];
    [mutableDict setValue:self.updatedAt forKey:kCoursesUpdatedAt];
    [mutableDict setValue:[NSNumber numberWithBool:self.activeStatus] forKey:kCoursesActiveStatus];
    [mutableDict setValue:self.initial_Date forKey:kCoursesinitial_Date];
    [mutableDict setValue:self.finishDate forKey:kCoursesFinishDate];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.coursesIdentifier = [aDecoder decodeDoubleForKey:kCoursesId];
    self.deliveryParamEvaluation = [aDecoder decodeDoubleForKey:kCoursesDeliveryParamEvaluation];
    self.publicStatus = [aDecoder decodeObjectForKey:kCoursesPublicStatus];
    self.silabus = [aDecoder decodeObjectForKey:kCoursesSilabus];
    self.coverphoto = [aDecoder decodeObjectForKey:kCoursesCoverphoto];
    self.createdAt = [aDecoder decodeObjectForKey:kCoursesCreatedAt];
    self.likes = [aDecoder decodeObjectForKey:kCoursesLikes];
    self.deliveryId = [aDecoder decodeObjectForKey:kCoursesDeliveryId];
    self.surveyParamEvaluation = [aDecoder decodeDoubleForKey:kCoursesSurveyParamEvaluation];
    self.networkId = [aDecoder decodeDoubleForKey:kCoursesNetworkId];
    self.avatar = [aDecoder decodeObjectForKey:kCoursesAvatar];
    self.title = [aDecoder decodeObjectForKey:kCoursesTitle];
    self.updatedAt = [aDecoder decodeObjectForKey:kCoursesUpdatedAt];
    self.activeStatus = [aDecoder decodeBoolForKey:kCoursesActiveStatus];
    self.initial_Date = [aDecoder decodeObjectForKey:kCoursesinitial_Date];
    self.finishDate = [aDecoder decodeObjectForKey:kCoursesFinishDate];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_coursesIdentifier forKey:kCoursesId];
    [aCoder encodeDouble:_deliveryParamEvaluation forKey:kCoursesDeliveryParamEvaluation];
    [aCoder encodeObject:_publicStatus forKey:kCoursesPublicStatus];
    [aCoder encodeObject:_silabus forKey:kCoursesSilabus];
    [aCoder encodeObject:_coverphoto forKey:kCoursesCoverphoto];
    [aCoder encodeObject:_createdAt forKey:kCoursesCreatedAt];
    [aCoder encodeObject:_likes forKey:kCoursesLikes];
    [aCoder encodeObject:_deliveryId forKey:kCoursesDeliveryId];
    [aCoder encodeDouble:_surveyParamEvaluation forKey:kCoursesSurveyParamEvaluation];
    [aCoder encodeDouble:_networkId forKey:kCoursesNetworkId];
    [aCoder encodeObject:_avatar forKey:kCoursesAvatar];
    [aCoder encodeObject:_title forKey:kCoursesTitle];
    [aCoder encodeObject:_updatedAt forKey:kCoursesUpdatedAt];
    [aCoder encodeBool:_activeStatus forKey:kCoursesActiveStatus];
    [aCoder encodeObject:_initial_Date forKey:kCoursesinitial_Date];
    [aCoder encodeObject:_finishDate forKey:kCoursesFinishDate];
}


@end

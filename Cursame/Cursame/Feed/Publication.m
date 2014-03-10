//
//  Publication.m
//
//  Created by Gerardo Quintanar Morales on 3/3/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "Publication.h"
#import "Coverphoto.h"
#import "User.h"
#import "Avatar.h"


NSString *const kPublicationSurveyParamEvaluation = @"survey_param_evaluation";
NSString *const kPublicationCoverphoto = @"coverphoto";
NSString *const kPublicationPublish = @"publish";
NSString *const kPublicationId = @"id";
NSString *const kPublicationCreatedAt = @"created_at";
NSString *const kPublicationCourseId = @"course_id";
NSString *const kPublicationState = @"state";
NSString *const kPublicationinitial_Date = @"initial_Date";
NSString *const kPublicationComments = @"comments";
NSString *const kPublicationPollId = @"poll_id";
NSString *const kPublicationPorcentOfEvaluation = @"porcent_of_evaluation";
NSString *const kPublicationDescription = @"description";
NSString *const kPublicationDeliveryParamEvaluation = @"delivery_param_evaluation";
NSString *const kPublicationComment = @"comment";
NSString *const kPublicationRole = @"role";
NSString *const kPublicationFinishDate = @"finish_date";
NSString *const kPublicationNetworkId = @"network_id";
NSString *const kPublicationEndDate = @"end_date";
NSString *const kPublicationUser = @"user";
NSString *const kPublicationLikes = @"likes";
NSString *const kPublicationDeliveryId = @"delivery_id";
NSString *const kPublicationPublicStatus = @"public_status";
NSString *const kPublicationSilabus = @"silabus";
NSString *const kPublicationName = @"name";
NSString *const kPublicationCommentableType = @"commentable_type";
NSString *const kPublicationAvatar = @"avatar";
NSString *const kPublicationPublishDate = @"publish_date";
NSString *const kPublicationDescriptionHtml = @"description_html";
NSString *const kPublicationActiveStatus = @"active_status";
NSString *const kPublicationNetwokId = @"netwok_id";
NSString *const kPublicationUserId = @"user_id";
NSString *const kPublicationUpdatedAt = @"updated_at";
NSString *const kPublicationTitle = @"title";
NSString *const kPublicationCommentHtml = @"comment_html";
NSString *const kPublicationCommentableId = @"commentable_id";


@interface Publication ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Publication

@synthesize surveyParamEvaluation = _surveyParamEvaluation;
@synthesize coverphoto = _coverphoto;
@synthesize publish = _publish;
@synthesize publicationIdentifier = _publicationIdentifier;
@synthesize createdAt = _createdAt;
@synthesize courseId = _courseId;
@synthesize state = _state;
@synthesize initial_Date = _initial_Date;
@synthesize comments = _comments;
@synthesize pollId = _pollId;
@synthesize porcentOfEvaluation = _porcentOfEvaluation;
@synthesize publicationDescription = _publicationDescription;
@synthesize deliveryParamEvaluation = _deliveryParamEvaluation;
@synthesize comment = _comment;
@synthesize role = _role;
@synthesize finishDate = _finishDate;
@synthesize networkId = _networkId;
@synthesize endDate = _endDate;
@synthesize user = _user;
@synthesize likes = _likes;
@synthesize deliveryId = _deliveryId;
@synthesize publicStatus = _publicStatus;
@synthesize silabus = _silabus;
@synthesize name = _name;
@synthesize commentableType = _commentableType;
@synthesize avatar = _avatar;
@synthesize publishDate = _publishDate;
@synthesize descriptionHtml = _descriptionHtml;
@synthesize activeStatus = _activeStatus;
@synthesize netwokId = _netwokId;
@synthesize userId = _userId;
@synthesize updatedAt = _updatedAt;
@synthesize title = _title;
@synthesize commentHtml = _commentHtml;
@synthesize commentableId = _commentableId;


+ (Publication *)modelObjectWithDictionary:(NSDictionary *)dict
{
    Publication *instance = [[Publication alloc] initWithDictionary:dict];
    return instance;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.surveyParamEvaluation = [[self objectOrNilForKey:kPublicationSurveyParamEvaluation fromDictionary:dict] doubleValue];
            self.coverphoto = [Coverphoto modelObjectWithDictionary:[dict objectForKey:kPublicationCoverphoto]];
            self.publish = [[self objectOrNilForKey:kPublicationPublish fromDictionary:dict] boolValue];
            self.publicationIdentifier = [[self objectOrNilForKey:kPublicationId fromDictionary:dict] doubleValue];
            self.createdAt = [self objectOrNilForKey:kPublicationCreatedAt fromDictionary:dict];
            self.courseId = [self objectOrNilForKey:kPublicationCourseId fromDictionary:dict];
            self.state = [self objectOrNilForKey:kPublicationState fromDictionary:dict];
            self.initial_Date = [self objectOrNilForKey:kPublicationinitial_Date fromDictionary:dict];
            self.comments = [self objectOrNilForKey:kPublicationComments fromDictionary:dict];
            self.pollId = [self objectOrNilForKey:kPublicationPollId fromDictionary:dict];
            self.porcentOfEvaluation = [[self objectOrNilForKey:kPublicationPorcentOfEvaluation fromDictionary:dict] doubleValue];
            self.publicationDescription = [self objectOrNilForKey:kPublicationDescription fromDictionary:dict];
            self.deliveryParamEvaluation = [[self objectOrNilForKey:kPublicationDeliveryParamEvaluation fromDictionary:dict] doubleValue];
            self.comment = [self objectOrNilForKey:kPublicationComment fromDictionary:dict];
            self.role = [self objectOrNilForKey:kPublicationRole fromDictionary:dict];
            self.finishDate = [self objectOrNilForKey:kPublicationFinishDate fromDictionary:dict];
            self.networkId = [[self objectOrNilForKey:kPublicationNetworkId fromDictionary:dict] doubleValue];
            self.endDate = [self objectOrNilForKey:kPublicationEndDate fromDictionary:dict];
            self.user = [User modelObjectWithDictionary:[dict objectForKey:kPublicationUser]];
            self.likes = [self objectOrNilForKey:kPublicationLikes fromDictionary:dict];
            self.deliveryId = [self objectOrNilForKey:kPublicationDeliveryId fromDictionary:dict];
            self.publicStatus = [self objectOrNilForKey:kPublicationPublicStatus fromDictionary:dict];
            self.silabus = [self objectOrNilForKey:kPublicationSilabus fromDictionary:dict];
            self.name = [self objectOrNilForKey:kPublicationName fromDictionary:dict];
            self.commentableType = [self objectOrNilForKey:kPublicationCommentableType fromDictionary:dict];
            self.avatar = [Avatar modelObjectWithDictionary:[dict objectForKey:kPublicationAvatar]];
            self.publishDate = [self objectOrNilForKey:kPublicationPublishDate fromDictionary:dict];
            self.descriptionHtml = [self objectOrNilForKey:kPublicationDescriptionHtml fromDictionary:dict];
            self.activeStatus = [[self objectOrNilForKey:kPublicationActiveStatus fromDictionary:dict] boolValue];
            self.netwokId = [self objectOrNilForKey:kPublicationNetwokId fromDictionary:dict];
            self.userId = [[self objectOrNilForKey:kPublicationUserId fromDictionary:dict] doubleValue];
            self.updatedAt = [self objectOrNilForKey:kPublicationUpdatedAt fromDictionary:dict];
            self.title = [self objectOrNilForKey:kPublicationTitle fromDictionary:dict];
            self.commentHtml = [self objectOrNilForKey:kPublicationCommentHtml fromDictionary:dict];
            self.commentableId = [[self objectOrNilForKey:kPublicationCommentableId fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.surveyParamEvaluation] forKey:kPublicationSurveyParamEvaluation];
    [mutableDict setValue:[self.coverphoto dictionaryRepresentation] forKey:kPublicationCoverphoto];
    [mutableDict setValue:[NSNumber numberWithBool:self.publish] forKey:kPublicationPublish];
    [mutableDict setValue:[NSNumber numberWithDouble:self.publicationIdentifier] forKey:kPublicationId];
    [mutableDict setValue:self.createdAt forKey:kPublicationCreatedAt];
    [mutableDict setValue:self.courseId forKey:kPublicationCourseId];
    [mutableDict setValue:self.state forKey:kPublicationState];
    [mutableDict setValue:self.initial_Date forKey:kPublicationinitial_Date];
NSMutableArray *tempArrayForComments = [NSMutableArray array];
    for (NSObject *subArrayObject in self.comments) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForComments addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForComments addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForComments] forKey:@"kPublicationComments"];
    [mutableDict setValue:self.pollId forKey:kPublicationPollId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.porcentOfEvaluation] forKey:kPublicationPorcentOfEvaluation];
    [mutableDict setValue:self.publicationDescription forKey:kPublicationDescription];
    [mutableDict setValue:[NSNumber numberWithDouble:self.deliveryParamEvaluation] forKey:kPublicationDeliveryParamEvaluation];
    [mutableDict setValue:self.comment forKey:kPublicationComment];
    [mutableDict setValue:self.role forKey:kPublicationRole];
    [mutableDict setValue:self.finishDate forKey:kPublicationFinishDate];
    [mutableDict setValue:[NSNumber numberWithDouble:self.networkId] forKey:kPublicationNetworkId];
    [mutableDict setValue:self.endDate forKey:kPublicationEndDate];
    [mutableDict setValue:[self.user dictionaryRepresentation] forKey:kPublicationUser];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForLikes] forKey:@"kPublicationLikes"];
    [mutableDict setValue:self.deliveryId forKey:kPublicationDeliveryId];
    [mutableDict setValue:self.publicStatus forKey:kPublicationPublicStatus];
    [mutableDict setValue:self.silabus forKey:kPublicationSilabus];
    [mutableDict setValue:self.name forKey:kPublicationName];
    [mutableDict setValue:self.commentableType forKey:kPublicationCommentableType];
    [mutableDict setValue:[self.avatar dictionaryRepresentation] forKey:kPublicationAvatar];
    [mutableDict setValue:self.publishDate forKey:kPublicationPublishDate];
    [mutableDict setValue:self.descriptionHtml forKey:kPublicationDescriptionHtml];
    [mutableDict setValue:[NSNumber numberWithBool:self.activeStatus] forKey:kPublicationActiveStatus];
    [mutableDict setValue:self.netwokId forKey:kPublicationNetwokId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userId] forKey:kPublicationUserId];
    [mutableDict setValue:self.updatedAt forKey:kPublicationUpdatedAt];
    [mutableDict setValue:self.title forKey:kPublicationTitle];
    [mutableDict setValue:self.commentHtml forKey:kPublicationCommentHtml];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentableId] forKey:kPublicationCommentableId];

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

    self.surveyParamEvaluation = [aDecoder decodeDoubleForKey:kPublicationSurveyParamEvaluation];
    self.coverphoto = [aDecoder decodeObjectForKey:kPublicationCoverphoto];
    self.publish = [aDecoder decodeBoolForKey:kPublicationPublish];
    self.publicationIdentifier = [aDecoder decodeDoubleForKey:kPublicationId];
    self.createdAt = [aDecoder decodeObjectForKey:kPublicationCreatedAt];
    self.courseId = [aDecoder decodeObjectForKey:kPublicationCourseId];
    self.state = [aDecoder decodeObjectForKey:kPublicationState];
    self.initial_Date = [aDecoder decodeObjectForKey:kPublicationinitial_Date];
    self.comments = [aDecoder decodeObjectForKey:kPublicationComments];
    self.pollId = [aDecoder decodeObjectForKey:kPublicationPollId];
    self.porcentOfEvaluation = [aDecoder decodeDoubleForKey:kPublicationPorcentOfEvaluation];
    self.publicationDescription = [aDecoder decodeObjectForKey:kPublicationDescription];
    self.deliveryParamEvaluation = [aDecoder decodeDoubleForKey:kPublicationDeliveryParamEvaluation];
    self.comment = [aDecoder decodeObjectForKey:kPublicationComment];
    self.role = [aDecoder decodeObjectForKey:kPublicationRole];
    self.finishDate = [aDecoder decodeObjectForKey:kPublicationFinishDate];
    self.networkId = [aDecoder decodeDoubleForKey:kPublicationNetworkId];
    self.endDate = [aDecoder decodeObjectForKey:kPublicationEndDate];
    self.user = [aDecoder decodeObjectForKey:kPublicationUser];
    self.likes = [aDecoder decodeObjectForKey:kPublicationLikes];
    self.deliveryId = [aDecoder decodeObjectForKey:kPublicationDeliveryId];
    self.publicStatus = [aDecoder decodeObjectForKey:kPublicationPublicStatus];
    self.silabus = [aDecoder decodeObjectForKey:kPublicationSilabus];
    self.name = [aDecoder decodeObjectForKey:kPublicationName];
    self.commentableType = [aDecoder decodeObjectForKey:kPublicationCommentableType];
    self.avatar = [aDecoder decodeObjectForKey:kPublicationAvatar];
    self.publishDate = [aDecoder decodeObjectForKey:kPublicationPublishDate];
    self.descriptionHtml = [aDecoder decodeObjectForKey:kPublicationDescriptionHtml];
    self.activeStatus = [aDecoder decodeBoolForKey:kPublicationActiveStatus];
    self.netwokId = [aDecoder decodeObjectForKey:kPublicationNetwokId];
    self.userId = [aDecoder decodeDoubleForKey:kPublicationUserId];
    self.updatedAt = [aDecoder decodeObjectForKey:kPublicationUpdatedAt];
    self.title = [aDecoder decodeObjectForKey:kPublicationTitle];
    self.commentHtml = [aDecoder decodeObjectForKey:kPublicationCommentHtml];
    self.commentableId = [aDecoder decodeDoubleForKey:kPublicationCommentableId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_surveyParamEvaluation forKey:kPublicationSurveyParamEvaluation];
    [aCoder encodeObject:_coverphoto forKey:kPublicationCoverphoto];
    [aCoder encodeBool:_publish forKey:kPublicationPublish];
    [aCoder encodeDouble:_publicationIdentifier forKey:kPublicationId];
    [aCoder encodeObject:_createdAt forKey:kPublicationCreatedAt];
    [aCoder encodeObject:_courseId forKey:kPublicationCourseId];
    [aCoder encodeObject:_state forKey:kPublicationState];
    [aCoder encodeObject:_initial_Date forKey:kPublicationinitial_Date];
    [aCoder encodeObject:_comments forKey:kPublicationComments];
    [aCoder encodeObject:_pollId forKey:kPublicationPollId];
    [aCoder encodeDouble:_porcentOfEvaluation forKey:kPublicationPorcentOfEvaluation];
    [aCoder encodeObject:_publicationDescription forKey:kPublicationDescription];
    [aCoder encodeDouble:_deliveryParamEvaluation forKey:kPublicationDeliveryParamEvaluation];
    [aCoder encodeObject:_comment forKey:kPublicationComment];
    [aCoder encodeObject:_role forKey:kPublicationRole];
    [aCoder encodeObject:_finishDate forKey:kPublicationFinishDate];
    [aCoder encodeDouble:_networkId forKey:kPublicationNetworkId];
    [aCoder encodeObject:_endDate forKey:kPublicationEndDate];
    [aCoder encodeObject:_user forKey:kPublicationUser];
    [aCoder encodeObject:_likes forKey:kPublicationLikes];
    [aCoder encodeObject:_deliveryId forKey:kPublicationDeliveryId];
    [aCoder encodeObject:_publicStatus forKey:kPublicationPublicStatus];
    [aCoder encodeObject:_silabus forKey:kPublicationSilabus];
    [aCoder encodeObject:_name forKey:kPublicationName];
    [aCoder encodeObject:_commentableType forKey:kPublicationCommentableType];
    [aCoder encodeObject:_avatar forKey:kPublicationAvatar];
    [aCoder encodeObject:_publishDate forKey:kPublicationPublishDate];
    [aCoder encodeObject:_descriptionHtml forKey:kPublicationDescriptionHtml];
    [aCoder encodeBool:_activeStatus forKey:kPublicationActiveStatus];
    [aCoder encodeObject:_netwokId forKey:kPublicationNetwokId];
    [aCoder encodeDouble:_userId forKey:kPublicationUserId];
    [aCoder encodeObject:_updatedAt forKey:kPublicationUpdatedAt];
    [aCoder encodeObject:_title forKey:kPublicationTitle];
    [aCoder encodeObject:_commentHtml forKey:kPublicationCommentHtml];
    [aCoder encodeDouble:_commentableId forKey:kPublicationCommentableId];
}


@end

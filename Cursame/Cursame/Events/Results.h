//
//  Results.h
//
//  Created by Gerardo Quintanar Morales on 3/19/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Results : NSObject <NSCoding>

@property (nonatomic, assign) id allDay;
@property (nonatomic, strong) NSString *endProperty;
@property (nonatomic, strong) NSString *start;
@property (nonatomic, assign) double resultsIdentifier;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) BOOL recurring;
@property (nonatomic, strong) NSString *resultsDescription;
@property (nonatomic, strong) NSString *url;

+ (Results *)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

//
//  RWTFlickrSearchImpl.m
//  RWTFlickrSearch
//
//  Created by Rabe on 4/6/16.
//  Copyright © 2016 Colin Eberhardt. All rights reserved.
//

#import "RWTFlickrSearchImpl.h"

@implementation RWTFlickrSearchImpl

- (RACSignal *)flickrSearchSignal:(NSString *)searchString
{
    return [[[[RACSignal empty] logAll] delay:2.0] logAll];
}

@end

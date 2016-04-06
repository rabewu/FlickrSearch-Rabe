//
//  RWTFlickrSearchResults.m
//  RWTFlickrSearch
//
//  Created by Rabe on 4/6/16.
//  Copyright © 2016 Colin Eberhardt. All rights reserved.
//

#import "RWTFlickrSearchResults.h"

@implementation RWTFlickrSearchResults

- (NSString *)description
{
    return [NSString stringWithFormat:@"searchString=%@, totalResults=%lu, photos=%@",
            self.searchString, self.totalResults, self.photos];
}

@end

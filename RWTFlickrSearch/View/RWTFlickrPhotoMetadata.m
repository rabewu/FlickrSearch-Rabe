//
//  RWTFlickrPhotoMetadata.m
//  RWTFlickrSearch
//
//  Created by Rabe on 4/7/16.
//  Copyright © 2016 Colin Eberhardt. All rights reserved.
//

#import "RWTFlickrPhotoMetadata.h"

@implementation RWTFlickrPhotoMetadata

- (NSString *)description
{
    return [NSString stringWithFormat:@"metadata: comments=%lu, favorites=%lu",
            self.comments, self.favorites];
}

@end

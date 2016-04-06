//
//  RWTFlickrSearchViewModel.m
//  RWTFlickrSearch
//
//  Created by Rabe on 4/6/16.
//  Copyright © 2016 Colin Eberhardt. All rights reserved.
//

#import "RWTFlickrSearchViewModel.h"

@implementation RWTFlickrSearchViewModel

- (instancetype)init
{
    if (self = [super init]) {
        [self initialize];
    }
    return self;
}

- (void)initialize
{
    // 设置初始状态
    self.searchText = @"search text";
    self.title = @"Flickr Search";
}

@end

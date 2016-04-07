//
//  RWTSearchResultsViewModel.h
//  RWTFlickrSearch
//
//  Created by Rabe on 4/7/16.
//  Copyright © 2016 Colin Eberhardt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RWTViewModelServices.h"
#import "RWTFlickrSearchResults.h"

@class RWTFlickrSearchResults;

@interface RWTSearchResultsViewModel : NSObject

- (instancetype)initWithSearchResults:(RWTFlickrSearchResults *)results services:(id<RWTViewModelServices>)services;

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSArray *searchResults;

@end

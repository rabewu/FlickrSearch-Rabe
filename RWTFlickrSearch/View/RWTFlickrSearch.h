//
//  RWTFlickrSearch.h
//  RWTFlickrSearch
//
//  Created by Rabe on 4/6/16.
//  Copyright © 2016 Colin Eberhardt. All rights reserved.
//
//  This protocol defines the initial interface for the Model layer,
//  and moves the responsibility of searching Flickr out of the ViewModel

#import <ReactiveCocoa/ReactiveCocoa.h>
@import Foundation;

@protocol RWTFlickrSearch <NSObject>

- (RACSignal *)flickrSearchSignal:(NSString *)searchString;
- (RACSignal *)flickrImageMetadata:(NSString *)identifier;

@end

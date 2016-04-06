//
//  RWTViewModelServices.h
//  RWTFlickrSearch
//
//  Created by Rabe on 4/6/16.
//  Copyright © 2016 Colin Eberhardt. All rights reserved.
//
//  This protocol defines a single method that allows the ViewModel to
//  obtain a reference to an implementation of the RWTFlickrSearch protocol

@import Foundation;
#import "RWTFlickrSearch.h"

@protocol RWTViewModelServices <NSObject>

- (id<RWTFlickrSearch>)getFlickrSearchService;

@end
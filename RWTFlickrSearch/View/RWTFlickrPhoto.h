//
//  RWTFlickrPhoto.h
//  RWTFlickrSearch
//
//  Created by Rabe on 4/6/16.
//  Copyright © 2016 Colin Eberhardt. All rights reserved.
//
//  This is a model object that represents a single photo returned by Flickr’s search APIs.

#import <Foundation/Foundation.h>

@interface RWTFlickrPhoto : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSURL *url;
@property (nonatomic, strong) NSString *identifier;

@end

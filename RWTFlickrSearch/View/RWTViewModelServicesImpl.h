//
//  RWTViewModelServicesImpl.h
//  RWTFlickrSearch
//
//  Created by Rabe on 4/6/16.
//  Copyright © 2016 Colin Eberhardt. All rights reserved.
//
//  This class simply creates an instance of RWTFlickrSearchImpl,
//  the Model layer service for searching Flickr,
//  and provides it to the ViewModel upon request

#import <Foundation/Foundation.h>
#import "RWTViewModelServices.h"

@interface RWTViewModelServicesImpl : NSObject <RWTViewModelServices>

@end

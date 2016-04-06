//
//  RWTFlickrSearchViewModel.h
//  RWTFlickrSearch
//
//  Created by Rabe on 4/6/16.
//  Copyright © 2016 Colin Eberhardt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "RWTViewModelServices.h"

@interface RWTFlickrSearchViewModel : NSObject

@property (nonatomic, strong) NSString *searchText;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) RACCommand *excuteSearch;

- (instancetype)initWithServices:(id<RWTViewModelServices>)services;

@end

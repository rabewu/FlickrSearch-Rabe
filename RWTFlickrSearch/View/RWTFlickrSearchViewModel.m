//
//  RWTFlickrSearchViewModel.m
//  RWTFlickrSearch
//
//  Created by Rabe on 4/6/16.
//  Copyright © 2016 Colin Eberhardt. All rights reserved.
//

#import "RWTFlickrSearchViewModel.h"
#import "RWTSearchResultsViewModel.h"

@interface RWTFlickrSearchViewModel ()

@property (nonatomic, weak) id<RWTViewModelServices> services;

@end

@implementation RWTFlickrSearchViewModel

- (instancetype)initWithServices:(id<RWTViewModelServices>)services
{
    if (self = [super init]) {
        _services = services;
        [self initialize];
    }
    return self;
}

- (void)initialize
{
    // 设置初始状态
    self.title = @"Flickr Search";
    
    // 基于ViewModel’s searchText的属性创建一个信号（ReactiveCocoa的KVO）
    // distinctUntilChanges保证该信号尽在值基于上一次的值改变时才生效
    RACSignal *validSearchSignal =
    [[RACObserve(self, searchText)
      map:^id(NSString *text) {
        return @(text.length > 3);
    }]
     distinctUntilChanged];
    
    [validSearchSignal subscribeNext:^(id x) {
        NSLog(@"search text is valid %@", x);
    }];
    
    // 当validSearchSignal信号生效时创建一个RACCommand
    self.excuteSearch =
    [[RACCommand alloc] initWithEnabled:validSearchSignal
                            signalBlock:^RACSignal *(id input) {
        return [self excuteSearchSignal];
    }];
}

- (RACSignal *)excuteSearchSignal
{
    return [[[self.services getFlickrSearchService]
             flickrSearchSignal:self.searchText]
             doNext:^(id result) {
                 RWTSearchResultsViewModel *resultsViewModel =
                    [[RWTSearchResultsViewModel alloc] initWithSearchResults:result
                                                                    services:self.services];
                 [self.services pushViewModel:resultsViewModel];
             }];
}

@end

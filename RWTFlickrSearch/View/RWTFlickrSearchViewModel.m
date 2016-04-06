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
    // RACSignal empty将会立即执行, logAll会打印经过该信号的所有事件流（常用语DEBUG）
    return [[[[RACSignal empty] logAll] delay:2.0] logAll];
}

@end

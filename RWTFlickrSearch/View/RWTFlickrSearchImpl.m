//
//  RWTFlickrSearchImpl.m
//  RWTFlickrSearch
//
//  Created by Rabe on 4/6/16.
//  Copyright © 2016 Colin Eberhardt. All rights reserved.
//

#import "RWTFlickrSearchImpl.h"
#import "RWTFlickrPhoto.h"
#import "RWTFlickrSearchResults.h"
#import <objectiveflickr/ObjectiveFlickr.h>
#import <LinqToObjectiveC/NSArray+LinqExtensions.h>

@interface RWTFlickrSearchImpl () <OFFlickrAPIRequestDelegate>

@property (nonatomic, strong) NSMutableSet *requests;
@property (nonatomic, strong) OFFlickrAPIContext *flickrContext;

@end

@implementation RWTFlickrSearchImpl

- (instancetype)init
{
    if (self = [super init]) {
        NSString *OFSampleAppAPIKey = @"c254e46ed91750bf2826875964b066eb";
        NSString *OFSampleAppAPISharedSecret = @"f53bfe64f46a3fc6";
        
        _flickrContext = [[OFFlickrAPIContext alloc] initWithAPIKey:OFSampleAppAPIKey
                                                       sharedSecret:OFSampleAppAPISharedSecret];
        _requests = [NSMutableSet new];
    }
    return self;
}

- (RACSignal *)flickrSearchSignal:(NSString *)searchString
{
    return [self signalFromAPIMethod:@"flickr.photos.search"
                           arguments:@{@"text": searchString,
                                       @"sort": @"interestingness-desc"}
                           transform:^id(NSDictionary *response) {
    
       RWTFlickrSearchResults *results = [RWTFlickrSearchResults new];
       results.searchString = searchString;
       results.totalResults = [[response valueForKeyPath:@"photos.total"] integerValue];
       
       NSArray *photos = [response valueForKeyPath:@"photos.photo"];
       results.photos = [photos linq_select:^id(NSDictionary *jsonPhoto) {
           RWTFlickrPhoto *photo = [RWTFlickrPhoto new];
           photo.title = [jsonPhoto objectForKey:@"title"];
           photo.identifier = [jsonPhoto objectForKey:@"id"];
           photo.url = [self.flickrContext photoSourceURLFromDictionary:jsonPhoto size:OFFlickrSmallSize];
           
           return photo;
       }];
       return results;
    
    }];
}

- (RACSignal *)flickrImageMetadata:(NSString *)identifier
{
    //TODO:此处为请求图片favorites&comments的API请求
    return nil;
}

- (RACSignal *)signalFromAPIMethod:(NSString *)method
                         arguments:(NSDictionary *)args
                         transform:(id (^)(NSDictionary *response))block
{
    // 1. 创建请求数据信号
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        // 2. 创建Flickr请求对象
        OFFlickrAPIRequest *flickRequest =
            [[OFFlickrAPIRequest alloc] initWithAPIContext:self.flickrContext];
        flickRequest.delegate = self;
        [self.requests addObject:flickRequest];
        
        // 3. 根据Flickr回调委托方法创建一个成功信号（拦截每次响应信号）
        RACSignal *successSignal =
            [self rac_signalForSelector:@selector(flickrAPIRequest:didCompleteWithResponse:)
                           fromProtocol:@protocol(OFFlickrAPIRequestDelegate)];
        
        // 4. 处理响应信号数据
        [[[successSignal map:^id(RACTuple *tuple) {
            // 4.1 返回响应数据第二个参数(即flickrAPIRequest:didCompleteWithResponse:
            // 方法第二个参数 --> the NSDictionary response)
            return tuple.second;
        }]
          // 4.2 转换结构
        map:block]
        subscribeNext:^(id x) {
            // 4.3 将结果发送给信号订阅者
            [subscriber sendNext:x];
            [subscriber sendCompleted];
        }];
        
        // 5. 请求数据
        [flickRequest callAPIMethodWithGET:method arguments:args];
        
        // 6. 该请求完毕后移除之
        return [RACDisposable disposableWithBlock:^{
            [self.requests removeObject:flickRequest];
        }];
    }];
}

@end

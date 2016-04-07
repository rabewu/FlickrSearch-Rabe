//
//  RWTViewModelServicesImpl.m
//  RWTFlickrSearch
//
//  Created by Rabe on 4/6/16.
//  Copyright © 2016 Colin Eberhardt. All rights reserved.
//

#import "RWTViewModelServicesImpl.h"
#import "RWTFlickrSearchImpl.h"
#import "RWTSearchResultsViewController.h"

@interface RWTViewModelServicesImpl ()

@property (nonatomic, strong) RWTFlickrSearchImpl *searchService;
@property (nonatomic, weak) UINavigationController *navigationController;

@end

@implementation RWTViewModelServicesImpl

- (instancetype)initWithNavigationController:(UINavigationController *)navigationController
{
    if (self = [super init]) {
        _searchService = [RWTFlickrSearchImpl new];
        _navigationController = navigationController;
    }
    return self;
}

- (id<RWTFlickrSearch>)getFlickrSearchService
{
    return self.searchService;
}

- (void)pushViewModel:(id)viewModel
{
    id viewController;
    
    if ([viewModel isKindOfClass:RWTSearchResultsViewModel.class]) {
        viewController = [[RWTSearchResultsViewController alloc] initWithViewModel:viewModel];
    }
    else {
        NSLog(@"an unkown ViewModel was pushed!");
    }
    [self.navigationController pushViewController:viewController animated:YES];
}

@end

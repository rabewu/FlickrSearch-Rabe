//
//  Created by Colin Eberhardt on 13/04/2014.
//  Copyright (c) 2014 Colin Eberhardt. All rights reserved.
//

#import "RWTFlickrSearchViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface RWTFlickrSearchViewController ()

@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (weak, nonatomic) IBOutlet UITableView *searchHistoryTable;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingIndicator;
//This is a weak reference; the View references the ViewModel, but doesn’t own it
@property (weak, nonatomic) RWTFlickrSearchViewModel *viewModel;

@end

@implementation RWTFlickrSearchViewController

#pragma mark - Life Cycle
- (instancetype)initWithViewModel:(RWTFlickrSearchViewModel *)viewModel
{
    if (self = [super init]) {
        _viewModel = viewModel;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.edgesForExtendedLayout = UIRectEdgeNone;

    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    [self bindViewModel];
}

// 数据绑定 
- (void)bindViewModel
{
    self.title = self.viewModel.title;
    self.searchTextField.text = self.viewModel.searchText;
}

@end

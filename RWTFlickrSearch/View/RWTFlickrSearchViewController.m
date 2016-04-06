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
// weak弱引用; 视图控制器reference(引用)ViewModel, 但并不own it.
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
    // 利用RAC宏将searchTextField的rac_textSignal信号与_viewModel的searchText属性绑定 
    RAC(self.viewModel, searchText) = self.searchTextField.rac_textSignal;
    // 将UI操作excuteSearch与searchButton绑定
    self.searchButton.rac_command = self.viewModel.excuteSearch;
}

@end

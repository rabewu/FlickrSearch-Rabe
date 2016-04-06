//
//  Created by Colin Eberhardt on 13/04/2014.
//  Copyright (c) 2014 Colin Eberhardt. All rights reserved.
//  The main screen of the application, which contains a search text field and the ‘Go’ button

@import UIKit;
#import "RWTFlickrSearchViewModel.h"

@class RWTFlickrSearchViewModel;

@interface RWTFlickrSearchViewController : UIViewController

- (instancetype)initWithViewModel:(RWTFlickrSearchViewModel *)viewModel;

@end

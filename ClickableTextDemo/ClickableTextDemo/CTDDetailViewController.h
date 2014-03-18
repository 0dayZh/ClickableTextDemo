//
//  CTDDetailViewController.h
//  ClickableTextDemo
//
//  Created by 0day on 14-3-18.
//  Copyright (c) 2014年 0dayzh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CTDDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end

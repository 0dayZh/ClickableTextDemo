//
//  CTDMasterTableViewController.m
//  ClickableTextDemo
//
//  Created by 0day on 14-3-20.
//  Copyright (c) 2014年 0dayzh. All rights reserved.
//

#import "CTDMasterTableViewController.h"

#import "CTDDetailViewController.h"

@interface CTDMasterTableViewController ()

@property (nonatomic, strong) NSArray   *testData;

@end

@implementation CTDMasterTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.testData = @[
                      @"English, 简体中文，繁體中文。\n18611011011，\n邮箱：0day.zh@gmail.com，\n链接：\n\tgoogle.com, \n\twww.google.com, \n\thttp://google.com",
                      ];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.testData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.testData[indexPath.row];
    
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        CTDDetailViewController *detailViewController = (CTDDetailViewController *)segue.destinationViewController;
        detailViewController.content = self.testData[indexPath.row];
    }
}

@end

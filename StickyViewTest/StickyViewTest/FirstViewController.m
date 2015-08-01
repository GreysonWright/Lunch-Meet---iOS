//
//  FirstViewController.m
//  Test
//
//  Created by Greyson Wright on 7/29/15.
//  Copyright © 2015 uacaps. All rights reserved.
//

#import "FirstViewController.h"
#import "TableViewCell.h"
#import "ButtonTableViewCell.h"

@interface FirstViewController () {
	
	UITableViewCell *_topCell;
	CGFloat originY;

}

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIView *bottomNavView;
@property (strong, nonatomic) IBOutlet UIView *navigationBar;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
	[self.tableView registerNib: [UINib nibWithNibName: @"TableViewCell" bundle:nil] forCellReuseIdentifier: @"Cell"];
	[self.tableView registerNib: [UINib nibWithNibName: @"ButtonTableViewCell" bundle:nil] forCellReuseIdentifier: @"ButtonCell"];
	
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear: animated];
	
	self.tableView.contentInset = UIEdgeInsetsMake(self.bottomNavView.frame.size.height, self.tableView.contentInset.left, self.tableView.contentInset.bottom, self.tableView.contentInset.right);
	originY = self.navigationBar.frame.origin.y + self.navigationBar.frame.size.height;
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(nonnull UIScrollView *)scrollView {
	
	CGPoint point = scrollView.contentOffset;
	
	NSLog(@"%f, %f", point.y, self.navigationBar.frame.origin.y + self.navigationBar.frame.size.height);
	self.bottomNavView.frame = CGRectMake(self.bottomNavView.frame.origin.x, MIN((point.y * -1) - (58), originY), self.bottomNavView.frame.size.width, self.bottomNavView.frame.size.height);
	
}

- (CGFloat)tableView:(nonnull UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
	
	return 44;
	
}

- (NSInteger)numberOfSectionsInTableView:(nonnull UITableView *)tableView {
	
	return 6;
	
}

- (CGFloat)tableView:(nonnull UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
	
	if (section == 0) {
		
		return 1;
		
	}
	
	return 10;
	
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	if (section == 0) {
		
		return 3;
		
	} else if (section == 1) {
	
		return 5;
		
	} else if (section == 2) {
		
		return 6;
		
	}
	
	return 1;
	
}

- (UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
	
	if (indexPath.section >= 3) {
		
		ButtonTableViewCell *buttonCell = [tableView dequeueReusableCellWithIdentifier: @"ButtonCell" forIndexPath:indexPath];
		
		return buttonCell;
		
	}
	
	TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"Cell" forIndexPath:indexPath];
	
	cell.textField.placeholder = [NSString stringWithFormat: @"Field %lu", indexPath.row];
	
	if ((indexPath.section == 0 && indexPath.row != 2) || (indexPath.section == 1 && indexPath.row != 4) || (indexPath.section == 2 && indexPath.row != 5)) {
		
		cell.shouldAddBorder = YES;
		
	} else {
		
		cell.shouldAddBorder = NO;
		
	}
	
	if (indexPath.row == 0) {
		
		_topCell = cell;
		
	}
	
	return cell;
	
}

@end

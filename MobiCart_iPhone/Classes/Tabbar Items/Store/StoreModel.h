//
//  StoreModel.h
//  Mobicart
//
//  Created by Mobicart on 05/05/09.
//  Copyright 2009 Mobicart. All rights reserved.

#import <UIKit/UIKit.h>

@interface StoreModel : UIViewController<UISearchBarDelegate>
{
    UIView *contentView;
	UITableView *tableView;
	NSMutableArray *showArray;
	NSMutableArray *showNoArray, *arrDeptIDs, *showArray_Searched, *showNoArray_Searched, *arrDeptIDs_Searched,*arrNumberofProducts,*arrNumberofProducts_Search;
	UISearchBar *_searchBar;
	UILabel *lblCart;
}
- (void)fetchDataFromServer;

@end

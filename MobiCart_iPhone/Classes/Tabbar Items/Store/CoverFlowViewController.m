//
//  CoverFlowViewController.m
//  CoverFlow
//
//  Created by Mobicart on 4/7/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import "CoverFlowViewController.h"
#import "Constants.h"
#import "ProductModel.h"
#import "ProductSingleton.h"

@implementation CoverFlowViewController



@synthesize arrImages, dataForProductImage,tempdic;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.titleView = [GlobalPreferences createLogoImage];
    
    
    coverflowBackView=[[UIView alloc] initWithFrame:[GlobalPreferences setDimensionsAsPerScreenSize:CGRectMake(0, 0, 320, 400) chageHieght:YES]];
    coverflowBackView.backgroundColor=[UIColor blackColor];
    [self.view addSubview:coverflowBackView];
    
    
    viewAF=[[AFOpenFlowView alloc]initWithFrame:[GlobalPreferences setDimensionsAsPerScreenSize:CGRectMake(0,-15,320,400) chageHieght:YES]];
	viewAF.dataSource=self;
	viewAF.viewDelegate=self;
	[coverflowBackView addSubview:viewAF];
    
    [self LoadCoverflow];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}
#pragma mark LoadCoverflow
-(void)LoadCoverflow
{
    for(int j=0;j<[arrImages  count];j++)
	{
        dataForProductImage= [[iProductSingleton productObj] setProductImage:arrImages picToShowAtAIndex:j];
        UIImage *result=[UIImage  imageWithData:dataForProductImage];
        [viewAF setImage:result forIndex:j];
    }
	[viewAF setNumberOfImages:[arrImages count]];
    
}
-(void)openFlowView: (AFOpenFlowView *)openFlowView selectionDidChange:(int)index
{
    
}

- (void)openFlowView: (AFOpenFlowView *)openFlowView imageSelected:(int)index
{
    [[iProductSingleton productObj] setProductImage:arrImages picToShowAtAIndex:index];
}

-(void)viewWillAppear:(BOOL)animated
{
	[self performSelectorOnMainThread:@selector(hideIndicator) withObject:nil waitUntilDone:NO];
}
- (void)dealloc
{
    [super dealloc];
}


-(void)hideIndicator
{
	if (loadingActionSheet1)
    {
        [loadingActionSheet1 dismissWithClickedButtonIndex:0 animated:YES];
    }
}
@end

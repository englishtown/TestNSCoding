//
//  ViewController.m
//  TestNSCoding
//
//  Created by Lin Shi on 5/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "MyObject.h"
#import "MyObjects.h"

#import <QuartzCore/QuartzCore.h>


@interface ViewController ()<UITableViewDataSource , UITableViewDelegate>{
    UITableView *myTableView;
    
    NSMutableArray *myObjects;
    
    //MyObjects *objs = 
    UIView *targetView;
}

@end

@implementation ViewController

- (NSString*) filePathToArchive{
    NSArray *filePath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *file = [NSString stringWithFormat:@"%@/%@", [filePath lastObject] , @"myobj" ];
    return file;
}

- (void) add:(id)sender{
    if (!myObjects) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:[self filePathToArchive]]) {
            NSData *data = [[NSData alloc] initWithContentsOfFile:[self filePathToArchive]];
            myObjects = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        }else {
            myObjects = [NSMutableArray array];
        }
    }
    
    
    MyObject *newObj = [[MyObject alloc] init];
    static int count = 0;
    newObj.myId = [NSString stringWithFormat:@"id%d",count++];
    
    NSLog(@"myobjects %@", myObjects);
    
    [myObjects addObject:newObj];
    
    [myTableView reloadData];
}

- (void) save:(id)sender{

    if (myObjects) {
        
        NSLog(@"%s file %@",__PRETTY_FUNCTION__ , [self filePathToArchive]);
        [NSKeyedArchiver archiveRootObject:myObjects toFile:[self filePathToArchive]];
    }
}


- (void) testNSCodingCase{
    self.view.backgroundColor = [UIColor blueColor];
    
    if (!myTableView) {
        myTableView = [[UITableView alloc] initWithFrame:FULLSCREEN style:UITableViewStylePlain];
        myTableView.dataSource = self;
        myTableView.delegate = self;
    }
    
    self.navigationController.navigationBarHidden = NO;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add:)];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(save:)];
    
    [self.view addSubview:myTableView];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self testNSCodingCase];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
//    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
//        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
//    } else {
//        return YES;
//    }
//    
    return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [myObjects count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mycell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mycell"];
    }
    cell.textLabel.text = [[myObjects objectAtIndex:indexPath.row] myId];
    return cell;
}

@end

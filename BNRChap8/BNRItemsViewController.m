//
//  BNRItemsViewController.m
//  
//
//  Created by Douglas Voss on 4/15/15.
//
//

#import "BNRItemsViewController.h"
#import "BNRItemStore.h"
#import "BNRItem.h"

@interface BNRItemsViewController () <UITableViewDataSource>

@end

@implementation BNRItemsViewController

- (instancetype)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        for (int i = 0; i < 5; i++) {
            [[BNRItemStore sharedStore] createItem];
        }
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSLog(@"numberOfSections 2");
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return @"Low Value";
    } else {
        return @"High Value";
    }
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    BNRItemStore *itemStore = [BNRItemStore sharedStore];
    NSLog(@"numberOfRowsInSection section==%d", section);
    if (section == 0) {
        return [[itemStore itemsLessThan50] count];
    } else {
        return [[itemStore itemsGreaterThanOrEqualTo50] count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
    //                                               reuseIdentifier:@"UITableViewCell"];
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                                  forIndexPath:indexPath];
    
    BNRItemStore *itemStore = [BNRItemStore sharedStore];
    NSArray *itemsLowValue = [itemStore itemsLessThan50];
    NSArray *itemsHighValue = [itemStore itemsGreaterThanOrEqualTo50];

    BNRItem *item;
    if (indexPath.section==0) {
        item = itemsLowValue[indexPath.row];
    } else {
        item = itemsHighValue[indexPath.row];
    }
    
    cell.textLabel.text = [item description];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

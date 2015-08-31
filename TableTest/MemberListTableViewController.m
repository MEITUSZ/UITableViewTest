//
//  MemberListTableViewController.m
//  TableTest
//
//  Created by Jc on 15/8/31.
//  Copyright (c) 2015年 Jc. All rights reserved.
//

#import "MemberListTableViewController.h"
#import "User.h"

@interface MemberListTableViewController ()

@property (nonatomic, retain) UILocalizedIndexedCollation *collation;
@property (nonatomic, retain)NSMutableArray *usersArray;
@property (nonatomic, retain) NSArray *sectionsArray;

@end

@implementation MemberListTableViewController

@synthesize usersArray,sectionsArray,collation;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

#define NEW_USER(str) [[User alloc]init:str]

- (void)setup
{
    usersArray = [[NSMutableArray alloc]init];
    
    [usersArray addObject:NEW_USER(@"Jack")];
    [usersArray addObject:NEW_USER(@"Andrew")];
    [usersArray addObject:NEW_USER(@"Tomic")];
    [usersArray addObject:NEW_USER(@"Anny")];
    
    self.collation = [UILocalizedIndexedCollation currentCollation];
    
    NSInteger index,sectionTitlesCount = [[collation sectionTitles] count];
    
    //创建临时数组用户，对原始数据进行处理
    NSMutableArray *newSectionsArray = [[NSMutableArray alloc] initWithCapacity:sectionTitlesCount];
    //初始化
    for (index = 0; index < sectionTitlesCount; index++) {
        NSMutableArray *array = [[NSMutableArray alloc]init];
        [newSectionsArray addObject:array];
    }
    
    //对数据进行分类
    for (User *userObj in usersArray) {
        NSInteger sectionNumber = [collation sectionForObject:userObj collationStringSelector:@selector(name)];
        NSMutableArray *sectionUserObjs = [newSectionsArray objectAtIndex:sectionNumber];
        [sectionUserObjs addObject:userObj];
    }
    
    //对数据进行排序
    for (index = 0; index < sectionTitlesCount; index++) {
        NSMutableArray *userObjsArrayForSection = [newSectionsArray objectAtIndex:index];
        NSArray *sortedUserObjsArrayForSection = [collation sortedArrayFromArray:userObjsArrayForSection collationStringSelector:@selector(name)];
        [newSectionsArray replaceObjectAtIndex:index
    withObject:sortedUserObjsArrayForSection];
    }
    
    self.sectionsArray = newSectionsArray;
    
    self.tableView.tableFooterView = [[UIView alloc]init];
    
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return [[collation sectionTitles] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    NSArray *userObjesInSection = [sectionsArray objectAtIndex:section];
    return [userObjesInSection count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *memberID = @"MemberCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:memberID forIndexPath:indexPath];
    NSArray *userNameInSection = [sectionsArray objectAtIndex:indexPath.section];
    User *userObj = [userNameInSection objectAtIndex:indexPath.row];
    
    UILabel *name = (UILabel *)[cell viewWithTag:200];
    name.text = [userObj name];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSArray *userObjsInSection = [sectionsArray objectAtIndex:section];
    if (userObjsInSection == nil || [userObjsInSection count] <= 0) {
        return nil;
    }
    return [[collation sectionTitles] objectAtIndex:section];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return [collation sectionTitles];
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return [collation sectionForSectionIndexTitleAtIndex:index];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  ChatListTableViewController.m
//  TableTest
//
//  Created by Jc on 15/8/31.
//  Copyright (c) 2015年 Jc. All rights reserved.
//

#import "ChatListTableViewController.h"
#import "Message.h"
#import "ChatTableViewCell.h"

@interface ChatListTableViewController ()

@property (nonatomic, copy)NSMutableArray *messageArray;

@property (nonatomic, weak) UIImage *tempImage;
@property (nonatomic, weak) UIImageView *avatar;
@end

@implementation ChatListTableViewController

@synthesize messageArray = _messageArray;

- (void)awakeFromNib
{
    [self setup];
}

- (void) setup
{
    
    Message *messages = [[Message alloc]init];
    _messageArray = messages.messages;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    //self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    //清除多余的线
    self.tableView.tableFooterView = [UIView new];
    
}


#pragma mark - Table view data source


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return _messageArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"ChatCell";
    
    ChatTableViewCell *cell = (ChatTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier
        forIndexPath:indexPath];
    
    Message *msg = _messageArray[indexPath.row];
    [cell setMessageObject:msg];
    
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        // Notice：此处删除，数据的条数和行数要一致
        [_messageArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    
}


// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    if (indexPath.length == 0) {
        return NO;
    }else{
        return YES;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end

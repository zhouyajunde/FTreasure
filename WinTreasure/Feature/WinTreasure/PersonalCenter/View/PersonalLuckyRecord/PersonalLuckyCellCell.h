//
//  PersonalLuckyCellCell.h
//  WinTreasure
//
//  Created by Apple on 16/6/14.
//  Copyright © 2016年 linitial. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LuckyRecordModel.h"

@interface PersonalLuckyCellCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *productImageView;

@property (weak, nonatomic) IBOutlet UILabel *productNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *periodNoLabel;

@property (weak, nonatomic) IBOutlet UILabel *luckyNoLabel;

@property (weak, nonatomic) IBOutlet UILabel *publishTimeLabel;

/**本期参与
 */
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;

@property (strong, nonatomic) LuckyRecordModel *model;

+ (instancetype)cellWithTableView:(UITableView *)tableview;

@end

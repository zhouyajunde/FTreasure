//
//  WinnerInfoCell.m
//  WinTreasure
//
//  Created by Apple on 16/6/27.
//  Copyright © 2016年 linitial. All rights reserved.
//

#import "WinnerInfoCell.h"

@interface WinnerInfoCell ()

@property (weak, nonatomic) IBOutlet UIButton *setButton;

@property (weak, nonatomic) IBOutlet UIView *btnContainer;

@end

@implementation WinnerInfoCell

- (void)awakeFromNib {
    [super awakeFromNib];

    if ([self respondsToSelector:@selector(setLayoutMargins:)]) {
        [self setLayoutMargins:UIEdgeInsetsZero];
    }
    _setButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    CAShapeLayer *topLayer = [CAShapeLayer layer];
    topLayer.origin = CGPointMake(0, 0);
    topLayer.size = CGSizeMake(kScreenWidth, CGFloatFromPixel(1));
    topLayer.backgroundColor = UIColorHex(0xeeeeee).CGColor;
    [_btnContainer.layer addSublayer:topLayer];
    
}

+ (instancetype)cellWithTableView:(UITableView *)tableview {
    static NSString *cellID = @"WinnerInfoCell";
    WinnerInfoCell *cell = [tableview dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = (WinnerInfoCell *)[[[NSBundle mainBundle] loadNibNamed:@"WinnerInfoCell" owner:self options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)setModel:(AddressModel *)model {
    _model = model;
    _nameLabel.text = _model.name;
    _phoneLabel.text = _model.phone;
    _addressLabel.text = _model.address;
}

- (IBAction)clickedPrizeButton:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.selected) {
        if (_delegate&&[_delegate respondsToSelector:@selector(winnerInfoCell:prizeButtonClickedAtIndexPath:)]) {
            [_delegate winnerInfoCell:self prizeButtonClickedAtIndexPath:_indexPath];
        }
    }
}

- (IBAction)edit {
    if (_delegate&&[_delegate respondsToSelector:@selector(winnerInfoCell:editButtonClickedAtIndexPath:)]) {
        [_delegate winnerInfoCell:self editButtonClickedAtIndexPath:_indexPath];
    }
}

- (IBAction)delete {
    if (_delegate&&[_delegate respondsToSelector:@selector(winnerInfoCell:deleteButtonClickedAtIndexPath:)]) {
        [_delegate winnerInfoCell:self deleteButtonClickedAtIndexPath:_indexPath];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

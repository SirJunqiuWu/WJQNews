//
//  HotNewsCell.m
//  WJQNews
//
//  Created by 吴俊秋 on 2017/4/13.
//  Copyright © 2017年 JackWu. All rights reserved.
//

#import "HotNewsCell.h"

@implementation HotNewsCell
{
    UILabel *titleLbl;
}
@synthesize gapline;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

#pragma mark - 创建UI

- (void)setupUI {
//    gapline = [[UIView alloc]init];
//    gapline.backgroundColor = [UIColor blackColor];
//    [self.contentView addSubview:gapline];
    
    titleLbl = [[UILabel alloc]init];
    titleLbl.backgroundColor = [UIColor clearColor];
    titleLbl.textAlignment = NSTextAlignmentLeft;
    titleLbl.textColor = [UIColor blackColor];
    titleLbl.font = [UIFont systemFontOfSize:15];
    titleLbl.numberOfLines = 0;
    [self.contentView addSubview:titleLbl];
    
    [titleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(8);
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
    }];
}

#pragma mark - Setter

- (void)setTitle:(NSString *)title {
    _title = title;
    titleLbl.text = _title;
    [titleLbl mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(8);
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

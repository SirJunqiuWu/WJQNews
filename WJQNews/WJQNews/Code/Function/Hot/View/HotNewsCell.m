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
    titleLbl.lineBreakMode = NSLineBreakByCharWrapping;
    [self.contentView addSubview:titleLbl];
}

#pragma mark - Setter

- (void)setTitle:(NSString *)title {
    _title = title;
    titleLbl.text = _title;
    
    CGSize titleSize = [title getStringSize:[UIFont systemFontOfSize:15] maxWidth:self.contentView.width-20];
    if (titleSize.height <=15)
    {
        titleSize.height = 15;
    }
    titleLbl.frame = CGRectMake(10, 8, klScreenWidth-20, titleSize.height);
}

+(CGFloat)getCellHeightWithTitle:(NSString *)title {
    CGFloat totalH = 0;
    CGSize titleSize = [title getStringSize:[UIFont systemFontOfSize:15] maxWidth:klScreenWidth-20];
    if (titleSize.height <=15)
    {
        titleSize.height = 15;
    }
    totalH=8.0+titleSize.height+8.0;
    return totalH;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end

//
//  NewsCell.m
//  WJQNews
//
//  Created by 吴俊秋 on 2017/4/12.
//  Copyright © 2017年 JackWu. All rights reserved.
//

#import "NewsCell.h"

@implementation NewsCell
{
    UILabel *titleLbl;
    UIView  *gapline;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

#pragma mark - 创建UI

- (void)setupUI {
    self.contentView.width = [UIScreen mainScreen].bounds.size.width;
    
    titleLbl = [[UILabel alloc]init];
    titleLbl.backgroundColor = [UIColor clearColor];
    titleLbl.textAlignment = NSTextAlignmentLeft;
    titleLbl.textColor = [UIColor blackColor];
    titleLbl.font = [UIFont systemFontOfSize:15];
    titleLbl.numberOfLines = 0;
    [self.contentView addSubview:titleLbl];
    
    gapline = [[UIView alloc]init];
    gapline.backgroundColor = [UIColor grayColor];
//    [self.contentView addSubview:gapline];
    
    [titleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(8);
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
    }];
    
//    [gapline mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo([NSNumber numberWithFloat:(self.contentView.height-1)]);
//        make.left.equalTo(self.contentView.mas_left);
//        make.width.equalTo(self.contentView.mas_width);
//        make.height.equalTo(@1);
//    }];
}

#pragma mark - Setter

- (void)setNews:(WJQNews *)news {
    _news = news;
    titleLbl.text = _news.title;
    
    //先移除掉父视图上的图片视图
    for(UIView *obj in self.contentView.subviews)
    {
        if ([obj isKindOfClass:[UIImageView class]])
        {
            [obj removeFromSuperview];
        }
    }
    
    //再创建，根据图片的张数确定显示样式
    if (_news.images.count >0)
    {
        if (_news.images.count >1)
        {
            UIView *lastView = nil;
            //多张情况下
            for (int i = 0; i <_news.images.count; i++)
            {
                UIImageView *imageView = [[UIImageView alloc]init];
                imageView.backgroundColor = [UIColor clearColor];
                imageView.contentMode = UIViewContentModeScaleAspectFit;
                [self.contentView addSubview:imageView];
                
                NSDictionary *tpDic = _news.images[i];
                NSURL *tpURL = [NSURL URLWithString:[tpDic getStringValueForKey:@"ImgPath"]];
                [imageView sd_setImageWithURL:tpURL placeholderImage:nil options:SDWebImageProgressiveDownload];
                if (i == 0)
                {
                    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.top.equalTo(titleLbl.mas_bottom).offset(8);
                        make.left.equalTo(self.contentView.mas_left).offset(10);
                        make.width.equalTo([NSNumber numberWithFloat:(self.contentView.width-10*2-8*2)/3.0]);
                        make.height.equalTo(imageView.mas_width).multipliedBy(0.75);
                    }];
                }
                else
                {
                    //位置相对于左边上一个视图的位置
                    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.top.equalTo(titleLbl.mas_bottom).offset(8);
                        make.left.equalTo(lastView.mas_right).offset(8);
                        make.width.equalTo(lastView.mas_width);
                        make.height.equalTo(lastView.mas_height);
                    }];
                    
                }
                lastView = imageView;
            }
            
            //重置标题标签的位置(注意重新约束的方法)
            [titleLbl mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.contentView.mas_top).offset(8);
                make.left.equalTo(self.contentView.mas_left).offset(10);
                make.right.equalTo(self.contentView.mas_right).offset(-10);
            }];
        }
        else
        {
            //单张情况下
            UIImageView *imageView = [[UIImageView alloc]init];
            imageView.backgroundColor = [UIColor clearColor];
            imageView.contentMode = UIViewContentModeScaleAspectFit;
            [self.contentView addSubview:imageView];
            
            NSDictionary *tpDic = _news.images[0];
            NSURL *tpURL = [NSURL URLWithString:[tpDic getStringValueForKey:@"ImgPath"]];
            [imageView sd_setImageWithURL:tpURL placeholderImage:nil options:SDWebImageProgressiveDownload];
            
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.contentView.mas_top).offset(8);
                make.left.equalTo(self.contentView.mas_left).offset(10);
                make.width.equalTo([NSNumber numberWithFloat:(self.contentView.width-10.0*2-8.0*2)/3.0]);
                make.height.equalTo(imageView.mas_width).multipliedBy(0.75);
            }];
            
            //标题重新约束(在图片的右边,注意重新约束的方法)
            [titleLbl mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.contentView.mas_top).offset(8);
                make.left.equalTo(imageView.mas_right).offset(8);
                make.right.equalTo(self.contentView.mas_right).offset(-10);
            }];
        }
//        [gapline mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo([NSNumber numberWithFloat:(self.contentView.height-1)]);
//            make.left.equalTo(self.contentView.mas_left);
//            make.width.equalTo(self.contentView.mas_width);
//            make.height.equalTo(@1);
//        }];
    }
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

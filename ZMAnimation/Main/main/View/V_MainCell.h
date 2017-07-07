//
//  V_MainCell.h
//  ZMAnimation
//
//  Created by 圣光大人 on 2017/7/6.
//  Copyright © 2017年 圣光大人. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface V_MainCell : UITableViewCell

@property(nonatomic,strong)UILabel * lab_FirstTitle;
@property(nonatomic,strong)UILabel * lab_SecondTitle;

+(instancetype)initWithTableView:(UITableView *)tableView ID:(NSString *)ID;
@end

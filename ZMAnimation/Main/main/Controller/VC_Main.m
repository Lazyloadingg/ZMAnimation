//
//  ViewController.m
//  ZMAnimation
//
//  Created by 圣光大人 on 2017/7/6.
//  Copyright © 2017年 圣光大人. All rights reserved.
//

#import "VC_Main.h"
#import "V_MainCell.h"
#import "M_MainTableView.h"
#import "ZMHead.h"
@interface VC_Main ()
<
UITableViewDelegate,
UITableViewDataSource
>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSArray * arr_Model;
@end

static NSString * const MainTableViewCellID = @"MainTableViewCellID";
@implementation VC_Main

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDefaultsSetting];
    [self initSubViews];
}

#pragma mark --> 🐷 tableview delegate 🐷
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arr_Model.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    V_MainCell * cell = [V_MainCell initWithTableView:tableView ID:MainTableViewCellID];

    M_MainTableView * model = self.arr_Model[indexPath.row];
    cell.lab_FirstTitle.text = [NSString stringWithFormat:@"%02ld.%@",indexPath.row + 1,model.str_title];
    cell.lab_SecondTitle.text =model.str_subtitle;
    
    if (indexPath.row%2 == 1)cell.contentView.backgroundColor = [[UIColor grayColor]colorWithAlphaComponent:0.05];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    M_MainTableView * model  = self.arr_Model[indexPath.row];
    ZMBaseViewController * vc = [[model.targetVC alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}
#pragma mark  --> 🐷 加载默认设置 🐷
-(void)loadDefaultsSetting{
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"Main";
}
-(void)initSubViews{
    UITableView * tableview = [[UITableView alloc]initWithFrame:self.view.bounds];
    tableview.delegate = self;
    tableview.dataSource = self;
    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableview];
}
#pragma mark --> 🐷 lazy load 🐷
-(NSArray *)arr_Model{
    if (!_arr_Model) {
        _arr_Model = @[
                       [M_MainTableView initWIthClass:[VC_Login class] title:@"登录页面"],
                       [M_MainTableView initWIthClass:[VC_LineChartAnimation class] title:@"心电图"],
                       [M_MainTableView initWIthClass:[VC_Neure class] title:@"神经元"],
                       [M_MainTableView initWIthClass:[VC_CollectionMove class] title:@"collectionView移动"],
                       [M_MainTableView initWIthClass:[VC_Electric class] title:@"圆形进度条"]
                       ];
    }
    return _arr_Model;
}
@end

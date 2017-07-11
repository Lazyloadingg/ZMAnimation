//
//  VC_CollectionMove.m
//  ZMAnimation
//
//  Created by Mac2 on 2017/7/10.
//  Copyright © 2017年 圣光大人. All rights reserved.
//

#import "VC_CollectionMove.h"
#import "ZMHead.h"

@interface VC_CollectionMove ()
<
UICollectionViewDelegate,
UICollectionViewDataSource
>
@property(nonatomic,strong)UICollectionView * v_collection;
@end
static NSString * const MoveItemID = @"MoveItemID";
@implementation VC_CollectionMove

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initSubviews];
}

#pragma mark >_<! 👉🏻 🐷Life cycle🐷
#pragma mark >_<! 👉🏻 🐷System Delegate🐷
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 15;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell * item = [collectionView dequeueReusableCellWithReuseIdentifier:MoveItemID forIndexPath:indexPath];
    item.contentView.backgroundColor = randomColor;
    
    return item;
}
-(BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
//移动Item必须实现方法
-(void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    
}
#pragma mark >_<! 👉🏻 🐷Custom Delegate🐷
#pragma mark >_<! 👉🏻 🐷Event  Response🐷
-(void)MoveItem:(UILongPressGestureRecognizer *)sender{
    ZMLog(@"%@",sender.view);
    CGPoint point = [sender locationInView:self.v_collection];
    NSIndexPath * indexPath = [self.v_collection indexPathForItemAtPoint:point];
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
            if (!indexPath)break;
            [self.v_collection beginInteractiveMovementForItemAtIndexPath:indexPath];
            break;
            
        case UIGestureRecognizerStateChanged:
            [self.v_collection updateInteractiveMovementTargetPosition:point];
            break;
            
        case UIGestureRecognizerStateEnded:
            [self.v_collection endInteractiveMovement];
            break;
            
        default:
            [self.v_collection cancelInteractiveMovement];
            break;
    }
}
#pragma mark >_<! 👉🏻 🐷Private Methods🐷

#pragma mark >_<! 👉🏻 🐷Lazy loading🐷

#pragma mark >_<! 👉🏻 🐷Init SubViews🐷
-(void)initSubviews{
    
    UICollectionViewFlowLayout * layout  = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake((MainScreen_Width-30)/3, (MainScreen_Height-40)/4);
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    UICollectionView * v_collection = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    [ v_collection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:MoveItemID];
    v_collection.delegate = self;
    v_collection.dataSource = self;
//    v_collection.pagingEnabled = YES;
    v_collection.backgroundColor = [UIColor whiteColor];
    self.v_collection = v_collection;
    [self.view addSubview:v_collection];
    
    UILongPressGestureRecognizer * longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(MoveItem:)];
    [self.v_collection addGestureRecognizer:longPress];
}
@end

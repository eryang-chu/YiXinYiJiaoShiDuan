//
//  IJXF_AdvertisingView.m
//  新项目
//
//  Created by 陶洋 on 2017/10/19.
//  Copyright © 2017年 陶洋. All rights reserved.
//

#import "IJXF_AdvertisingView.h"
#import "UIImageView+WebCache.h"
//#import "IJXF_Banner.h"
@implementation IJXF_AdvertisingView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self _init];
        
    }
    return self;
}

-(void)awakeFromNib{
    
    [super awakeFromNib];
    
    [self _init];
    
}


//初始化
-(void)_init{
    
    
    _dataArray=[[NSMutableArray alloc]init];
    _imageViewArray=[NSMutableArray array];
    _index=0;
    self.directionalLockEnabled = YES;                            //只能一个方向滑动
    self.pagingEnabled = YES;                                     //是否翻页
    self.showsVerticalScrollIndicator =NO;                        //垂直方向的滚动指示
    self.backgroundColor=[UIColor whiteColor];
    self.indicatorStyle = UIScrollViewIndicatorStyleWhite;        //滚动指示的风格
    self.showsHorizontalScrollIndicator = NO;                    //水平方向的滚动指示
    self.delegate=self;
    
    
    //title
    _title=[[UILabel alloc] initWithFrame:CGRectMake(16,self.frame.size.height+10, 200, 33)];
    [_title setTextColor:[UIColor whiteColor]];
    _title.backgroundColor=[UIColor clearColor];
    _title.font=[UIFont systemFontOfSize:13];
    //_title.text=@"艾美世界，精彩无限!";
    
    //分页控制器
    float j = 120;
    _pageControl=[[UIPageControl alloc] initWithFrame:CGRectMake((DEVICE_WIDTH-j)/2,self.frame.size.height+self.frame.origin.y-20,j, 20)];
    _pageControl.backgroundColor=[UIColor clearColor];
    _pageControl.numberOfPages=0;
    _pageControl.currentPage=0;
    _pageControl.userInteractionEnabled=NO;
    
    _tips=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, 21)];
    _tips.text=@"暂无图片";
    _tips.textColor=[UIColor whiteColor];
    _tips.backgroundColor=[UIColor clearColor];
    _tips.textAlignment=NSTextAlignmentCenter;
    _tips.center=self.center;
    [self addSubview:_tips];
    
    
    
}

-(void)_loadDataWithImageArray:(NSArray *)array targetView:(UIView *)view{
    
    [self _createAdvertisingArray:array Type:1 targetView:view];
    
}

//网络图片加载
-(void)_loadDataWithUrlArray:(NSArray *)array targetView:(UIView *)view{
    
    [self _createAdvertisingArray:array Type:2 targetView:view];
    
}

//创建轮播视图 1是本地图片 2是网络图片
-(void)_createAdvertisingArray:(NSArray *)array Type:(int)type targetView:(UIView *)view{
    
    
    [self _removeImage];
    
    [_dataArray addObjectsFromArray:array];
    
    if (_dataArray.count==0) {
        
        [self _noImage];
        return;
        
    }else{
        
        self.alpha=1;
        _tips.alpha=0;
        
    }
    
    NSMutableArray *tempArray=[NSMutableArray arrayWithArray:_dataArray];
    [tempArray insertObject:[_dataArray objectAtIndex:([_dataArray count]-1)] atIndex:0];
    [tempArray addObject:[_dataArray objectAtIndex:0]];
    [_dataArray removeAllObjects];
    [_dataArray addObjectsFromArray:tempArray];
    
    //创建图片
    for (int i=0; i<_dataArray.count; i++) {
        
        UIImageView *imgView=[[UIImageView alloc] initWithFrame:CGRectMake(DEVICE_WIDTH * i,0, DEVICE_WIDTH,self.frame.size.height)];
        [_imageViewArray addObject:imgView];
        if (type==1) {
            
            //本地图片
            UIImage *img=[UIImage imageNamed:[_dataArray objectAtIndex:i]];
            imgView.image=img;
            
            
        }else{
            NSString *strUrl = nil;
//            if ([_dataArray[i]isKindOfClass:[IJXF_Banner class]]) {
//
//                 IJXF_Banner *banner=(IJXF_Banner *)[_dataArray objectAtIndex:i];
//                 strUrl=banner.imageUrl;
//            }else{
//                strUrl=_dataArray[i];
//            }
            strUrl=_dataArray[i];
            NSURL *url=[NSURL URLWithString:strUrl];
            __block UIActivityIndicatorView *activityIndicatorView=[[UIActivityIndicatorView alloc] init];
            activityIndicatorView.center=imgView.center;
            activityIndicatorView.color=[UIColor grayColor];
            [activityIndicatorView startAnimating];
            [imgView addSubview:activityIndicatorView];
            
            [imgView sd_setImageWithURL:url placeholderImage:[UIImage rectanglePlaceHolder] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                
                [activityIndicatorView stopAnimating];
                [activityIndicatorView removeFromSuperview];
                NSLog(@"图片加载完成");
            }];
        }
        imgView.contentMode = UIViewContentModeScaleAspectFill;
        imgView.clipsToBounds=YES;
        
        imgView.userInteractionEnabled=YES;
        //imgView.clipsToBounds = YES;
        //imgView.contentMode=UIViewContentModeScaleAspectFill;
        [self addSubview:imgView];
        
        [self setContentOffset:CGPointMake(DEVICE_WIDTH, 0)];
        
        //给图片加点击手势
        UITapGestureRecognizer *single=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickImage:)];
        imgView.tag=100+i;
        single.numberOfTapsRequired=1;
        [imgView addGestureRecognizer:single];
        
    }
    
    [view addSubview:_bottomBg];
    [view addSubview:_title];
    [view addSubview:_pageControl];
    
    if (_dataArray.count>1) {
        
        _pageControl.numberOfPages=_dataArray.count-2;
    }
    
    
    if (_textArray.count>0) {
        
        _title.text=[_textArray objectAtIndex:0];
    }
    
    _pageControl.currentPage=0;
    self.contentSize=CGSizeMake(DEVICE_WIDTH*_dataArray.count,self.frame.size.height); //滑动的范围
}

//没有图片的情况
-(void)_noImage{
    
    UIImageView *imgView=[[UIImageView alloc] initWithFrame:CGRectMake(0,0,DEVICE_WIDTH,self.frame.size.height)];
    imgView.image=[UIImage imageNamed:@"IMG_0970.JPG"];
    [self addSubview:imgView];
    
}

//清除
-(void)_removeImage{
    
    if (_dataArray.count>0) {
        [_dataArray removeAllObjects];
        _pageControl.numberOfPages=0;
        //        _pageControl.currentPage=0;
        self.contentSize=CGSizeMake(DEVICE_WIDTH*1,self.frame.size.height); //滑动的范围
        
        for (int i=0; i<_imageViewArray.count; i++) {
            
            UIImageView *imageView=[_imageViewArray objectAtIndex:i];
            [imageView removeFromSuperview];
        }
        
        [_imageViewArray removeAllObjects];
        
    }
    
}

//开始动画
-(void)_startAnimation{
    
    if (_Timer==nil && _Timer.isValid==NO ) {
        
        NSLog(@"ad--开始动画");
        
        _Timer=[NSTimer scheduledTimerWithTimeInterval:4.0 target:self selector:@selector(_changeAnimation) userInfo:nil repeats:YES];
    }
    
}
//停止动画
-(void)_stopAnimation{
    
    NSLog(@"ad--停止动画");
    //停止动画
    [_Timer invalidate];
    _Timer=nil;
    
}


-(void)_changeAnimation{
   
    CGPoint newScrollViewContentOffset = self.contentOffset;
    int page=newScrollViewContentOffset.x/DEVICE_WIDTH+1;//当前这一页
    
    newScrollViewContentOffset.x=DEVICE_WIDTH*page;
    [self setContentOffset:newScrollViewContentOffset animated:YES];

    if (page==_dataArray.count) {
        [self setContentOffset:CGPointMake(DEVICE_WIDTH, 0)];
    }
    
//    if (_index<_dataArray.count) {
//
//    }else{
//
//        _index=0;
//    }
//
//    //切换文字
//    if (_index<_textArray.count) {
//
//        _title.text=[_textArray objectAtIndex:_index];
//    }
//
//    [self setContentOffset:CGPointMake(DEVICE_WIDTH*_index, self.contentOffset.y) animated:YES];
//    _pageControl.currentPage=_index;
//
//    _index++;
}



-(void)clickImage:(UITapGestureRecognizer *)g{
    
    NSInteger index=g.view.tag-100;
    if (index ==0) {
        index=_dataArray.count-1;
    }else if (index==_dataArray.count-1) {
        index=0;
    }else{
        index=index-1;
    }
//    NSLog(@"%ld",(long)index);
    [self.myDelegate advertisingView:self clickImageIndex:index];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat pageWidth = scrollView.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    currentPageIndex=page;

    _pageControl.currentPage=page-1;
    if (page==_dataArray.count-1) {
        _pageControl.currentPage=0;
    }
    if (page==0) {
        _pageControl.currentPage=_dataArray.count-2;
    }

    NSDate *date=[NSDate dateWithTimeInterval:5 sinceDate:[NSDate date]];
    [_Timer setFireDate:date];
    
}

//减速滚动时触发
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    if (currentPageIndex==0) {
        
        [self setContentOffset:CGPointMake(([_dataArray count]-2)*DEVICE_WIDTH, 0)];
    }
    if (currentPageIndex==([_dataArray count]-1)) {
        
        [self setContentOffset:CGPointMake(DEVICE_WIDTH, 0)];
        
    }
    NSDate *date=[NSDate dateWithTimeInterval:5 sinceDate:[NSDate date]];
    [_Timer setFireDate:date];
    if ([self.myDelegate respondsToSelector:@selector(didScrollEnd:clickImageIndex:)]) {
         [self.myDelegate didScrollEnd:self clickImageIndex:currentPageIndex];
    }
}

@end

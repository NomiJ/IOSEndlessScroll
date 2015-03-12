//
//  ViewController.m
//  zigzag
//
//  Created by Nomi on 13/03/2015.
//  Copyright (c) 2015 SystematicBytes. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    UIScrollView *scrollView;
    UIView *fv;
    UIView *sv;
    UIView *tv;
    
    UIView *toCheck;
    UIView *toChangePosition;
    
    
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    // Do any additional setup after loading the view, typically from a nib.
    scrollView =
    [[UIScrollView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/4, self.view.frame.size.height/4, self.view.frame.size.width/2, self.view.frame.size.height/2)];
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width/2, 3*self.view.frame.size.height/2);
    scrollView.contentOffset = CGPointMake(0, 0);
    scrollView.showsVerticalScrollIndicator = true;
    scrollView.showsHorizontalScrollIndicator = false;
    scrollView.pagingEnabled = false;
    scrollView.backgroundColor = [UIColor whiteColor];
    scrollView.delegate = self;
    
    fv = [[UIView alloc] initWithFrame:CGRectMake(5, 5, self.view.frame.size.width/2-10, self.view.frame.size.height/2-10)];
    fv.backgroundColor = [UIColor greenColor];
    CGRect fvr = fv.frame;
    fvr.origin.y +=self.view.frame.size.height/2-10;
    sv = [[UIView alloc] initWithFrame:fvr];
    
    sv.backgroundColor = [UIColor purpleColor];
    
    CGRect svr = sv.frame;
    svr.origin.y +=self.view.frame.size.height/2-10;
    tv = [[UIView alloc] initWithFrame:svr];
    
    tv.backgroundColor = [UIColor redColor];
    
    
    [scrollView addSubview:fv];
    [scrollView addSubview:sv];
    [scrollView addSubview:tv];

    toCheck = tv;
    toChangePosition = fv;
    
    [self.view addSubview:scrollView];
    
}
- (void)scrollViewDidScroll:(UIScrollView *)sview
{
    CGRect thePosition =  toCheck.frame;
    CGRect container = CGRectMake(sview.contentOffset.x, sview.contentOffset.y, sview.frame.size.width, sview.frame.size.height);
    if(CGRectIntersectsRect(thePosition, container))
    {
        
        
        CGRect r = toCheck.frame;
        r.origin.y +=self.view.frame.size.height/2-10;
        toChangePosition.frame= r;

        toCheck =toChangePosition;

        
        
       if(toChangePosition == fv)
           toChangePosition = sv;
        else if (toChangePosition == sv)
            toChangePosition = tv;
        else if(toChangePosition == tv)
            toChangePosition = fv;
    
        scrollView.contentSize = CGSizeMake(scrollView.contentSize.width, scrollView.contentSize.height);

    }
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

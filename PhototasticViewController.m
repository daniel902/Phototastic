//
//  PhototasticViewController.m
//  Project6
//
//  Created by superman on 2/10/15.
//  Copyright (c) 2015 superman. All rights reserved.
//

#import "PhototasticViewController.h"
#import "KASlideShow.h"

@interface PhototasticViewController ()
{
    KASlideShow *slideView;
}
@end

@implementation PhototasticViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *lblIntroduction = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, self.view.width-20, 30)];
    lblIntroduction.textAlignment = NSTextAlignmentLeft;
    lblIntroduction.textColor = [UIColor lightGrayColor];
    lblIntroduction.font = [UIFont systemFontOfSize:12];
    lblIntroduction.numberOfLines = 2;
    lblIntroduction.text = @"(Phototastic is completely anoymous so she will not know who rated her)";

    [self.view addSubview:lblIntroduction];
    
    UILabel *lblRate = [[UILabel alloc] initWithFrame:CGRectMake(10, lblIntroduction.bottom+5, self.view.width-20, 36)];
    lblRate.textAlignment = NSTextAlignmentCenter;
    lblRate.textColor = [UIColor whiteColor];
    lblRate.numberOfLines = 2;
    lblRate.lineBreakMode = NSLineBreakByCharWrapping;
    lblRate.font = [UIFont boldSystemFontOfSize:13];
    lblRate.text = @"You have rated 0 others so far, you need to rate 10 more people to unlock your test result";
    
    [self.view addSubview:lblRate];
    
    slideView = [[KASlideShow alloc] initWithFrame:CGRectMake(10, lblRate.bottom+5, self.view.width-20, self.view.width-20)];
    
    [slideView setDelay:1]; // Delay between transitions
    [slideView setTransitionDuration:.5]; // Transition duration
    [slideView setTransitionType:KASlideShowTransitionFade]; // Choose a transition type (fade or slide)
    [slideView setImagesContentMode:UIViewContentModeScaleAspectFill]; // Choose a content mode for images to display
    [slideView addImagesFromResources:@[@"test1.jpg",@"test2.jpg",@"test3.jpg"]]; // Add images from resources
    
    [self.view addSubview:slideView];

    BorderButton *btnDislike = [[BorderButton alloc] initWithFrame:CGRectMake(10, 0, (self.view.width-20-20)/2, 32)];
    btnDislike.bottom = self.view.height - 64 - 44 - 20;
    [btnDislike setTitle:@"Dislike" forState:UIControlStateNormal];
    [btnDislike setTintColor:[UIColor whiteColor]];
    
    [self.view addSubview:btnDislike];

    BorderButton *btnLike = [[BorderButton alloc] initWithFrame:CGRectMake(self.view.width/2+10, 0, (self.view.width-20-20)/2, 32)];
    btnLike.bottom = self.view.height - 64 - 44 - 20;
    [btnLike setTitle:@"Like" forState:UIControlStateNormal];
    [btnLike setTintColor:[UIColor whiteColor]];
    
    [self.view addSubview:btnLike];
    
    [slideView start];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - KASlideShow delegate

- (void) kaSlideShowDidNext:(KASlideShow *)slideShow
{
    NSLog(@"kaSlideShowDidNext, index : %d",slideShow.currentIndex);
}

-(void)kaSlideShowDidPrevious:(KASlideShow *)slideShow
{
    NSLog(@"kaSlideShowDidPrevious, index : %d",slideShow.currentIndex);
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

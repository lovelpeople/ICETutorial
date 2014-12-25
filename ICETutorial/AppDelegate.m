//
//  AppDelegate.m
//  ICETutorial
//
//  Created by Patrick Trillsam on 25/03/13.
//  Copyright (c) 2014 https://github.com/icepat/ICETutorial. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Init the pages texts, and pictures.
    ICETutorialPage *layer1 = [[ICETutorialPage alloc] initWithTitle:@"透明沟通"
                                                            subTitle:@"使用纷云团队成员在同一个地方进行沟通，所有聊天历史记录永久保存，新加入团队的成员可以浏览团队之前的聊天历史记录，针对团队中共享的文件，成员可以随时发表评论。"
                                                         pictureName:@"1"
                                                            duration:3.0];
    layer1.iconImage = [UIImage imageNamed:@"icon_startanimation1"];
    
    ICETutorialPage *layer2 = [[ICETutorialPage alloc] initWithTitle:@"服务整合"
                                                            subTitle:@"纷云拥有强大的与第三方服务整合的能力，现在已经提供了微博、微信、邮件、监控宝、GitHub等十多种服务，而且还在快速的增加中。如果内置的服务无法满足你的团队需要，还可以通过我们提供的自定义WebHook与外部服务整合"
                                                         pictureName:@"2"
                                                            duration:3.0];
    layer2.iconImage = [UIImage imageNamed:@"icon_startanimation2"];
    
    ICETutorialPage *layer3 = [[ICETutorialPage alloc] initWithTitle:@"文件整合"
                                                            subTitle:@"随时与团队成员共享文件，目前纷云提供了文件、文本片段、在线文档三种不同的文件支持，文本片段用于跟团队成员共享如代码片段等少量文本信息，在线文档可以使用Markdown在线编写专业的文档。"
                                                         pictureName:@"3"
                                                            duration:3.0];
    layer3.iconImage = [UIImage imageNamed:@"icon_startanimation3"];
    
    ICETutorialPage *layer4 = [[ICETutorialPage alloc] initWithTitle:@"统一搜索"
                                                            subTitle:@"不管是成员的聊天消息，还是来自于外部的服务的信息，或者是团队中共享的文件、评论等，所有这些信息都可以随时进行搜索并呈现"
                                                         pictureName:@"4"
                                                            duration:3.0];
    layer4.iconImage = [UIImage imageNamed:@"icon_startanimation4"];
    
    NSArray *tutorialLayers = @[layer1,layer2,layer3,layer4];

    // Set the common style for the title.
    ICETutorialLabelStyle *titleStyle = [[ICETutorialLabelStyle alloc] init];
    [titleStyle setFont:[UIFont fontWithName:@"Helvetica-Bold" size:17.0f]];
    [titleStyle setTextColor:[UIColor whiteColor]];
    [titleStyle setLinesNumber:1];
    [titleStyle setOffset:170];
    [[ICETutorialStyle sharedInstance] setTitleStyle:titleStyle];
    
    // Set the subTitles style with few properties and let the others by default.
    [[ICETutorialStyle sharedInstance] setSubTitleColor:[UIColor whiteColor]];
    [[ICETutorialStyle sharedInstance] setSubTitleOffset:215];
    [[ICETutorialStyle sharedInstance] setSubTitleLinesNumber:5];
    [ICETutorialStyle sharedInstance].subTitleStyle.linesNumber = 5;
    
    // Init tutorial.
    self.viewController = [[ICETutorialController alloc] initWithPages:tutorialLayers
                                                              delegate:self];
    
    // Run it.
    [self.viewController startScrolling];
    
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

#pragma mark - ICETutorialController delegate
- (void)tutorialController:(ICETutorialController *)tutorialController scrollingFromPageIndex:(NSUInteger)fromIndex toPageIndex:(NSUInteger)toIndex {
    NSLog(@"Scrolling from page %lu to page %lu.", (unsigned long)fromIndex, (unsigned long)toIndex);
}

- (void)tutorialControllerDidReachLastPage:(ICETutorialController *)tutorialController {
    NSLog(@"Tutorial reached the last page.");
}

- (void)tutorialController:(ICETutorialController *)tutorialController didClickOnLeftButton:(UIButton *)sender {
    NSLog(@"Button 1 pressed.");
}

- (void)tutorialController:(ICETutorialController *)tutorialController didClickOnRightButton:(UIButton *)sender {
    NSLog(@"Button 2 pressed.");
    NSLog(@"Auto-scrolling stopped.");
    
    [self.viewController stopScrolling];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

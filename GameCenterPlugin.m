//
//  GameCenterPlugin.m
//  Detonate
//
//  Created by Marco Piccardo on 04/02/11.
//  Copyright 2011 Eurotraining Engineering. All rights reserved.
//

#import "GameCenterPlugin.h"
#import <Cordova/CDVViewController.h>

@implementation GameCenterPlugin

- (void)authenticateLocalPlayer:(CDVInvokedUrlCommand *)command
{
    [[GKLocalPlayer localPlayer] authenticateWithCompletionHandler:^(NSError *error) {
        if (error == nil)
        {
            NSString* jsCallback = [NSString stringWithFormat:@"GameCenter._userDidLogin();",@""];
            [self.webView stringByEvaluatingJavaScriptFromString:jsCallback];
        }
        else
        {
            NSString* jsCallback = [NSString stringWithFormat:@"GameCenter._userDidFailLogin();",@""];
            [self.webView stringByEvaluatingJavaScriptFromString:jsCallback];
        }
    }];
}

- (void)reportScore:(CDVInvokedUrlCommand *)command
{
    NSString *category = (NSString*) [command.arguments objectAtIndex:0];
    int64_t score = [[command.arguments objectAtIndex:1] integerValue];

    GKScore *scoreReporter = [[[GKScore alloc] initWithCategory:category] autorelease];
    scoreReporter.value = score;

    [scoreReporter reportScoreWithCompletionHandler:^(NSError *error) {
        if (!error)
        {
            NSString* jsCallback = [NSString stringWithFormat:@"GameCenter._userDidSubmitScore();",@""];
            [self.webView stringByEvaluatingJavaScriptFromString:jsCallback];
        } else {
            NSString* jsCallback = [NSString stringWithFormat:@"GameCenter._userDidFailSubmitScore();",@""];
            [self.webView stringByEvaluatingJavaScriptFromString:jsCallback];
        }
    }];
}

- (void)showLeaderboard:(CDVInvokedUrlCommand *)command
{
    GKLeaderboardViewController *leaderboardController = [[GKLeaderboardViewController alloc] init];
    if (leaderboardController != nil)
    {
        leaderboardController.leaderboardDelegate = self;
        leaderboardController.category = (NSString*) [command.arguments objectAtIndex:0];
        CDVViewController* cont = (CDVViewController*)[super viewController];
        [cont presentModalViewController: leaderboardController animated: YES];
    }
}

- (void)showAchievements:(CDVInvokedUrlCommand *)command
{
    GKAchievementViewController *achievements = [[GKAchievementViewController alloc] init];
    if (achievements != nil)
    {
        achievements.achievementDelegate = self;
        CDVViewController* cont = (CDVViewController*)[super viewController];
        [cont presentModalViewController: achievements animated: YES];
    }
    [achievements release];
}

- (void)leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
    CDVViewController* cont = (CDVViewController*)[super viewController];
    [cont dismissModalViewControllerAnimated:YES];
}

- (void)achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
    CDVViewController* cont = (CDVViewController*)[super viewController];
    [cont dismissModalViewControllerAnimated:YES];
}

- (void)reportAchievementIdentifier:(CDVInvokedUrlCommand *)command
{
    NSString *identifier = (NSString*) [command.arguments objectAtIndex:0];
    float percent = [[command.arguments objectAtIndex:1] floatValue];

    GKAchievement *achievement = [[[GKAchievement alloc] initWithIdentifier: identifier] autorelease];
    if (achievement)
    {
        achievement.percentComplete = percent;
        [achievement reportAchievementWithCompletionHandler:^(NSError *error) {
            if (!error)
            {
                // Retain the achievement object and try again later (not shown).
            }
        }];
    }
}

@end

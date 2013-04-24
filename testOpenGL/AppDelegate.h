//
//  AppDelegate.h
//  testOpenGL
//
//  Created by John doe on 13-4-23.
//  Copyright (c) 2013年 John doe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OpenGLView.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    OpenGLView *_glView;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) IBOutlet OpenGLView *glView;

@end

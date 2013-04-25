//
//  OpenGLView.h
//  testOpenGL
//
//  Created by John doe on 13-4-23.
//  Copyright (c) 2013年 John doe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#include <OpenGLES/ES2/gl.h>
#include <OpenGLES/ES2/glext.h>

#import "CC3GLMatrix.h"

@interface OpenGLView : UIView {
    CAEAGLLayer *_eaglLayer;
    EAGLContext *_context;
    GLuint _colorRenderBuffer;
    
    GLuint _fishTexture;
    GLuint _catTexture;
    GLuint _texCoordSlot;
    GLuint _textureUniform;
    GLuint _modelViewUniform;
    
    GLuint _positionSlot;
    GLuint _colorSlot;
    GLuint _normalSlot;
    
    GLuint _projectionUniform;
    
    GLuint _depthRenderBuffer;
    GLuint vertexBuffer;
    
    float coordinate_z;
    float positive;
    float rotate;
    float rotateY;
    
    CC3GLMatrix *modelView;
}

@end

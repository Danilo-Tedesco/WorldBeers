#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "Glide.h"
#import "GlideClient+Adjustments.h"
#import "GlideClient+Background.h"
#import "GlideClient+Border.h"
#import "GlideClient+Crop.h"
#import "GlideClient+Effects.h"
#import "GlideClient+Encode.h"
#import "GlideClient+Orientation.h"
#import "GlideClient+PixelDensity.h"
#import "GlideClient+Size.h"
#import "GlideClient+Watermarks.h"
#import "GlideClient.h"
#import "GlideUtils.h"

FOUNDATION_EXPORT double GlideVersionNumber;
FOUNDATION_EXPORT const unsigned char GlideVersionString[];


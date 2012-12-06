//
//  iProductSingleton.h
//  MobicartApp
//
//  Created by Mobicart on 27/05/11.
//  Copyright 2011 Mobicart. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface iProductSingleton : NSObject
{
    
@private  NSData *dataForProductImage;
@private  NSData *dataForCoverProductImage;
NSArray *arrImagesUrls;
@private BOOL loadingStatus;
@private BOOL imageCheck;

}
@property(nonatomic,retain)NSArray *arrImagesUrls;
+ (iProductSingleton *)productObj;
-(NSArray *)getProductImage;
-(NSData *)setProductImage:(NSArray *)arrImagesUrls picToShowAtAIndex:(NSInteger)_picNum willZoom:(NSNumber *)isHandlingZoomImage;
-(NSData *)setProductImage:(NSMutableArray *)arrImagesUrls picToShowAtAIndex:(NSInteger)_picNum ;


@end

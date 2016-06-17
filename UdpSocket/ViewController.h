//
//  ViewController.h
//  UdpSocket
//
//  Created by Fenix on 16/6/12.
//  Copyright © 2016年 Fenix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GCDAsyncUdpSocket.h"
@interface ViewController : UIViewController<GCDAsyncUdpSocketDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *vImg;



@end


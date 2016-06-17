//
//  ViewController.m
//  UdpSocket
//
//  Created by Fenix on 16/6/12.
//  Copyright © 2016年 Fenix. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    BOOL isHead;
}
@property (nonatomic, strong) GCDAsyncUdpSocket *sock;
@property (nonatomic, strong) NSMutableData *vData;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _sock =  [[GCDAsyncUdpSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
//    dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
    if (_sock) {
        NSLog(@"%@",_sock);
        NSError *err = nil;
        [_sock bindToPort:8888 error:&err];
    }
    }
    
- (IBAction)start:(id)sender {
    NSError *err = nil;
    
//    [_sock setReceiveFilter:^BOOL(NSData *data, NSData *address, __autoreleasing id *context) {
//        if (data.length == 44) {
//             isHead = YES;
//            _vData = [[NSMutableData alloc] init];
//            return YES;
//        }
//        isHead = NO;
//        return NO;
//    } withQueue:dispatch_get_main_queue()];
    [_sock beginReceiving:&err];
//        NSString *url = [[NSBundle mainBundle] pathForResource:@"mtv" ofType:@"h264"];
//        NSData *data = [[NSData alloc] initWithContentsOfFile:url];
//        NSLog(@"%@",data);
    

}

- (IBAction)stop:(id)sender {
    if (_sock) {
        [_sock pauseReceiving];
        [_sock close];
    }
}

-(void)udpSocket:(GCDAsyncUdpSocket *)sock didReceiveData:(NSData *)data fromAddress:(NSData *)address withFilterContext:(id)filterContext
{
    NSLog(@"receiveData:dataLenth = %lu:%@",(unsigned long)data.length,data);
//    [_vData appendData:data];
//     NSLog(@"%@",data);
    if (isHead) {
       

//        Byte *testByte = (Byte *)[data bytes];
//        NSLog(@"%d",testByte);
    }
   
//    _img.image = [UIImage imageWithData:data];
}

-(void)udpSocket:(GCDAsyncUdpSocket *)sock didNotConnect:(NSError *)error
{
    NSLog(@"didNotConnectWithError:%@",error);
}
-(void)udpSocketDidClose:(GCDAsyncUdpSocket *)sock withError:(NSError *)error
{
    NSLog(@"%@",error);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

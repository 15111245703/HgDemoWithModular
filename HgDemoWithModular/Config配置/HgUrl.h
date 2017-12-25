//
//  HgUrl.h
//  HgDemo
//
//  Created by RicardoM Lu on 2017/3/1.
//  Copyright © 2017年 RicardoM Lu. All rights reserved.
//

#ifndef HgUrl_h
#define HgUrl_h


#define kgetCertifiedFlagURL [BASEURL stringByAppendingString:@"//www.baidu.com/"]
#define kHeadImageURL @"http://img.hb.aicdn.com/faadba67758182a47d3f819ae883df08e94e640c36f05-OFYhgZ_fw658"
#define PFR [[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0 ? @"PingFangSC-Regular" : @"PingFang SC"



//URl

//#define HgBaseURL @"http://192.168.2.72:8020/pf_bpm/f/m"
//#define HgBaseStaticWebURL @"http://192.168.2.72:8020/pf_bpm/static/staticHtml"//杨勇的暂时接口


//#define HgBaseURL @"http://192.168.2.201:8085/pf_bpm/f/m"
//#define HgBaseStaticWebURL @"http://192.168.2.201:8085/pf_bpm/static/staticHtml"//201的暂时接口


#define HgBaseURL @"http://123.56.199.44:10015/pf_bpm/f/m"
#define HgBaseStaticWebURL @"http://123.56.199.44:10015/pf_bpm/static/staticHtml"


#endif /* HgUrl_h */


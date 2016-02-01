//
//  AutoShrink.swift
//  ShrinkScrollViewWhenKeyboardWasShow
//
//  Created by luojie on 16/2/1.
//  Copyright © 2016年 LuoJie. All rights reserved.
//

import UIKit

//extension UIScrollView {
//    /// 当显示键盘时，自动压缩 ScrollView 并将激活的 TextField 滑动到显示区域
//    @IBInspectable
//    var autoShrink: Bool {
//        // get method not used
//        get {
//            return false
//        }
//        
//        set(auto) {
//            if auto {
//                observeForName(UIKeyboardDidShowNotification, didReceiveNotification: {
//                    [unowned self] noti in
//                    let info = noti.userInfo!
//                    let kbSize = info[UIKeyboardFrameBeginUserInfoKey]!.CGRectValue.size
//                    
//                    var contentInsets = self.contentInset
//                    contentInsets.bottom = kbSize.height
//                    
//                    self.contentInset = contentInsets
//                    self.scrollIndicatorInsets = contentInsets
//                    })
//                
//                observeForName(UIKeyboardWillHideNotification, didReceiveNotification: {
//                    [unowned self] _ in
//                    var contentInsets = self.contentInset
//                    contentInsets.bottom = 0
//                    UIView.animateWithDuration(0.4, animations: { self.contentInset = contentInsets })
//                    self.scrollIndicatorInsets = contentInsets
//                    })
//            }
//        }
//    }
//}
//
//extension NSObject {
//    /// 收听通知，注意：didReceiveNotification 回调需用 [unowned self] in 否者会造成内存泄漏
//    func observeForName(name: String, didReceiveNotification: ((NSNotification) -> Void) ) {
//        NSNotificationCenter.defaultCenter()
//            .rac_addObserverForName(name, object: nil)
//            .takeUntil(rac_willDeallocSignal())
//            .subscribeNext { didReceiveNotification($0 as! NSNotification) }
//    }
//}

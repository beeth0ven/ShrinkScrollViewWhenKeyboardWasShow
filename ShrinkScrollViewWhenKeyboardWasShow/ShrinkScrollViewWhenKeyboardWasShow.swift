//
//  ShrinkScrollViewWhenKeyboardWasShow.swift
//  Education
//
//  Created by luojie on 16/1/6.
//  Copyright © 2016年 LuoJie. All rights reserved.
//

import UIKit

/**
 当即将显示键盘时，自动压缩 ScrollView 并将激活的 TextField 滑动到显示区域
 
 以下是该能力的用法：
 
 ```swift

class LoginViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        oberverKeyboardWasShowOrWillHide()
    }
    
    deinit {
        removeObserver()
    }
}

extension LoginViewController: ShrinkScrollViewWhenKeyboardWasShow {
    func keyboardWasShownSelector(noti: NSNotification) {
        keyboardWasShown(noti)
    }
    
    func keyboardWillBeHiddenSelector(noti: NSNotification) {
        keyboardWillBeHidden(noti)
    }
}

 ```
 
 在 LoginViewController 的界面上，当某个 TextField 被激活时，键盘显示出来，scrollView 自动收缩，并且滑动这个 TextField 到显示区域。
 当取消或者完成输入时，键盘消失，scrollView 自动还原。
 
 */

protocol ShrinkScrollViewWhenKeyboardWasShow: NotificationObserver {
    var scrollView: UIScrollView! { get set }
    func keyboardWasShownSelector(noti: NSNotification)
    func keyboardWillBeHiddenSelector(noti: NSNotification)
}

extension ShrinkScrollViewWhenKeyboardWasShow {
    func oberverKeyboardWasShowOrWillHide() {
        let center = NSNotificationCenter.defaultCenter()
        center.addObserver(self,
            selector: "keyboardWasShownSelector:",
            name: UIKeyboardDidShowNotification,
            object: nil)
        
        center.addObserver(self,
            selector: "keyboardWillBeHiddenSelector:",
            name: UIKeyboardWillHideNotification,
            object: nil)
    }
    
    func keyboardWasShown(noti: NSNotification) {
        let info = noti.userInfo!
        let kbSize = info[UIKeyboardFrameBeginUserInfoKey]!.CGRectValue.size
        
        var contentInsets = scrollView.contentInset
        contentInsets.bottom = kbSize.height
        
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
        
    }
    
    func keyboardWillBeHidden(noti: NSNotification) {
        var contentInsets = scrollView.contentInset
        contentInsets.bottom = 0
        UIView.animateWithDuration(0.4, animations: { self.scrollView.contentInset = contentInsets })
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
}

protocol NotificationObserver: class {
    func removeObserver()
}

extension NotificationObserver {
    func removeObserver() {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
}




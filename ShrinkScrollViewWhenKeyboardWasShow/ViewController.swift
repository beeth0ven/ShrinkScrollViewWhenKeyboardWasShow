//
//  ViewController.swift
//  Education
//
//  Created by luojie on 16/1/6.
//  Copyright © 2016年 LuoJie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        oberverKeyboardWasShowOrWillHide()
    }
    
    deinit {
        removeObserver()
    }
    
}

extension ViewController: ShrinkScrollViewWhenKeyboardWasShow {
    func keyboardWasShownSelector(noti: NSNotification) {
        keyboardWasShown(noti)
    }
    
    func keyboardWillBeHiddenSelector(noti: NSNotification) {
        keyboardWillBeHidden(noti)
    }
}



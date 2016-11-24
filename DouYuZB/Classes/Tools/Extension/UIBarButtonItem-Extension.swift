//
//  UIBarButtonItem-Extension.swift
//  DouYuZB
//
//  Created by yuanqi_tony on 2016/11/24.
//  Copyright © 2016年 yuanqi_tony. All rights reserved.
//

import UIKit


extension UIBarButtonItem {
    
    class func createItem(imageName : String, highImageName : String, size : CGSize) -> UIBarButtonItem {
        
        let btn = UIButton()
        
        btn.setImage(UIImage(named: imageName), for: .normal)
        btn.setImage(UIImage(named: highImageName), for: .highlighted)
        btn.frame = CGRect(origin: CGPoint(), size: size)
        
        return UIBarButtonItem(customView: btn)
    }
    
    //在extension中添加的构造函数为 便利构造函数-> convenience开头 2> 在构造函数中必须明确调用一个设计的构造函数
    convenience init(imageName : String, highImageName : String = "", size : CGSize = CGSize.zero) {
        
        let btn = UIButton()
        
        btn.setImage(UIImage(named: imageName), for: .normal)
        
        if highImageName != "" {
            
            btn.setImage(UIImage(named: highImageName), for: .highlighted)
        }
        
        if size == CGSize.zero {
            btn.sizeToFit()
        }else{
            btn.frame = CGRect(origin: CGPoint.zero, size: size)
        }
        
        //调用设计的构造函数
        self.init(customView : btn)
        
    }
    
}

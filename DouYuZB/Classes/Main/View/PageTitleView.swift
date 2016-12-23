//
//  PageTitleView.swift
//  DouYuZB
//
//  Created by yuanqi_tony on 2016/12/23.
//  Copyright © 2016年 yuanqi_tony. All rights reserved.
//

import UIKit

private let KScrollLineH : CGFloat = 2

class PageTitleView: UIView {

    //MARK: - 定义属性
    fileprivate var titles : [String]
    
    fileprivate lazy var scrollView : UIScrollView = {
        
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false;
        scrollView.scrollsToTop = false;
        scrollView.isPagingEnabled = false;
        scrollView.bounces = false;
        return scrollView
    }()
    
    fileprivate lazy var scrollLine : UIView = {
        
        let scrollLine = UIView()
        scrollLine.backgroundColor = UIColor.orange
        return scrollLine
    }()
    
    fileprivate lazy var titleLabels : [UILabel] = [UILabel]()
    
    //MARK: - 自定义构造函数
    init(frame: CGRect, titles : [String]) {
        self.titles = titles;
        super.init(frame: frame)
        
        //设置UI界面
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}


//MARK: - 设置UI界面
extension PageTitleView {
    
    fileprivate func setupUI() {
        
        addSubview(scrollView)
        scrollView.frame = bounds
        
        //添加title对应的label
        setupTitleLabels()
        
        //设置底线跟滑动的滑块
        setupBottomMenuAndScrollLine()
        
    }
    
    fileprivate func setupTitleLabels() {
        
        
        let labelW : CGFloat = frame.width / CGFloat(titles.count)
        let labelH : CGFloat = frame.height - KScrollLineH
        let labelY : CGFloat = 0.0
        
        for (index, title) in titles.enumerated() {
            
            //创建Label
            let label = UILabel()
            label.text = title
            label.tag = index
            label.font = UIFont.systemFont(ofSize: 16.0)
            label.textColor = UIColor.darkGray
            label.textAlignment = .center
            
            let labelX : CGFloat = labelW * CGFloat(index)
            
            label.frame = CGRect(x: labelX, y: labelY, width: labelW, height: labelH)
            
            scrollView.addSubview(label)
            titleLabels.append(label)
            
        }
    }
    
    fileprivate func setupBottomMenuAndScrollLine() {
        
        
        //添加底线
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.lightGray
        let lineH : CGFloat = 0.5
        bottomLine.frame = CGRect(x: 0, y: frame.height - lineH, width: frame.width, height: lineH)
        
        addSubview(bottomLine)
        
        //添加scrollLine
        guard let firstLabel = titleLabels.first else {return}
        firstLabel.textColor = UIColor.orange
        
        scrollView.addSubview(scrollLine)
        scrollLine.frame = CGRect(x: firstLabel.frame.origin.x, y: frame.height - KScrollLineH, width: firstLabel.frame.width, height: KScrollLineH)
    }
    
}

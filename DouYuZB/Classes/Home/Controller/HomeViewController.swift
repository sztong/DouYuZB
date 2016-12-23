//
//  HomeViewController.swift
//  DouYuZB
//
//  Created by yuanqi_tony on 2016/11/24.
//  Copyright © 2016年 yuanqi_tony. All rights reserved.
//

import UIKit

private let KTitleViewH : CGFloat = 40

class HomeViewController: UIViewController {

    
    //MARK: - 懒加载属性
    fileprivate lazy var pageTitleView : PageTitleView = {
        let titleFrame = CGRect(x: 0, y: KStatusBarH + KNavigationBarH, width: KScreenW, height: KTitleViewH)
        let titles = ["推荐", "游戏", "娱乐", "趣玩"];
        let titleView = PageTitleView(frame: titleFrame, titles: titles)
        return titleView;
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK:- 设置UI界面
extension HomeViewController {
    
    fileprivate func setupUI() {
        
        //不需要调整UIScrollView的内边距
        automaticallyAdjustsScrollViewInsets = false
        
        //设置导航栏
        setupNavigationBar()
        
        //添加titleView
        view.addSubview(pageTitleView);
        
    }
    
    //设置导航栏
    private func setupNavigationBar() {
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "logo")
        
        let size = CGSize(width: 40, height: 40)
        
        let historyItem = UIBarButtonItem(imageName: "image_my_history", highImageName: "Image_my_history_click", size: size)
        
        let searchItem = UIBarButtonItem(imageName: "btn_search", highImageName: "btn_search_clicked", size: size)
        
        let qrcodeItem = UIBarButtonItem(imageName: "Image_scan", highImageName: "Image_scan_click", size: size)
        
        
        navigationItem.rightBarButtonItems = [historyItem, searchItem, qrcodeItem]
    }
    
}

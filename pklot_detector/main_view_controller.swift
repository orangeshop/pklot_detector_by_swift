//
//  main_view_controller.swift
//  AiTest
//
//  Created by 최영호 on 2023/03/17.
//

import Foundation
import UIKit


class main_view_controller: UITabBarController, UITabBarControllerDelegate{
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let setting_view = setting_ViewController()
        let camera_view = CameraViewController1()
        let test_setting_view = setting_view_testViewController()
        //let test_setting_view = UINavigationController(rootViewController: setting_view_testViewController())
    
        //self.setViewControllers([camera_view,setting_view], animated: true)
        self.setViewControllers([setting_view,test_setting_view], animated: true)
        
        let left_btn = UIBarButtonItem(image: UIImage(systemName: "bell")?.withTintColor(.white, renderingMode: .alwaysOriginal), style: .plain, target: self, action: nil)
        
        navigationItem.leftBarButtonItems = [
            left_btn
        ]
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "gearshape")?.withTintColor(.white, renderingMode: .alwaysOriginal), style: .plain, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "magnifyingglass")?.withTintColor(.white, renderingMode: .alwaysOriginal), style: .plain, target: self, action: nil)
        ]
        
        
        
        
        
        navigationItem.titleView?.tintColor = .white
        
        
        
        self.tabBar.backgroundColor = UIColor.white
        self.tabBar.layer.cornerRadius = 20
        self.tabBar.layer.masksToBounds = true
        self.tabBar.layer.borderColor = UIColor.lightGray.cgColor
        self.tabBar.layer.borderWidth = 0.4
        
        self.delegate = self
        
        camera_view.title = "fisrt"
        
        camera_view.tabBarItem.image = UIImage(systemName: "camera.fill")
        
        setting_view.title = "second"
        setting_view.tabBarItem.image = UIImage(systemName: "gear")
        
        test_setting_view.title = "thrid"
        test_setting_view.tabBarItem.image = UIImage(systemName: "gear")
    }
    //vc.data_x_list
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print(item.title!)
        
       
    }
}

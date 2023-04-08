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
    
        self.setViewControllers([camera_view,test_setting_view], animated: true)
        //self.setViewControllers([setting_view,test_setting_view], animated: true)
        
        let left_btn = UIBarButtonItem(image: UIImage(systemName: "bell")?.withTintColor(.white, renderingMode: .alwaysOriginal), style: .plain, target: self, action: nil)
        
        navigationItem.leftBarButtonItems = [
            left_btn
        ]
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "gearshape")?.withTintColor(.white, renderingMode: .alwaysOriginal), style: .plain, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "arrow.counterclockwise")?.withTintColor(.white, renderingMode: .alwaysOriginal), style: .plain, target: self, action:#selector(relaoad))
        ]
        
        
        
        
        
        
        
        
        
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
        
        test_setting_view.title = "third"
        test_setting_view.tabBarItem.image = UIImage(systemName: "gear")
    }
    //vc.data_x_list
    var check_view : Int = 0
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print(item.title!)
        if(item.title! == "third"){
            check_view = 1
        }
        else{
            check_view = 0
        }
    }

    @objc func relaoad(){
        print("reload")
        print("check : \(check_view)")
        if(check_view == 1){
            print("접근 불가능")
            let alert = UIAlertController(title: "잘못된 접근", message: "해당 페이지에서 사용 불가능", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "닫기", style: .cancel))
            present(alert, animated: true)
        }
        else if(check_view == 0){
            print("접근 가능")
            detector_view_inner = true
        }
    }
    func add_layer(){
        
        for i in 0..<arr.count{
            view.addSubview(make_layer(cnt:i))
        }
    }
    
    func make_layer(cnt:Int) -> UIView{
        let view_layer = UIView(frame: CGRect(x: arr[cnt].frame.minX, y: arr[cnt].frame.minY, width: arr[cnt].frame.width, height: arr[cnt].frame.height))
        view_layer.backgroundColor = .white
        
        print("reload - add_layer - make_layer - arr[cnr].self \(arr[cnt].self)")
        print(arr[cnt].frame.minX)
        return view_layer
    }
    
}

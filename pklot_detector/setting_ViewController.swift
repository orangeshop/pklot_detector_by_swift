//
//  setting_ViewController.swift
//  AiTest
//
//  Created by 최영호 on 2023/03/17.
//
import Foundation
import UIKit

class setting_ViewController: UIViewController {

    
    var stack_view : UIStackView = {
        var stack_view = UIStackView()
        stack_view.translatesAutoresizingMaskIntoConstraints = false
        stack_view.axis = .vertical
        //stack_view.alignment = .leading
        stack_view.distribution = .fillEqually
        //stack_view.backgroundColor = .orange
        stack_view.spacing = 5
        stack_view.layer.cornerRadius = 5
        return stack_view
    }()
    
    var top_stack_view : UIStackView = {
        var stackview1 = UIStackView()
        stackview1.translatesAutoresizingMaskIntoConstraints = false
        stackview1.backgroundColor = .orange
        stackview1.axis = .horizontal
        stackview1.distribution = .fillEqually
        //stackview1.alignment = .center
        stackview1.spacing = 15
        stackview1.layer.cornerRadius = 5
        return stackview1
    }()
    
    var bottom_stack_view : UIStackView = {
        var stackview2 = UIStackView()
        stackview2.translatesAutoresizingMaskIntoConstraints = false
        //stackview2.backgroundColor = .blue
        stackview2.axis = .horizontal
        stackview2.distribution = .fillEqually
        //stackview2.alignment = .center
        stackview2.spacing = 15
        stackview2.layer.cornerRadius = 5
        return stackview2
    }()
    

    
    var custom_map_button : UIButton = {
        var temp_button = UIButton()
        temp_button.layer.cornerRadius = 5
        temp_button.backgroundColor = .red
        temp_button.layer.borderColor = UIColor.white.cgColor
        temp_button.layer.borderWidth = 1
        //temp_button.backgroundColor = .white
        return temp_button
    }()
    
    var view_log_button : UIButton = {
        var temp_button = UIButton()
        temp_button.layer.cornerRadius = 5
        temp_button.backgroundColor = .green
        temp_button.layer.borderColor = UIColor.white.cgColor
        temp_button.layer.borderWidth = 1
        //temp_button.backgroundColor = .white
        return temp_button
    }()
    
    var exit_button_view : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        return view
    }()
    
    var exit_button : UIButton = {
        var temp_button = UIButton()
        temp_button.translatesAutoresizingMaskIntoConstraints = false
        temp_button.layer.cornerRadius = 5
        temp_button.backgroundColor = .white
        temp_button.layer.backgroundColor = UIColor.black.cgColor
        temp_button.layer.borderWidth = 1
//        temp_button.layer.borderColor = UIColor.white.cgColor
//        temp_button.layer.borderWidth = 1
        //temp_button.backgroundColor = .white
        return temp_button
    }()
    
    var profile_view : UIView = {
        var top_profile_view = UIView()
        top_profile_view.translatesAutoresizingMaskIntoConstraints = false
        top_profile_view.backgroundColor = .white
        //top_profile_view.layer.borderWidth = 1
        //top_profile_view.layer.borderColor = UIColor.black.cgColor
        top_profile_view.layer.cornerRadius = 5
        return top_profile_view
    }()
    
    var profile_picture_view : UIView = {
        var picture = UIView()
        picture.translatesAutoresizingMaskIntoConstraints = false
        picture.backgroundColor = .black
        picture.layer.cornerRadius = 5
        return picture
    }()
    
    var profile_text :UILabel = {
        var profile_text = UILabel()
        profile_text.translatesAutoresizingMaskIntoConstraints = false
        profile_text.text = "관리자 1"
        return profile_text
    }()
    

    var setting_view_x_dot = [Double]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        
        
        view.addSubview(profile_view)
        
        profile_view.addSubview(stack_view)
        stack_view.addArrangedSubview(top_stack_view)
        stack_view.addArrangedSubview(bottom_stack_view)
        
        top_stack_view.addArrangedSubview(profile_picture_view)
        top_stack_view.addArrangedSubview(profile_text)
        
        bottom_stack_view.addArrangedSubview(custom_map_button)
        bottom_stack_view.addArrangedSubview(view_log_button)
        //bottom_stack_view.addArrangedSubview(exit_button)
        
        exit_button_view.addSubview(exit_button)
        bottom_stack_view.addArrangedSubview(exit_button_view)
        
        
        
        custom_map_button.addTarget(self, action: #selector(custom_map_func), for: .touchUpInside)
        
        view_log_button.addTarget(self, action: #selector(log_view_func), for: .allTouchEvents)
        
        exit_button.addTarget(self, action: #selector(exit_func), for: .allTouchEvents)

        auto_layout_setting()
        
    }
    
    func auto_layout_setting(){
        
        NSLayoutConstraint.activate([
            stack_view.topAnchor.constraint(equalTo: profile_view.topAnchor),
            stack_view.leftAnchor.constraint(equalTo: profile_view.leftAnchor),
            stack_view.rightAnchor.constraint(equalTo: profile_view.rightAnchor),
            stack_view.bottomAnchor.constraint(equalTo: profile_view.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            profile_view.topAnchor.constraint(equalTo: super.view.topAnchor, constant: 100),
            profile_view.leftAnchor.constraint(equalTo: super.view.leftAnchor, constant: 20),
            profile_view.rightAnchor.constraint(equalTo: super.view.rightAnchor, constant: -20),
            profile_view.bottomAnchor.constraint(equalTo: super.view.bottomAnchor, constant: -500),

        ])
        
        
        NSLayoutConstraint.activate([
            exit_button.topAnchor.constraint(equalTo: exit_button_view.topAnchor, constant: 10),
            exit_button.leftAnchor.constraint(equalTo: exit_button_view.leftAnchor, constant: 10),
            exit_button.rightAnchor.constraint(equalTo: exit_button_view.rightAnchor, constant: -10),
            exit_button.bottomAnchor.constraint(equalTo: exit_button_view.bottomAnchor, constant: -10),
            
        ])
    }
    
    @objc func exit_func(){
        exit(0)
    }
    
    @objc func log_view_func(){
        
        let vc = Log_view_TableViewController()
        let vc2 = CameraViewController1()

        vc.x_dot = vc2.data_x_list
        vc.y_dot = vc2.data_y_list

        print(vc.x_dot.count)
        print(vc.y_dot.count)
        
        present(vc, animated: true)
    }
    
    
    
    @objc func custom_map_func(){
        
//        let vc = custom_map_ViewController()
//        let settingVC = setting_ViewController()
//        let navi = UINavigationController(rootViewController: settingVC)
//
//        navi.pushViewController(vc, animated: true)
//
//       vc.modalPresentationStyle = .fullScreen
//        present(vc, animated: true)
        
        
     
        let vc = custom_map_ViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        print("custom map func")
    }
    
    @objc func open_map_func(){
        print("open map")
        present(makeMapViewController(), animated: true)
    }
}



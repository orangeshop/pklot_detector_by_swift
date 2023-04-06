//
//  setting_view_testViewController.swift
//  pklot_detector
//
//  Created by 최영호 on 2023/04/05.
//

import UIKit

class setting_view_testViewController: UIViewController {
    
    let gradientLayer = CAGradientLayer()
    
    let inner_view : UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let inner_view_inner_view_1: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 254/255, green: 177/255, blue: 52/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        
        let gradientlayer = CAGradientLayer()
        gradientlayer.frame = view.bounds
        
        let color_start = UIColor(red: 255/255, green: 255/255, blue: 111/255, alpha: 1)
        let color_end = UIColor(red: 254/255, green: 177/255, blue: 52/255, alpha: 1)
        gradientlayer.colors = [color_start.cgColor, color_end.cgColor]
        gradientlayer.locations = [0.7] // <- 추가
        view.layer.addSublayer(gradientlayer)
        
        
        return view
    }()
    
    let inner_view_inner_view_2: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 19/255, green: 23/255, blue: 28/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        return view
    }()
    
    let inner_view_inner_view_3: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 19/255, green: 23/255, blue: 28/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        return view
    }()
    
    let inner_view_inner_view_4: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 31/255, green: 35/255, blue: 41/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        return view
    }()
    
    let inner_view_inner_view_1_logo: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowOpacity = 0.4
        return view
    }()
    
    let logo_image : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(systemName: "person.fill")?.withTintColor(UIColor.black, renderingMode: .alwaysOriginal)
        return view
    }()
    
    
    let inner_view_inner_view_1_login: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .white
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 8
        btn.layer.shadowOffset = CGSize(width: 0, height: 1)
        btn.layer.shadowOpacity = 0.4
        return btn
    }()
    
    let login_text : UILabel = {
        let label = UILabel()
        label.text = "login"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let inner_view_inner_view_1_signup: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .white
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 8
        btn.layer.shadowOffset = CGSize(width: 0, height: 1)
        btn.layer.shadowOpacity = 0.4
        return btn
    }()
    
    let signup_text : UILabel = {
        let label = UILabel()
        label.text = "sign up"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .black
    
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.black.cgColor, UIColor.orange.cgColor]
        gradientLayer.locations = [0.7] // <- 추가
        view.layer.addSublayer(gradientLayer)
        
        view.addSubview(inner_view)
        inner_view.addSubview(inner_view_inner_view_1)
        inner_view.addSubview(inner_view_inner_view_2)
        inner_view.addSubview(inner_view_inner_view_3)
        inner_view.addSubview(inner_view_inner_view_4)
        
        inner_view_inner_view_1.addSubview(inner_view_inner_view_1_logo)
        //inner_view_inner_view_1_logo.addSubview(inner_view_inner_view_1_logo_image)
        inner_view_inner_view_1_logo.addSubview(inner_view_inner_view_1_login)
        inner_view_inner_view_1_logo.addSubview(inner_view_inner_view_1_signup)
        
        
        
        inner_view_inner_view_1_logo.addSubview(logo_image)
        inner_view_inner_view_1_login.addSubview(login_text)
        inner_view_inner_view_1_signup.addSubview(signup_text)
        
        
        auto_layout()
        inner_view_autolayout()
        
        
    }
    
    

    
    
    func auto_layout(){
        NSLayoutConstraint.activate([
            inner_view.topAnchor.constraint(equalTo: super.view.safeAreaLayoutGuide.topAnchor, constant: 35),
            inner_view.leftAnchor.constraint(equalTo: super.view.leftAnchor, constant: 25),
            inner_view.rightAnchor.constraint(equalTo: super.view.rightAnchor, constant: -25),
            inner_view.bottomAnchor.constraint(equalTo: super.view.bottomAnchor, constant: -250),
            
            inner_view_inner_view_1.topAnchor.constraint(equalTo: inner_view.topAnchor),
            inner_view_inner_view_1.leftAnchor.constraint(equalTo: inner_view.leftAnchor),
            inner_view_inner_view_1.rightAnchor.constraint(equalTo: inner_view.rightAnchor, constant: -130),
            inner_view_inner_view_1.bottomAnchor.constraint(equalTo: inner_view.bottomAnchor, constant:-130),
            
            
            inner_view_inner_view_2.topAnchor.constraint(equalTo: inner_view.topAnchor),
            inner_view_inner_view_2.leftAnchor.constraint(equalTo: inner_view_inner_view_1.rightAnchor, constant: 5),
            inner_view_inner_view_2.rightAnchor.constraint(equalTo: inner_view.rightAnchor),
            inner_view_inner_view_2.bottomAnchor.constraint(equalTo: inner_view_inner_view_4.topAnchor, constant: -170),
            
            inner_view_inner_view_3.topAnchor.constraint(equalTo: inner_view_inner_view_2.bottomAnchor, constant: 5),
            inner_view_inner_view_3.leftAnchor.constraint(equalTo: inner_view_inner_view_1.rightAnchor, constant: 5),
            inner_view_inner_view_3.rightAnchor.constraint(equalTo: inner_view.rightAnchor),
            inner_view_inner_view_3.bottomAnchor.constraint(equalTo: inner_view_inner_view_4.topAnchor, constant: -5),
            
            inner_view_inner_view_4.topAnchor.constraint(equalTo: inner_view_inner_view_1.bottomAnchor, constant: 5),
            inner_view_inner_view_4.leftAnchor.constraint(equalTo: inner_view.leftAnchor),
            inner_view_inner_view_4.rightAnchor.constraint(equalTo: inner_view.rightAnchor),
            inner_view_inner_view_4.bottomAnchor.constraint(equalTo: inner_view.bottomAnchor),
            
            
            
            //inener_view_1 내부 인자
            
            inner_view_inner_view_1_logo.topAnchor.constraint(equalTo: inner_view_inner_view_1.topAnchor, constant: 60),
            inner_view_inner_view_1_logo.leadingAnchor.constraint(equalTo: inner_view_inner_view_1.leadingAnchor, constant: 50),
            inner_view_inner_view_1_logo.rightAnchor.constraint(equalTo: inner_view_inner_view_1.rightAnchor, constant: -50),
            inner_view_inner_view_1_logo.bottomAnchor.constraint(equalTo: inner_view_inner_view_1.bottomAnchor, constant: -200),
            
            
            inner_view_inner_view_1_login.topAnchor.constraint(equalTo: inner_view_inner_view_1_logo.bottomAnchor, constant: 30),
            inner_view_inner_view_1_login.leftAnchor.constraint(equalTo: inner_view_inner_view_1.leftAnchor, constant: 20),
            inner_view_inner_view_1_login.rightAnchor.constraint(equalTo: inner_view_inner_view_1.rightAnchor, constant: -20),
            inner_view_inner_view_1_login.bottomAnchor.constraint(equalTo: inner_view_inner_view_1.bottomAnchor, constant: -130),
            
            inner_view_inner_view_1_signup.topAnchor.constraint(equalTo: inner_view_inner_view_1_login.bottomAnchor, constant: 15),
            inner_view_inner_view_1_signup.leftAnchor.constraint(equalTo: inner_view_inner_view_1.leftAnchor, constant: 20),
            inner_view_inner_view_1_signup.rightAnchor.constraint(equalTo: inner_view_inner_view_1.rightAnchor, constant: -20),
            inner_view_inner_view_1_signup.bottomAnchor.constraint(equalTo: inner_view_inner_view_1.bottomAnchor, constant: -75),
            
            // 로고
            
            logo_image.topAnchor.constraint(equalTo: inner_view_inner_view_1_logo.topAnchor, constant: 10),
            logo_image.leftAnchor.constraint(equalTo: inner_view_inner_view_1_logo.leftAnchor, constant: 10),
            logo_image.rightAnchor.constraint(equalTo: inner_view_inner_view_1_logo.rightAnchor, constant: -10),
            logo_image.bottomAnchor.constraint(equalTo: inner_view_inner_view_1_logo.bottomAnchor, constant: 0),
            
            
            // 텍스트
            
            login_text.topAnchor.constraint(equalTo: inner_view_inner_view_1_login.topAnchor, constant: 5),
            login_text.leftAnchor.constraint(equalTo: inner_view_inner_view_1_login.leftAnchor, constant: 5),
            login_text.rightAnchor.constraint(equalTo: inner_view_inner_view_1_login.rightAnchor, constant: -5),
            login_text.bottomAnchor.constraint(equalTo: inner_view_inner_view_1_login.bottomAnchor, constant: -5),
            
            
            signup_text.topAnchor.constraint(equalTo: inner_view_inner_view_1_signup.topAnchor, constant: 5),
            signup_text.leftAnchor.constraint(equalTo: inner_view_inner_view_1_signup.leftAnchor, constant: 5),
            signup_text.rightAnchor.constraint(equalTo: inner_view_inner_view_1_signup.rightAnchor, constant: -5),
            signup_text.bottomAnchor.constraint(equalTo: inner_view_inner_view_1_signup.bottomAnchor, constant: -5),
            
            
            
        ])
    }
    
    @objc func test(){
        print("test click")
    }
}


extension setting_view_testViewController{
    
    
    
    func inner_view_autolayout(){
        NSLayoutConstraint.activate([
            
        ])
    }
}

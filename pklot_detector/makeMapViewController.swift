//
//  makeMapViewController.swift
//  AiTest
//
//  Created by 최영호 on 2023/03/19.
//

import UIKit

class makeMapViewController: UIViewController {

    
    var parking_line : UIView = {
        var parking_line = UIView()
        parking_line.translatesAutoresizingMaskIntoConstraints = false
        parking_line.frame = CGRect(x: 10, y: 10, width: 100, height: 50)
        //parking_line.backgroundColor = .white
        parking_line.layer.borderWidth = 4
        parking_line.layer.borderColor = UIColor.white.cgColor
        return parking_line
    }()
    
    var parking_line2 : UIView = {
        var parking_line = UIView()
        parking_line.translatesAutoresizingMaskIntoConstraints = false
        parking_line.frame = CGRect(x: 10, y: 62, width: 100, height: 50)
        //parking_line.backgroundColor = .white
        parking_line.layer.borderWidth = 4
        parking_line.layer.borderColor = UIColor.white.cgColor
        return parking_line
    }()
    
    var parking_line3 : UIView = {
        var parking_line = UIView()
        parking_line.translatesAutoresizingMaskIntoConstraints = false
        parking_line.frame = CGRect(x: 10, y: 114, width: 100, height: 50)
        //parking_line.backgroundColor = .white
        parking_line.layer.borderWidth = 4
        parking_line.layer.borderColor = UIColor.white.cgColor
        return parking_line
    }()
    
    var parking_line4 : UIView = {
        var parking_line = UIView()
        parking_line.translatesAutoresizingMaskIntoConstraints = false
        parking_line.frame = CGRect(x: 10, y: 166, width: 100, height: 50)
        //parking_line.backgroundColor = .white
        parking_line.layer.borderWidth = 4
        parking_line.layer.borderColor = UIColor.white.cgColor
        return parking_line
    }()
    
    var parking_line5 : UIView = {
        var parking_line = UIView()
        parking_line.translatesAutoresizingMaskIntoConstraints = false
        parking_line.frame = CGRect(x: 10, y: 218, width: 100, height: 50)
        //parking_line.backgroundColor = .white
        parking_line.layer.borderWidth = 4
        parking_line.layer.borderColor = UIColor.white.cgColor
        return parking_line
    }()
    
    var parking_line6 : UIView = {
        var parking_line = UIView()
        parking_line.translatesAutoresizingMaskIntoConstraints = false
        parking_line.frame = CGRect(x: 10, y: 270, width: 100, height: 50)
        //parking_line.backgroundColor = .white
        parking_line.layer.borderWidth = 4
        parking_line.layer.borderColor = UIColor.white.cgColor
        return parking_line
    }()
    
    // left bottom
    
    var parking_line7 : UIView = {
        var parking_line = UIView()
        parking_line.translatesAutoresizingMaskIntoConstraints = false
        parking_line.frame = CGRect(x: 10, y: 470, width: 100, height: 50)
        //parking_line.backgroundColor = .white
        parking_line.layer.borderWidth = 4
        parking_line.layer.borderColor = UIColor.white.cgColor
        return parking_line
    }()
    
    var parking_line8 : UIView = {
        var parking_line = UIView()
        parking_line.translatesAutoresizingMaskIntoConstraints = false
        parking_line.frame = CGRect(x: 10, y: 522, width: 100, height: 50)
        //parking_line.backgroundColor = .white
        parking_line.layer.borderWidth = 4
        parking_line.layer.borderColor = UIColor.white.cgColor
        return parking_line
    }()
    
    var parking_line9 : UIView = {
        var parking_line = UIView()
        parking_line.translatesAutoresizingMaskIntoConstraints = false
        parking_line.frame = CGRect(x: 10, y: 574, width: 100, height: 50)
        //parking_line.backgroundColor = .white
        parking_line.layer.borderWidth = 4
        parking_line.layer.borderColor = UIColor.white.cgColor
        return parking_line
    }()
    
    var parking_line10 : UIView = {
        var parking_line = UIView()
        parking_line.translatesAutoresizingMaskIntoConstraints = false
        parking_line.frame = CGRect(x: 10, y: 626, width: 100, height: 50)
        //parking_line.backgroundColor = .white
        parking_line.layer.borderWidth = 4
        parking_line.layer.borderColor = UIColor.white.cgColor
        return parking_line
    }()
    
    var parking_line11 : UIView = {
        var parking_line = UIView()
        parking_line.translatesAutoresizingMaskIntoConstraints = false
        parking_line.frame = CGRect(x: 10, y: 678, width: 100, height: 50)
        //parking_line.backgroundColor = .white
        parking_line.layer.borderWidth = 4
        parking_line.layer.borderColor = UIColor.systemBlue.cgColor
        return parking_line
    }()
    
    
    //right
    
    var parking_line12 : UIView = {
        var parking_line = UIView()
        parking_line.translatesAutoresizingMaskIntoConstraints = false
        parking_line.frame = CGRect(x: 285, y: 10, width: 100, height: 50)
        //parking_line.backgroundColor = .white
        parking_line.layer.borderWidth = 4
        parking_line.layer.borderColor = UIColor.systemBlue.cgColor
        return parking_line
    }()
    
    var parking_line13 : UIView = {
        var parking_line = UIView()
        parking_line.translatesAutoresizingMaskIntoConstraints = false
        parking_line.frame = CGRect(x: 285, y: 62, width: 100, height: 50)
        //parking_line.backgroundColor = .white
        parking_line.layer.borderWidth = 4
        parking_line.layer.borderColor = UIColor.systemYellow.cgColor
        return parking_line
    }()
    
    var parking_line14 : UIView = {
        var parking_line = UIView()
        parking_line.translatesAutoresizingMaskIntoConstraints = false
        parking_line.frame = CGRect(x: 285, y: 114, width: 100, height: 50)
        //parking_line.backgroundColor = .white
        parking_line.layer.borderWidth = 4
        parking_line.layer.borderColor = UIColor.systemYellow.cgColor
        return parking_line
    }()
    
    var parking_line15 : UIView = {
        var parking_line = UIView()
        parking_line.translatesAutoresizingMaskIntoConstraints = false
        parking_line.frame = CGRect(x: 285, y: 166, width: 100, height: 50)
        //parking_line.backgroundColor = .white
        parking_line.layer.borderWidth = 4
        parking_line.layer.borderColor = UIColor.white.cgColor
        return parking_line
    }()
    
    var parking_line16 : UIView = {
        var parking_line = UIView()
        parking_line.translatesAutoresizingMaskIntoConstraints = false
        parking_line.frame = CGRect(x: 285, y: 218, width: 100, height: 50)
        //parking_line.backgroundColor = .white
        parking_line.layer.borderWidth = 4
        parking_line.layer.borderColor = UIColor.white.cgColor
        return parking_line
    }()
    
    var parking_line17 : UIView = {
        var parking_line = UIView()
        parking_line.translatesAutoresizingMaskIntoConstraints = false
        parking_line.frame = CGRect(x: 285, y: 270, width: 100, height: 50)
        //parking_line.backgroundColor = .white
        parking_line.layer.borderWidth = 4
        parking_line.layer.borderColor = UIColor.white.cgColor
        return parking_line
    }()
    
    var parking_line18 : UIView = {
        var parking_line = UIView()
        parking_line.translatesAutoresizingMaskIntoConstraints = false
        parking_line.frame = CGRect(x: 285, y: 322, width: 100, height: 50)
        //parking_line.backgroundColor = .white
        parking_line.layer.borderWidth = 4
        parking_line.layer.borderColor = UIColor.white.cgColor
        return parking_line
    }()
    
    var parking_line19 : UIView = {
        var parking_line = UIView()
        parking_line.translatesAutoresizingMaskIntoConstraints = false
        parking_line.frame = CGRect(x: 285, y: 374, width: 100, height: 50)
        //parking_line.backgroundColor = .white
        parking_line.layer.borderWidth = 4
        parking_line.layer.borderColor = UIColor.white.cgColor
        return parking_line
    }()
    
    var parking_line20 : UIView = {
        var parking_line = UIView()
        parking_line.translatesAutoresizingMaskIntoConstraints = false
        parking_line.frame = CGRect(x: 285, y: 426, width: 100, height: 50)
        //parking_line.backgroundColor = .white
        parking_line.layer.borderWidth = 4
        parking_line.layer.borderColor = UIColor.white.cgColor
        return parking_line
    }()
    
    var parking_line21 : UIView = {
        var parking_line = UIView()
        parking_line.translatesAutoresizingMaskIntoConstraints = false
        parking_line.frame = CGRect(x: 285, y: 478, width: 100, height: 50)
        //parking_line.backgroundColor = .white
        parking_line.layer.borderWidth = 4
        parking_line.layer.borderColor = UIColor.white.cgColor
        return parking_line
    }()
    
    var parking_line22 : UIView = {
        var parking_line = UIView()
        parking_line.translatesAutoresizingMaskIntoConstraints = false
        parking_line.frame = CGRect(x: 285, y: 530, width: 100, height: 50)
        //parking_line.backgroundColor = .white
        parking_line.layer.borderWidth = 4
        parking_line.layer.borderColor = UIColor.white.cgColor
        return parking_line
    }()
    
    var parking_line23 : UIView = {
        var parking_line = UIView()
        parking_line.translatesAutoresizingMaskIntoConstraints = false
        parking_line.frame = CGRect(x: 285, y: 582, width: 100, height: 50)
        //parking_line.backgroundColor = .white
        parking_line.layer.borderWidth = 4
        parking_line.layer.borderColor = UIColor.white.cgColor
        return parking_line
    }()
    
    var parking_line24 : UIView = {
        var parking_line = UIView()
        parking_line.translatesAutoresizingMaskIntoConstraints = false
        parking_line.frame = CGRect(x: 285, y: 634, width: 100, height: 50)
        //parking_line.backgroundColor = .white
        parking_line.layer.borderWidth = 4
        parking_line.layer.borderColor = UIColor.white.cgColor
        return parking_line
    }()
    
    
    var spacing_stackview : UIStackView = {
        var stack_view = UIStackView()
        stack_view.translatesAutoresizingMaskIntoConstraints = false
        stack_view.axis = .horizontal
        stack_view.alignment = .fill
        stack_view.spacing = 30
        stack_view.distribution = .equalSpacing
        return stack_view
    }()
    
    var data_log: UILabel = {
        var data_log = UILabel(frame: CGRect(x: 150, y: 750, width: 250, height: 50))
        data_log.backgroundColor = .white
        return data_log
    }()
    
    
    var log_button: UIButton = {
        
        var log_button = UIButton(frame: CGRect(x: 100, y: 750, width: 50, height: 50))
        log_button.backgroundColor = .black
        return log_button
        
    }()
    
    var dataFromFirst: String = ""
    
    var dataForm_x : Double = 0;
    var dataForm_y : Double = 0;
    
    var dataForm_x_list :[Double] = [0]
    var dataForm_y_list :[Double] = [0]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        
        view.addSubview(spacing_stackview)
        spacing_stackview.addSubview(parking_line)
        spacing_stackview.addSubview(parking_line2)
        spacing_stackview.addSubview(parking_line3)
        spacing_stackview.addSubview(parking_line4)
        spacing_stackview.addSubview(parking_line5)
        spacing_stackview.addSubview(parking_line6)
        
        spacing_stackview.addSubview(parking_line7)
        spacing_stackview.addSubview(parking_line8)
        spacing_stackview.addSubview(parking_line9)
        spacing_stackview.addSubview(parking_line10)
        spacing_stackview.addSubview(parking_line11)
        
        
        spacing_stackview.addSubview(parking_line12)
        spacing_stackview.addSubview(parking_line13)
        spacing_stackview.addSubview(parking_line14)
        spacing_stackview.addSubview(parking_line15)
        spacing_stackview.addSubview(parking_line16)
        spacing_stackview.addSubview(parking_line17)
        spacing_stackview.addSubview(parking_line18)
        spacing_stackview.addSubview(parking_line19)
        spacing_stackview.addSubview(parking_line20)
        spacing_stackview.addSubview(parking_line21)
        spacing_stackview.addSubview(parking_line22)
        spacing_stackview.addSubview(parking_line23)
        spacing_stackview.addSubview(parking_line24)
        
        spacing_stackview.addSubview(data_log)
        
        spacing_stackview.addSubview(log_button)
        
        //data_log.text = dataFromFirst
        
        dataForm_x_list.append(0)
        dataForm_y_list.append(0)
        setting_parking_line()
        
        log_button.addTarget(self, action: #selector(see_log_list), for: .allTouchEvents)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func see_log_list(){
        
        for i in 1..<self.dataForm_x_list.count{
            self.data_log.text = String(self.dataForm_x_list[i]) + ", " + String(self.dataForm_y_list[i])
            print("\(self.dataForm_x_list[i]) , \(self.dataForm_y_list[i])")
            self.data_log.textColor = .black
        }
        
    }
    
    func setting_parking_line(){
        NSLayoutConstraint.activate([
            spacing_stackview.topAnchor.constraint(equalTo: super.view.topAnchor),
            spacing_stackview.leftAnchor.constraint(equalTo: super.view.leftAnchor),
            spacing_stackview.rightAnchor.constraint(equalTo: super.view.rightAnchor),
            spacing_stackview.bottomAnchor.constraint(equalTo: super.view.bottomAnchor),
            
        ])
    }
}

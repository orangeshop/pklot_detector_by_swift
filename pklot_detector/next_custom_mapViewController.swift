//
//  next_custom_mapViewController.swift
//  pklot_detector
//
//  Created by 최영호 on 2023/03/31.
//

import UIKit

class next_custom_mapViewController: UIViewController {
    
    
    var image_view : UIImageView = {
        let image_view = UIImageView()
        image_view.translatesAutoresizingMaskIntoConstraints = false
        return image_view
    }()
    
   
    var arr = Array<UIView>()
    var count : Int = 0
    
    
    
    let size : CGFloat = 200
    var test_view : UIView = {
        var view1 = UIView()
        view1.backgroundColor = .systemPurple
        view1.isUserInteractionEnabled = true
        view1.isMultipleTouchEnabled = true
        return view1
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        view.addSubview(image_view)
        
        
        
//        test_view.frame = CGRect(x: 125, y: 300, width: size, height: size)
//        test_view.center = super.view.center
//        view.addSubview(test_view)
//        addGesture()
////
        
       
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(save_func)),
            UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(make_layer)),
        ]
        
        auto_layout()
    }
    
    func auto_layout(){
        NSLayoutConstraint.activate([
            image_view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            image_view.leftAnchor.constraint(equalTo: super.view.leftAnchor),
            image_view.rightAnchor.constraint(equalTo: super.view.rightAnchor),
            image_view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
    }
    

    
    @objc func make_layer(){
       
       // image_view.addSubview(make_inner_reactagle())
        arr.append(make_inner_reactagle())
        view.addSubview(arr[count])
        let Gesture = UIPinchGestureRecognizer(target: self,
                                               action: #selector(didPinch(_:)))
        let Gesture2 = UIPanGestureRecognizer(target: self,
                                              action: #selector(panPerformed(_:)))
        
        let Gesture3 = UITapGestureRecognizer(target: self,
                                           action: #selector(tapGesture(_:)))
        
        arr[count].isUserInteractionEnabled = true
        arr[count].isMultipleTouchEnabled = true
        arr[count].addGestureRecognizer(Gesture3)
        arr[count].addGestureRecognizer(Gesture)
        arr[count].addGestureRecognizer(Gesture2)
        arr[count].tag = count
        
        NSLayoutConstraint.activate([
            arr[count].topAnchor.constraint(equalTo: super.view.safeAreaLayoutGuide.topAnchor, constant: 100),
            arr[count].leftAnchor.constraint(equalTo: super.view.leftAnchor, constant: 100),
            arr[count].heightAnchor.constraint(equalToConstant: 150),
            arr[count].widthAnchor.constraint(equalToConstant: 150),
//            arr[count].rightAnchor.constraint(equalTo: super.view.rightAnchor, constant: -100),
//            arr[count].bottomAnchor.constraint(equalTo: super.view.bottomAnchor, constant: -100),
//
        ])
        
        print(arr[count].self)
        
        count += 1
        print("make_layer")
    }
    
    
    
    func make_inner_reactagle() -> UIView{
        print("reactangle")

        
        
        let view_round = UIView()
        view_round.translatesAutoresizingMaskIntoConstraints = false
       //view_round.frame = CGRect(x: 200, y: 200, width: 150, height: 100)
        view_round.backgroundColor = .blue
        view_round.layer.borderColor = UIColor.clear.cgColor
        view_round.layer.borderWidth = 1
        view_round.isUserInteractionEnabled = true
        view_round.isMultipleTouchEnabled = true
        view_round.tag = 999
        
        let inner_view = UIView()
        inner_view.translatesAutoresizingMaskIntoConstraints = false
        inner_view.backgroundColor = .systemGray
        inner_view.layer.borderColor = UIColor.white.cgColor
        inner_view.layer.borderWidth = 3
        inner_view.isMultipleTouchEnabled = true
        inner_view.isUserInteractionEnabled = true
        inner_view.tag = 1000
        //inner_view.frame = CGRect(x: 25, y: 25, width: 100, height: 50)
        
        let close_btn = UIView()
        close_btn.translatesAutoresizingMaskIntoConstraints = false
        close_btn.layer.cornerRadius = 15
        close_btn.backgroundColor = .blue
        close_btn.frame = CGRect(x: view_round.bounds.minX, y: view_round.bounds.maxY, width: 0, height: 0)
       
        
        view_round.addSubview(inner_view)
        view_round.addSubview(close_btn)
        

        NSLayoutConstraint.activate([
//            view_round.centerXAnchor.constraint(equalTo: image_view.centerXAnchor),
//            view_round.centerYAnchor.constraint(equalTo: image_view.centerYAnchor),
//            view_round.heightAnchor.constraint(equalToConstant: 100),
//            view_round.widthAnchor.constraint(equalToConstant: 100),
            
//            close_btn.topAnchor.constraint(equalTo: view_round.topAnchor),
//            close_btn.trailingAnchor.constraint(equalTo: view_round.trailingAnchor),
            close_btn.widthAnchor.constraint(equalToConstant: 30),
            close_btn.heightAnchor.constraint(equalToConstant: 30),
            
            
            
            inner_view.centerXAnchor.constraint(equalTo: view_round.centerXAnchor),
            inner_view.centerYAnchor.constraint(equalTo: view_round.centerYAnchor),
            inner_view.heightAnchor.constraint(equalToConstant: 50),
            inner_view.widthAnchor.constraint(equalToConstant: 100),
            
        ])
        
        
        return view_round
        
    }
    
    var tap_check : Bool = false
    
    @objc func tapGesture(_ sender: UITapGestureRecognizer){
        
    
        //sender.addTarget(self, action: #selector(test_func))
        
        print(sender.self)
        
        if(sender.state == .changed){
            print("클릭")
        }
        
        
        if sender.state == .ended{
            print("tap")

            
            let close_btn = sender.view?.viewWithTag(1234)
            
            if(tap_check == false){
                
                close_btn?.backgroundColor = .systemGray
                
                sender.view?.layer.borderColor = UIColor.systemYellow.cgColor
               
                
                
               
                tap_check = true

            }
            else{
                
                // 해당 바운드 이외를 클릭 or 종료버튼
                
                close_btn?.backgroundColor = .clear
                sender.view?.layer.borderColor = UIColor.clear.cgColor
                tap_check = false
            }
            //let translation = sender.location(in: sender.view)
            let x_dot = sender.location(in: sender.view).x
            let y_dot =  sender.location(in: sender.view).y
            //***방아온 view에 내부의 클락 좌표(마우스 클릭 위치)
        
            
            let test_round = UIView()
            test_round.translatesAutoresizingMaskIntoConstraints = false
            test_round.layer.borderWidth = 1
            test_round.layer.borderColor = UIColor.systemYellow.cgColor
            test_round.frame = CGRect(x: x_dot, y: y_dot, width: 100, height: 100)
            //sender.view?.addSubview(test_round)
        }
        
        
    }
    
    @objc func didPinch(_ gesture: UIPinchGestureRecognizer){
        print("didPinch")
        //guard gesture.view != nil else { return }

        
        if gesture.state == .began{
            gesture.view?.backgroundColor = .systemBrown
        }
        
        let view = gesture.view?.viewWithTag(1000)
        let view2 = gesture.view?.viewWithTag(999)
        
        if gesture.state == .changed || gesture.state == .began{
            let scale = gesture.scale
            print(scale)
            //view2?.transform = CGAffineTransform(scaleX: scale, y: scale)
            gesture.view?.transform = CGAffineTransform(scaleX: scale, y: scale)
            //view?.transform = CGAffineTransform(scaleX: scale, y: scale)
            
//            gesture.view?.frame = CGRect(
//                x: 0,
//                y: 0,
//                width: size * scale,
//                height : size * scale
//            )
//            gesture.view?.center = view.center
            
            
        }
        
        if gesture.state == .ended {
            gesture.view?.backgroundColor = .systemBrown
        }
    }
    
    
    @objc func panPerformed(_ sender : UIPanGestureRecognizer){
        print("panPerformed")
        print(sender.self)
        
       
        if(sender.state == .began){
            sender.view?.backgroundColor = .systemPink
        }
        
        if sender.state == .began || sender.state == .changed{
            let translation = sender.translation(in: sender.view)
            let change_x = (sender.view?.center.x)! + translation.x
            let change_y = (sender.view?.center.y)! + translation.y
            
            sender.view?.center = CGPoint(x: change_x, y: change_y)
            sender.setTranslation(CGPoint.zero, in: sender.view)
            
        }
        
        
        if(sender.state == .ended){
            sender.view?.backgroundColor = .clear
            
        }
        
        
    }
    
    func target_reactragle_view() -> UIView{
        let view1 = UIView()
        view1.backgroundColor = .clear
        view1.layer.borderColor = UIColor.systemYellow.cgColor
        view1.layer.borderWidth = 1
        view1.translatesAutoresizingMaskIntoConstraints = false
        
        view.center = view1.center
        
        
        
        return view1
    }
    
    
    
    
    @objc func moving_reactangle(){
        print("moving react")
    }
    
    @objc func save_func(_ sender : Any){
        
    }
    
//    @objc func test_func(){
//        print("test click !")
//
//
//    }

    
    func addGesture(){
        print("addGesture")
        let Gesture = UIPinchGestureRecognizer(target: self,
                                               action: #selector(didPinch(_:)))
        test_view.addGestureRecognizer(Gesture)

        let Gesture2 = UIPanGestureRecognizer(target: self,
                                              action: #selector(panPerformed(_:)))
        
        test_view.addGestureRecognizer(Gesture2)
        
        
        
        
        print(Gesture.self)
        print(test_view.self)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

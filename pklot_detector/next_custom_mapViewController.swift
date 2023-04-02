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
//
        
       
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
        
        print(arr[count].self)
        
        count += 1
        print("make_layer")
    }
    
    
    
    func make_inner_reactagle() -> UIView{
        print("reactangle")
//        let reactangle = UIView()
//        reactangle.layer.borderWidth = 3
//        reactangle.layer.borderColor = UIColor.white.cgColor
//        reactangle.translatesAutoresizingMaskIntoConstraints = false
//        reactangle.backgroundColor = .clear
//        reactangle.tag = 1
//        reactangle.frame = CGRect(x: 100 + (count * 10), y: 100, width: 100, height: 50)
//        return reactangle
        
        
        let view_round = UIView()
        view_round.translatesAutoresizingMaskIntoConstraints = false
        view_round.frame = CGRect(x: 200, y: 200, width: 150, height: 100)
        view_round.backgroundColor = .clear
        view_round.layer.borderColor = UIColor.clear.cgColor
        view_round.layer.borderWidth = 1
        
        
        let inner_view = UIView()
        inner_view.translatesAutoresizingMaskIntoConstraints = false
        inner_view.backgroundColor = .clear
        inner_view.layer.borderColor = UIColor.white.cgColor
        inner_view.layer.borderWidth = 3
        inner_view.frame = CGRect(x: 25, y: 25, width: 100, height: 50)
        
        let close_btn = UIView()
        close_btn.translatesAutoresizingMaskIntoConstraints = false
        close_btn.layer.cornerRadius = 15
        close_btn.backgroundColor = .none
        close_btn.frame = CGRect(x: view_round.bounds.maxX-15, y: view_round.bounds.minY-15, width: 30, height: 30)
        close_btn.tag = 1234
        
        view_round.addSubview(inner_view)
        view_round.addSubview(close_btn)

        return view_round
        
    }
    
    var tap_check : Bool = false
    
    @objc func tapGesture(_ sender: UITapGestureRecognizer){
        
    
        //sender.addTarget(self, action: #selector(test_func))
        
        if(sender.state == .changed){
            print("클릭")
        }
        
        
        if sender.state == .ended{
            print("tap")

            
            let close_btn = sender.view?.viewWithTag(1234)
            
            if(tap_check == false){
                
//                sender.view?.backgroundColor = .clear
//                sender.view?.layer.borderWidth = 1
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
        guard gesture.view != nil else { return }

        
        if gesture.state == .changed{
            let scale = gesture.scale
            print(scale)
            test_view.frame = CGRect(
                x: 0,
                y: 0,
                width: size * scale,
                height : size * scale
            )
            test_view.center = view.center
        }
    }
    
    
    @objc func panPerformed(_ sender : UIPanGestureRecognizer){
        print("panPerformed")
        print(sender.self)
        
       
        if(sender.state == .began){
            //sender.view?.backgroundColor = .systemPink
        }
        
        
        
        if sender.state == .began || sender.state == .changed{
            let translation = sender.translation(in: sender.view)
            let change_x = (sender.view?.center.x)! + translation.x
            let change_y = (sender.view?.center.y)! + translation.y
            
            sender.view?.center = CGPoint(x: change_x, y: change_y)
            sender.setTranslation(CGPoint.zero, in: sender.view)
            
        }
        
        let test_tag = self.view.viewWithTag(1)
        
        if(sender.state == .ended){
            //sender.view?.backgroundColor = .none
            
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

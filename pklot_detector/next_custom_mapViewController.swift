//
//  next_custom_mapViewController.swift
//  pklot_detector
//
//  Created by 최영호 on 2023/03/31.
//
import Foundation
import UIKit

class next_custom_mapViewController: UIViewController {
    
    
    var image_view : UIImageView = {
        let image_view = UIImageView()
        image_view.translatesAutoresizingMaskIntoConstraints = false
        return image_view
    }()
    
   
    
    var count : Int = 0
    var lastRotation: CGFloat = 0
    var lastPosition: CGPoint?
    
    
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
    

    
    /// plus qj
    @objc func make_layer(){
       
        arr.append(make_inner_reactagle())
        pk_lot_check_result.append(false)
        pk_lot_check_ratio.append(100)
        
        
        view.addSubview(arr[count])
        let Gesture = UIPinchGestureRecognizer(target: self,
                                               action: #selector(didPinch(_:)))
        let Gesture2 = UIPanGestureRecognizer(target: self,
                                              action: #selector(panPerformed(_:)))
        
        let Gesture3 = UITapGestureRecognizer(target: self,
                                           action: #selector(tapGesture(_:)))
        
        //let Gesture4 = UIRotationGestureRecognizer(target: self,action: #selector(Rotation(_ :)))
        
        arr[count].isUserInteractionEnabled = true
        arr[count].isMultipleTouchEnabled = true
        arr[count].addGestureRecognizer(Gesture3)
        arr[count].addGestureRecognizer(Gesture)
        arr[count].addGestureRecognizer(Gesture2)
        //arr[count].addGestureRecognizer(Gesture4)
        arr[count].tag = count
        
       
        
        auto_layout_plus()
        
        print(arr[count].self)
        
        count += 1
        print("make_layer")
    }
    
    /// 오류
    /// auto layout 사용시 plus 버튼을 눌렀을 시 생성된 레이어들의 좌표가 초기화가 됨
    /// 해결 방법
    /// 해당하는 arr[count]에 ttranslatesAutoresizingMaskIntoConstraints을 false에서 -> true로 바꾸니 해결됨
    func auto_layout_plus(){
        
        
        NSLayoutConstraint.activate([
            arr[count].topAnchor.constraint(equalTo: super.view.safeAreaLayoutGuide.topAnchor, constant: 100),
            arr[count].leftAnchor.constraint(equalTo: super.view.leftAnchor, constant: 100),
            arr[count].heightAnchor.constraint(equalToConstant: 150),
            arr[count].widthAnchor.constraint(equalToConstant: 150),
            
        ])
        arr[count].translatesAutoresizingMaskIntoConstraints = true
    }
    
    
    func make_inner_reactagle() -> UIView{
        print("reactangle")

        
        
        let view_round = UIView()
        view_round.translatesAutoresizingMaskIntoConstraints = false
        view_round.frame = CGRect(x: 200, y: 200, width: 150, height: 100)
        view_round.backgroundColor = .clear
        view_round.layer.borderColor = UIColor.clear.cgColor
        view_round.layer.borderWidth = 1
        view_round.isUserInteractionEnabled = true
        view_round.isMultipleTouchEnabled = true
        view_round.tag = 999
        
        let inner_view = UIView()
        inner_view.translatesAutoresizingMaskIntoConstraints = false
        inner_view.backgroundColor = .clear
        inner_view.layer.borderColor = UIColor.white.cgColor
        inner_view.layer.borderWidth = 3
        inner_view.isMultipleTouchEnabled = true
        inner_view.isUserInteractionEnabled = true
        inner_view.tag = 1000
        //inner_view.frame = CGRect(x: 25, y: 25, width: 100, height: 50)
        
        let close_btn = UIView()
        close_btn.translatesAutoresizingMaskIntoConstraints = false
        close_btn.layer.cornerRadius = 5
        close_btn.backgroundColor = .clear
        close_btn.tag = 1001
        //close_btn.frame = CGRect(x: view_round.bounds.maxX, y: view_round.bounds.maxY, width: 0, height: 0)
       
        
        view_round.addSubview(inner_view)
        view_round.addSubview(close_btn)
        

        NSLayoutConstraint.activate([
            
            close_btn.topAnchor.constraint(equalTo: view_round.topAnchor),
            close_btn.trailingAnchor.constraint(equalTo: view_round.trailingAnchor),
            close_btn.widthAnchor.constraint(equalToConstant: 30),
            close_btn.heightAnchor.constraint(equalToConstant: 30),
            
            inner_view.centerXAnchor.constraint(equalTo: view_round.centerXAnchor),
            inner_view.centerYAnchor.constraint(equalTo: view_round.centerYAnchor),
            inner_view.heightAnchor.constraint(equalToConstant: 50),
            inner_view.widthAnchor.constraint(equalToConstant: 100),
            
        ])
        let Gesture4 = UIRotationGestureRecognizer(target: self,
                                                   action: #selector(Rotation(_ :)))
        inner_view.addGestureRecognizer(Gesture4)
        
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

            
            let close_btn = sender.view?.viewWithTag(1001)
            
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
           
        }
        
        if gesture.state == .changed || gesture.state == .began{
            let scale = gesture.scale
            print(scale)
            gesture.view?.transform = CGAffineTransform(scaleX: scale, y: scale)

        }
        
        if gesture.state == .ended {
        }
    }
    
    var drection_check : Int = 0
    
    @objc func panPerformed(_ sender : UIPanGestureRecognizer){
        print("panPerformed")
        //print(sender.self)
        guard let view = sender.view else { return }
       
        
        if(sender.state == .began){

        }
        
        if sender.state == .began || sender.state == .changed{
            
            
            let translation = sender.translation(in: sender.view)
            print("defualt : \(translation.x) , \(translation.y)")
            let change_x = (sender.view?.center.x)! + (translation.x)
            let change_y = (sender.view?.center.y)! + (translation.y)
            
            
            
            print("change_x, change_y : \(change_x) , \(change_y)")
            
            sender.view?.center = CGPoint(x: change_x, y: change_y)
            sender.setTranslation(CGPoint.zero, in: sender.view)
            

        }
        
        
        if(sender.state == .ended){
            sender.view?.backgroundColor = .clear
            
        }
    }
    
    
    var test_x : CGFloat?
    var test_y : CGFloat?
    
    
    @objc func Rotation(_ sender : UIRotationGestureRecognizer){
        
        print("Rotation")
        
        if sender.state == .began{
            
        }
        
        
        if let rotationView = sender.view {
            rotationView.transform = CGAffineTransformRotate(rotationView.transform, sender.rotation)
            
            sender.rotation = 0.0
        }
        
        if(sender.state == .ended){
//            if(Double(sender.view?.transform.a ?? 0) > 0 && Double(sender.view?.transform.b ?? 0) < 0 && Double(sender.view?.transform.c ?? 0) > 0 && Double(sender.view?.transform.d ?? 0) > 0){
//                print("0에서 90도 사이")
//                test_x = sender.view?.transform.b
//                drection_check = 0
//
//            }
//            else if(Double(sender.view?.transform.a ?? 0) < 0 && Double(sender.view?.transform.b ?? 0) < 0 && Double(sender.view?.transform.c ?? 0) > 0 && Double(sender.view?.transform.d ?? 0) < 0){
//                print("90에서 180도 사이")
//                drection_check = 0
//
//            }
//            else if(Double(sender.view?.transform.a ?? 0) < 0 && Double(sender.view?.transform.b ?? 0) > 0 && Double(sender.view?.transform.c ?? 0) < 0 && Double(sender.view?.transform.d ?? 0) < 0){
//                print("180에서 270도 사이")
//                drection_check = 0
//            }
//            else if(Double(sender.view?.transform.a ?? 0) > 0 && Double(sender.view?.transform.b ?? 0) > 0 && Double(sender.view?.transform.c ?? 0) < 0 && Double(sender.view?.transform.d ?? 0) > 0){
//                print("270에서 360도 사이")
//                drection_check = 0
//            }
//            else{
//
//            }
        }
    }
    

    
    
    
    
    @objc func moving_reactangle(){
        print("moving react")
    }
    
    @objc func save_func(_ sender : Any){
        
        var vc = FirebaseReadWrite()
        
        for i in 0 ..< arr.count{
            print(arr[i])
            print(arr[i].self.frame)
            
            var str = arr[i].self.frame
            let restr = "\(str)"
            vc.writevalue(frame_resourese : restr)
            
            
        }
        
        
        
       
        
        for i in 0 ..< 2{
            navigationController?.popViewController(animated: true)
        }
        
        
        
    }
    


    
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


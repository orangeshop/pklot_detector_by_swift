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
    
    var reactangle = UIView()
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
        
        
        
        test_view.frame = CGRect(x: 125, y: 300, width: size, height: size)
        test_view.center = super.view.center
        view.addSubview(test_view)
        addGesture()
        
        
       
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
    
    func addGesture(){
        print("addGesture")
        var Gesture = UIPinchGestureRecognizer(target: self,
                                               action: #selector(didPinch(_:)))
        test_view.addGestureRecognizer(Gesture)

        var Gesture2 = UIPanGestureRecognizer(target: self,
                                              action: #selector(panPerformed(_:)))
        
        test_view.addGestureRecognizer(Gesture2)
        
        print(Gesture.self)
        print(test_view.self)
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
    
    @objc func make_layer(){
       
       // image_view.addSubview(make_inner_reactagle())
        arr.append(make_inner_reactagle())
        image_view.addSubview(arr[count])
        
        count += 1
        print(reactangle.self)
        print("make_layer")
    }
    
    
    
    @objc func panPerformed(_ sender : UIPanGestureRecognizer){
        print("panPerformed")
        if sender.state == .began || sender.state == .changed{
            let translation = sender.translation(in: sender.view)
            let change_x = (sender.view?.center.x)! + translation.x
            let change_y = (sender.view?.center.y)! + translation.y
            
            sender.view?.center = CGPoint(x: change_x, y: change_y)
            sender.setTranslation(CGPoint.zero, in: sender.view)
            
        }
    }
    
    
    
    
    func make_inner_reactagle() -> UIView{
        print("reactangle")
        
        reactangle.layer.borderWidth = 3
        reactangle.layer.borderColor = UIColor.white.cgColor
        reactangle.translatesAutoresizingMaskIntoConstraints = false
        reactangle.backgroundColor = .clear
        reactangle.tag = 1
        //reactangle.widthAnchor.constraint(equalToConstant: 100).isActive = true
        //reactangle.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //reactangle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //reactangle.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        reactangle.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        return reactangle
    }
    
    @objc func moving_reactangle(){
        print("moving react")
    }
    
    @objc func save_func(){
        
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

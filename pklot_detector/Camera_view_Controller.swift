//
//  ViewController.swift
//  AiTest
//
//  Created by 최영호 on 2023/01/23.
//

import UIKit
import SwiftUI
import AVFoundation
import Vision


class CameraViewController1: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {

    
    private var permissionGranted = false
    private let captureSession = AVCaptureSession()
    private let sessionQueue = DispatchQueue(label: "SessionQueue")
    
    var previewLayer = AVCaptureVideoPreviewLayer()
    var screenRect : CGRect! = nil
    
    private var videoOutput = AVCaptureVideoDataOutput()
    var requests = [VNRequest]()
    
    var detectionLayer: CALayer! = nil
   
    
    var data_x_list = [Double]()
    var data_y_list = [Double]()
    
    //var vc = CameraViewController1()
    
    override func viewDidLoad() {
        checkPermission()
        view.backgroundColor = .white

        sessionQueue.async { [unowned self] in
            guard permissionGranted else {return}
            self.setupCaptureSession()
            self.setupLayers()
            self.setupDetector()
            self.captureSession.startRunning()
        }
        
        let make_map_button = UIButton()
        view.addSubview(make_map_button)
        make_map_button.backgroundColor = .orange
        make_map_button.addTarget(self, action: #selector(popup_button), for: .allTouchEvents)
        make_map_button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            make_map_button.topAnchor.constraint(equalTo: super.view.topAnchor, constant: 650),
            make_map_button.leftAnchor.constraint(equalTo: super.view.leftAnchor, constant: 20),
            make_map_button.rightAnchor.constraint(equalTo: super.view.rightAnchor, constant: -20),
            make_map_button.bottomAnchor.constraint(equalTo: super.view.bottomAnchor, constant: -20)
        ])
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    @objc func popup_button(){
        
        let vc = makeMapViewController()
        
        //vc.dataFromFirst = String(data_x) + String(", ") + String(data_y)
        
        vc.dataForm_x_list = data_x_list
        vc.dataForm_y_list = data_y_list
        //vc.dataFromFirst =
        //vc.dataFromFirst = "\(tran)"
        present(vc, animated: true)
        print("tap pop up")
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        screenRect = UIScreen.main.bounds
        
        self.previewLayer.frame = CGRect(x: 0, y: 0, width: screenRect.size.width, height: screenRect.size.height)
        self.previewLayer.connection?.videoOrientation = .landscapeLeft
        switch UIDevice.current.orientation{
            
        case UIDeviceOrientation.portraitUpsideDown:
            self.previewLayer.connection?.videoOrientation = .portraitUpsideDown
            
        case UIDeviceOrientation.landscapeLeft:
            self.previewLayer.connection?.videoOrientation = .landscapeRight
        case UIDeviceOrientation.landscapeRight:
            self.previewLayer.connection?.videoOrientation = .landscapeLeft
        case UIDeviceOrientation.portrait :
            self.previewLayer.connection?.videoOrientation = .portrait
        default:
            break
        }
        
    }
    func checkPermission(){
        switch AVCaptureDevice.authorizationStatus(for: .video){
            
        case .authorized:
            permissionGranted = true
            
        case .notDetermined:
            requestPermission()
            
        default:
            permissionGranted = false
        }
    }
    
    func requestPermission(){
        sessionQueue.suspend()
        AVCaptureDevice.requestAccess(for: .video, completionHandler: {[unowned self] granted in self.permissionGranted = granted
            self.sessionQueue.resume()
        })
    }
    
    func setupCaptureSession(){
        guard let videoDevice = AVCaptureDevice.default(.builtInDualWideCamera, for: .video, position: .back) else {return}
        guard let videoDeviceInput = try? AVCaptureDeviceInput(device: videoDevice) else {return}
        
        guard captureSession.canAddInput(videoDeviceInput) else {return}
        captureSession.addInput(videoDeviceInput)
        
        screenRect = UIScreen.main.bounds
        
        previewLayer = AVCaptureVideoPreviewLayer(session:  captureSession)
        previewLayer.frame = CGRect(x: 0, y: 0, width: screenRect.size.width, height: screenRect.size.height/1.5)
        previewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        
        previewLayer.connection?.videoOrientation = .portrait
       
        videoOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "sampleBufferQueue"))
        captureSession.addOutput(videoOutput)
        
        DispatchQueue.main.async {
            [weak self] in
            self!.view.layer.addSublayer(self!.previewLayer)
        }
        
    }
}

struct HostedViewController: UIViewControllerRepresentable{
    func makeUIViewController(context: Context) -> some UIViewController {
        return CameraViewController1()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}

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
    private let sessionQueue = DispatchQueue(label:"SessionQueue")
    
    var previewLayer = AVCaptureVideoPreviewLayer()
    var screenRect : CGRect! = nil
    
    private var videoOutput = AVCaptureVideoDataOutput()
    var requests = [VNRequest]()
    
    var detectionLayer: CALayer! = nil
   
    var data_x_list = [Double]()
    var data_y_list = [Double]()
    
    let reload_btn : UIButton = {
        let btn = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white
        return btn
    }()
    
    let btn_image : UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(systemName: "arrow.counterclockwise")
        return img
    }()
    
    override func viewDidLoad() {
        checkPermission()
        view.backgroundColor = .black

        sessionQueue.async { [unowned self] in
            guard permissionGranted else {return}
            self.setupCaptureSession()
            self.setupLayers()
            self.setupDetector()
            self.captureSession.startRunning()
        }
    }
    
    func add_layer(){
        for i in 0 ..< 10{
            detectionLayer.addSublayer(make_layer(cnt: i, color: UIColor.white))
        }
    }

    func make_layer(cnt : Int, color : UIColor) -> CALayer{
        let layer1 = CALayer()

        layer1.frame = CGRect(x: arr[cnt].frame.minX + ((arr[cnt].frame.height-50)/2), y: arr[cnt].frame.minY + ((arr[cnt].frame.width-100)/2), width: 100, height: 50)
        layer1.borderColor = UIColor.white.cgColor
        layer1.borderWidth = 3

        layer1.backgroundColor = color.cgColor
        return layer1
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
        previewLayer.frame = CGRect(x: 0, y: 0, width: screenRect.size.width, height: screenRect.size.height)
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

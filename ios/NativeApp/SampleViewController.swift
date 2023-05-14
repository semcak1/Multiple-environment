//
//  SampoleViewController.swift
//  MultipleEnvironment
//
//  Created by Semih Çakmak on 26.03.2023.
//

import UIKit
import React



@objc class SampleViewController: UIViewController,RCTBridgeDelegate {
 
  
  
  
  //    @objc var parameters: NSDictionary?
  //    @objc var home: NSString?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("Sample vc açıldı")
    
    // NavigationViewController ayarları
    
    self.navigationItem.title = "Sample Title"
    //          self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: nil, action: nil)
    
    //     navController.setNavigationBarHidden(false, animated: true)
    // ViewController'ın background color'ı ayarlanıyor
    view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    
    // Label oluşturuluyor ve özellikleri ayarlanıyor
    let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
    label.center = CGPoint(x: 160, y: 285)
    label.textAlignment = .center
    label.text = "Merhaba Dünya"
    label.textColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
    
    // Button ekle
    let button = UIButton(frame: CGRect(x: 0, y: 100, width: 200, height: 50))
    button.backgroundColor = .blue
    button.setTitleColor(.white, for: .normal)
    button.setTitle("geri git", for: .normal)
    button.addTarget(self, action: #selector(onBackButtonPressed), for: .touchUpInside)
    
    
    // Label view'e ekleniyor
    view.addSubview(label)
    view.addSubview(button)
    
    // Do any additional setup after loading the view.
    // navigation stackteki screen ler
    guard let css = navigationController?.viewControllers else {
      return 
    }
     
    print("vcs \(css )")
    
  }
  
  //  override func viewDidLayoutSubviews() {
  //    self.view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
  //  }
  
  
  
  
  
  
  // MARK: - Navigation
  
//
//  func sourceURL(for bridge: RCTBridge!) -> URL! {
//    return URL(string: "asd")
//  }
//
  func sourceURL(for bridge: RCTBridge!) -> URL! {
  #if DEBUG
  return RCTBundleURLProvider.sharedSettings().jsBundleURL(forBundleRoot: "index", fallbackResource: nil)
  #else
  return Bundle.main.url(forResource: "main", withExtension: "jsbundle")
  #endif
  }






  
  @objc func onBackButtonPressed(){
    //    self.dismiss(animated: true)
    
    
    print("dismissed")
    
  
    guard let jsCodeLocation = URL(string: "http://localhost:8081/index.bundle?platform=ios") else { return  }
    let mockData:[String:[[String:String]]] = ["scores":
                                                [
                                                  ["name":"Alex", "value":"42"],
                                                  ["name":"Joel", "value":"10"]
                                                ]
    ]
    
    // RN ye dönüş bundle url ile
//    guard let bridge = RCTBridge(bundleURL: jsCodeLocation, moduleProvider: nil, launchOptions: nil) else { return  }
//    let rootView = RCTRootView(bridge: bridge, moduleName: "MultipleEnvironment", initialProperties: nil)
    
    // RN ye dönüş delegate ile
    guard let bridge = RCTBridge(bundleURL: jsCodeLocation, moduleProvider: nil) else { return  }
//    guard let bridge = RCTBridge(bundleURL: jsCodeLocation, moduleProvider: nil) else {
//      return
//    }
    let rootView = RCTRootView(bridge: bridge, moduleName: "MultipleEnvironment", initialProperties: nil)

    if #available(iOS 13.0, *) {
        rootView.backgroundColor = UIColor.systemBackground
    } else {
        rootView.backgroundColor = UIColor.white
    }

//    UIApplication.shared.windows.first?.w = UIWindow(frame: UIScreen.main.bounds)
    let rootViewController = UIViewController()
    rootViewController.view = rootView
//    self.present(rootViewController, animated: true, completion: nil)
//    UIApplication.shared.delegate?.window??.rootViewController = rootViewController
//    UIApplication.shared.windows.first?.rootViewController = rootViewController
    
    UIApplication.shared.windows.first?.rootViewController = rootViewController
    
//    for window in UIApplication.shared.windows {
//      print("window  \(window.)")
//    }
    
//    print("window \( UIApplication.shared.windows)")
    
//    window?.rootViewController = rootViewController
//    UIApplication.shared.windows.first?.makeKeyAndVisible()
//    window?.makeKeyAndVisible()
  
    
    
    
    //     let rootView = RCTRootView(
    //         bundleURL: jsCodeLocation,
    //         moduleName: "MultipleEnvironment",
    ////         initialProperties: mockData as [NSObject : AnyObject],
    //         initialProperties: mockData ,
    //         launchOptions: nil
    //     )
    
   
    // MARK: -   Çalışan kod
//    let vc = UIViewController()
//    vc.view = rootView
//    self.present(vc, animated: true, completion: nil)
    
    
    // MARK: -   Kök view e gitme
//    navigationController?.popToRootViewController(animated: true)

   
    // MARK: -   işe yaramayan metot
    //    UIApplication.shared.windows.first?.rootViewController = navigationController
    //    UIApplication.shared.windows.first?.makeKeyAndVisible()
    
    
  }
  
  
  
}

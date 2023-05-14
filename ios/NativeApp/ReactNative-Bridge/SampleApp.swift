//
//  SampleApp.swift
//  MultipleEnvironment
//
//  Created by Semih Çakmak on 26.03.2023.
//

import Foundation

@objc(SampleApp)
class SampleApp : NSObject {
  
  @objc static func requiresMainQueueSetup() -> Bool { return true }
  
  @objc func openSampleApp(){
    // app delegate teki yazdığımız metodu çağıracak
    DispatchQueue.main.async {
          let viewController = SampleViewController()
          // burada native view controller'a geçirilecek parametreleri alabilirsiniz
          // viewController.parameters = ...
          let navigationController = UINavigationController(rootViewController: viewController)
//      navigationController.pushViewController(viewController, animated: true)
          UIApplication.shared.keyWindow?.rootViewController?.present(navigationController, animated: true, completion: nil)
//      UIApplication.shared.windows.first?.rootViewController = navigationController
//        UIApplication.shared.windows.first?.makeKeyAndVisible()
        }
    
    
    
    
  }
}

//
//  CopyToClipboard.swift
//  MultipleEnvironment
//
//  Created by Semih Çakmak on 24.03.2023.
//

import Foundation


@objc(CopyToClipboard)
class CopyToClipboard : NSObject {
  
  @objc static func requiresMainQueueSetup() -> Bool { return true }
  
 @objc
  func funcWithParams(_ text:String,second:Int){
    print("copy func \(text)  ikinci param \(second)")
    
  }
  
 @objc
 func basicFunc() -> Void {
    print("basic func")
  }
  
  @objc func basicFuncCallback(_ callback:RCTResponseSenderBlock){
    callback(["semih",2,["1","2","3"]])
  }
  
  @objc func asyncFunc(_ num: Int, name : String, surname : String, resolve: RCTPromiseResolveBlock, reject: RCTPromiseRejectBlock){
    
    if name == "sem" {
      resolve("haha data")
    } else {
      reject("2rejet","2. param",nil)
    }
   
  }
  
  @objc func funcWithOptionalParams(_ first:String?,second:NSNumber,third:NSNumber,dic:[String:Any]?){
//    guard let newDic = dic as? [String:Any] else{
//      return
//    }
    print("first:\(first ?? "ilk değer")  second:\(second )  third:\(third) dictionary: \(dic ?? ["default":1] )")
  }
  
  @objc func copy (_ text:String){
    UIPasteboard.general.string = text
  }
  
  @objc func paste (_ callback:RCTResponseSenderBlock){
    
    callback([UIPasteboard.general.string ?? ""])
    
  }
}

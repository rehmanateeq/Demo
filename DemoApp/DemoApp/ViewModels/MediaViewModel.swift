//
//  MediaViewModel.swift
//  DemoApp
//
//  Created by Ateeq on 7/10/21.
//

import Foundation
import UIKit

class MediaViewModel : NSObject{
    
    var responseCallBack : ((MediaModel)->())?
    
    func loadMediaApi(){
        
        NetworkHandler.instance.request(methodType: .get, url:URLs.string.mediaDetails , parameters: nil, returnType: MediaModel.self, { [weak self] response in
            
            guard let strongSelf = self else{return}
            guard let model = response else{return}
            
            strongSelf.responseCallBack?(model)
            
        })
        
    }
    
}



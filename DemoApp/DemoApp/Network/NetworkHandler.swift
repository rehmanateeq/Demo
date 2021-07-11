import Foundation
import UIKit
import Alamofire



typealias ApiSuccess = ( (_ data:Any?) -> ())
typealias ApiFailure = ( (_ error:String) -> ())

class NetworkHandler {
    
    public static let instance = NetworkHandler()
    
    var headers: HTTPHeaders = ["Content-Type": "application/json"]
    var getHeader: HTTPHeaders = ["Accept": "application/json"]
    
    internal func request<T : Codable>(methodType: HTTPMethod ,url:String, parameters: [String: Any]? , returnType:T.Type, decodeComplete:Bool = false, encoding: ParameterEncoding = JSONEncoding.default, _ apiSuccess: @escaping (_ data:T?) -> (), _ apiError: ApiFailure? = nil) {
        

        AF.request( url, method: methodType, parameters: parameters, encoding: methodType == .get ? URLEncoding.default : encoding, headers: headers).responseData(completionHandler: {   response in
            
            switch response.result {
            case .success(let value):
                do {
                    
                    let object = try JSONDecoder().decode(returnType.self, from: value)
                    apiSuccess(object)
                    
                } catch let error {
                    apiError?(error.localizedDescription)
                }
            case .failure(let error):
                print("**#* API Failure : \(error)")
                apiError?(error.localizedDescription)
            }
        })
        
    }
    
}

class Connectivity {
    class var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}

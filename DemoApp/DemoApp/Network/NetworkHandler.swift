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
    
    
    //    func showError(title: String, message: String, vc:UIViewController?) {
    //        DispatchQueue.main.async {
    //            guard let vc = vc else {
    //                print("No VC found")
    //                return
    //            }
    //            Commons.showAlert(title: title, message: message, VC: vc)
    //        }
    //    }
    //
    //    private func showLoading(on view: UIView, viewId: String) {
    //        DispatchQueue.main.async { [weak self] in
    //            if let strongSelf = self {
    //                if let indicator = strongSelf.indicators[viewId] {
    //                    strongSelf.indicators[viewId]?.1 = indicator.1 + 1
    //                    return
    //                }
    //                let size = CustomLoaderView.viewSize
    //                let indicator = CustomLoaderView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
    //                indicator.translatesAutoresizingMaskIntoConstraints = false
    //                view.addSubview(indicator)
    //                indicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    //                indicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    //                indicator.widthAnchor.constraint(equalToConstant: size.width).isActive = true
    //                indicator.heightAnchor.constraint(equalToConstant: size.height).isActive = true
    //                indicator.startAnimating()
    //                strongSelf.indicators[viewId] = (indicator, 0)
    //            }
    //        }
    //    }
    //
    //    private func hideLoading(on viewId: String) {
    //        DispatchQueue.main.async { [weak self] in
    //            if let strongSelf = self {
    //                guard let indicator = strongSelf.indicators[viewId] else {
    //                    return
    //                }
    //                if indicator.1 > 0 {
    //                    strongSelf.indicators[viewId]?.1 = indicator.1 - 1
    //                    return
    //                }
    //                strongSelf.indicators[viewId]?.0.stopAnimating()
    //                strongSelf.indicators[viewId] = nil
    //            }
    //        }
    //    }
    //
    //
    //    private func showProgressBar(vc: UIViewController? = nil) {
    //        DispatchQueue.main.async {
    //            UIApplication.shared.beginIgnoringInteractionEvents()
    //            if let view = vc?.view, let viewId = vc?.description {
    //                self.showLoading(on: view, viewId: viewId)
    //            } else if let rvc = UIApplication.shared.windows.last?.rootViewController, let view = rvc.view {
    //                self.showLoading(on: view, viewId: rvc.description)
    //            }
    //        }
    //    }
    //
    //    private func hideProgressBar(vc: UIViewController? = nil) {
    //        DispatchQueue.main.async {
    //            if let viewId = vc?.description {
    //                self.hideLoading(on: viewId)
    //            } else if let viewId = UIApplication.shared.windows.last?.rootViewController?.description {
    //                self.hideLoading(on: viewId)
    //            }
    //            UIApplication.shared.endIgnoringInteractionEvents()
    //        }
    //    }
    
}

class Connectivity {
    class var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}

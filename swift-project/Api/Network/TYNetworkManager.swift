//
//  TYNetworkManager.swift
//  Test_delete
//
//  Created by 田耀琦 on 2019/11/6.
//  Copyright © 2019 田耀琦. All rights reserved.
//

import UIKit

import Alamofire

public typealias Success = (_ data: Data) ->();
public typealias Failure = (_ data: Error) ->();

public typealias RequestResult = (_ status: String, _ message: String, _ data: Codable?) ->()

class TYNetworkManager<T: Codable>: NSObject {
    
    // 单例
    static var shareInstance : TYNetworkManager {
        let instance : TYNetworkManager = TYNetworkManager();
        return instance;
    }
    
    // header
    private lazy var httpHeader : HTTPHeaders = {
        return ["token":"token"];
    }()
    
    // Get请求
    func getRequest(_ urlString : String, params: Parameters? = nil, header: HTTPHeaders? = nil, result: @escaping RequestResult) {
        request(urlString, params: params, method: .get, header: header, result: result)
    }
    
    // Post请求
    func postRequest(_ urlString : String, params: Parameters? = nil, header: HTTPHeaders? = nil, result: @escaping RequestResult) {
        request(urlString, params: params, method: .post, header: header, result: result)
    }
    
    // upload <根据需要修改>
    func uploadFileRequest() {
        let request = NSURLRequest.init(url: URL(string: "")!);
        Alamofire.upload(multipartFormData: { (formData) in

        }, to: request as! URLConvertible, method: .post) { (result) in
            
        }
    }
}

extension TYNetworkManager {
    //公共的私有方法
    private func request(
        _ urlString: String,
        params: Parameters? = nil,
        method: HTTPMethod,
        header: HTTPHeaders? = nil,
        result:@escaping RequestResult)
    {
    
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 10
        let headerDict: NSMutableDictionary = NSMutableDictionary(dictionary: httpHeader);
        if header != nil {
            headerDict.addEntries(from: header!);
        }
        
        #if DEBUG
        printRequestCtrlLog(params: params, header: (headerDict as! HTTPHeaders), url: urlString);
        #else
        #endif
        
        manager.request(urlString, method: method, parameters:params, headers: (headerDict as! HTTPHeaders)).responseJSON { response in
            guard response.result.value != nil else {
                response.result.ifSuccess {
                    print(">>>>>>>> success");
                }
                response.result.ifFailure {
                    print("<<<<<<<< failure");
                }
                result("fail",  "服务异常：\(response.result.description)", nil);
                return
            }
            switch (response.result) {
            case .success:
                do {
                    let model = try JSONDecoder().decode(BaseModel<T>.self, from: response.data!)
                    result(model.status!, model.message ?? "", model.data);
                } catch  {
                    print(error);
                    result("error", error.localizedDescription, nil);
                }
                break
            case .failure(let error):
                result("error", error.localizedDescription, nil);
                break
            }
        }
    }
}

// 基类 Model  T: 子模型（自动解析）
struct BaseModel<T: Codable>: Codable {
    var status: String?;
    var message: String?;
    var data: T;
}

// 日志
extension TYNetworkManager {
    private func printRequestCtrlLog(params: [String: Any]?, header: [String: String]?, url: String) {
        var log: String = "";
        log.append(" curl -i -X POST ");
        log.append("-H \"Accept-Encoding:compress;q=0.5, gzip;q=1.0\" ");
        
        if params != nil && params?.count != 0 {
            var pm: String = "";
            params?.forEach { (key, value) in
                pm.append("\(key)=\(value)&")
            }
            pm.append("xxx=xxx");
            log.append(" -d \"\(pm)\" ");
        }
        
        if (header != nil && header?.count != 0) {
            header?.forEach({ (key, value) in
                log.append("-H \"\(key):\(value)\" ")
            })
        }
        
        log.append(url);
        
        print("\n*********** 输出请求内容 ********")
        print("url:\(url)")
        print("params:\(params ?? [:])")
        print("header:\(header ?? [:])")
        
        print("*********** 输出执行日志 ********")
        print("可执行日志：\(log)\n");
    }
}





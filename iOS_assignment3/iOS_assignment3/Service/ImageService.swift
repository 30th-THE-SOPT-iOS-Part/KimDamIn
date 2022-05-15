//
//  ImageService.swift
//  iOS_assignment3
//
//  Created by 김담인 on 2022/05/14.
//

import Foundation
import Alamofire

class ImageService {
    // 싱글톤 변수(Singleton)
    //
    static let shared = ImageService()
    
    private init() {}
    
}
/*
extension ImageService {
    func getImage(id:String) {

        guard let url = URL(string: "\(APIConstants.picsumURL)/id/\(id)/info") else {return}
          
        var request = URLRequest.init(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) {
                data,response,error in

           guard let data = data else {return}

           do {
               //받은 json데이터 파싱
               let decoder = JSONDecoder()
               decoder.keyDecodingStrategy = .convertFromSnakeCase
               let result = try decoder.decode([ImageResponse].self, from: data)
               print("결과:\(result)")

           } catch(let error) {
               print("에러:\(error)")
           }
            
       }.resume()   //모든 task()는 일시정지 상태로 시작하기 때문에 resume()으로 task()를 시작
   }
}
*/
extension ImageService {

func getImage( completion: @escaping (NetworkResult<Any>) -> Void)
{
    // completion 클로저를 @escaping closure로 정의
    let url = APIConstants.picsumURL                                     // URL
    let header: HTTPHeaders = ["Content-Type" : "application/json"]     // HTTP Headers
    let QueryParams: Parameters = [
        "page": 1,
        "limit": 4
    ]
    
    // 요청서
    // Request 생성
    let dataRequest = AF.request(url,
                                method: .get,
                                parameters: QueryParams,
                                encoding: URLEncoding.default,
                                headers: header)
    
    // 서버 통신 시작 - Request 시작
    dataRequest.responseData { response in
        // 요청(Request)를 하고 넘겨받은 응답의 결과를 가지고 성공 또는 실패 분기 처리
        switch response.result {
        case .success:
            // 성공 시에는 상태코드(Status Code)와 값(Value)
            guard let statusCode = response.response?.statusCode else { return }
            guard let value = response.value else { return }
            
            // 해당 응답을 가지고 case 분기처리 (200, 400, 500인지 - 200: 성공을 해서 데이터를 잘 받았는지 확인
            let networkResult = self.judgeStatus(by: statusCode, value, [ImageData].self)
            completion(networkResult)
        
        // 실패 시에는 바로 networkFail(통신 실패)라는 신호
        case .failure:
            completion(.networkFail)
        }
    }
}
 /*
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        // 성공 시에는 넘겨받은 데이터를 decode(해독)하는 함수를 호출
        // statusCode가 200~400대 일때는 통신에 이상있는것이 아니라 둘다 isValidLoginData함수를 호출
        case 200..<300: return isVaildSignUpData(data: data)
        case 400..<500: return isVaildSignUpData(data: data)
        case 500..<600: return .serverErr
        default: return .networkFail
        }
    }

    private func isVaildSignUpData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(SignUpResponse.self, from: data)
        else { return .pathErr }
            
        return .success(decodedData as Any)
    }
    */
    
    // 상태 코드와 값(value, data, response)를 가지고 통신의 결과를 핸들링하는 함수입니다.
    private func judgeStatus<T: Codable>(by statusCode: Int, _ data: Data, _ response: T.Type) -> NetworkResult<Any> {
        
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(response.self, from: data)
        else {
            return .pathErr
        }
        
        switch statusCode {
        // 성공 시에는 넘겨받은 데이터를 decode(해독)하는 함수를 호출합니다.
        case 200: return .success(decodedData)
        case 201: return .success(decodedData)
        case 400..<500: return .requestErr(decodedData) //400대에서는 .requestErr로 빠짐
        case 500: return .serverErr
        default: return .networkFail
        }
    }
}

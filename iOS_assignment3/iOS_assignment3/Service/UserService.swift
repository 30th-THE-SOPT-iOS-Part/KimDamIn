//
//  UserService.swift
//  iOS_assignment3
//
//  Created by 김담인 on 2022/05/12.
//

import Foundation
import Alamofire

/*
 서비스 코드
 
 - Request
    ㄴ 요청서를 작성하기 위한 준비물을 준비하고
    ㄴ 그것들을 적절하게 사용해서 서버에게 요청을 하게 됩니다.
 - Response
 */

class UserService {
    // 싱글톤 변수(Singleton)
    //
    static let shared = UserService()
    
    private init() {}
    
}


//MARK: - Login
extension UserService {
    
    func login(name: String,
               email: String,
               password: String,
               completion: @escaping (NetworkResult<Any>) -> Void)
    {
        // completion 클로저를 @escaping closure로 정의
        let url = APIConstants.loginURL                                     // URL
        let header: HTTPHeaders = ["Content-Type" : "application/json"]     // HTTP Headers
        let body: Parameters = [                                            // HTTP body
            "name": name,
            "email": email,
            "password": password
        ]
        
        // 요청서
        // Request 생성
        let dataRequest = AF.request(url,
                                    method: .post,
                                    parameters: body,
                                    encoding: JSONEncoding.default,
                                    headers: header)
        
        // 서버 통신 시작 - Request 시작
        dataRequest.responseData { response in
            // 요청(Request)를 하고 넘겨받은 응답의 결과를 가지고 성공 또는 실패 분기 처리
            switch response.result {
            case .success:
                // 성공 시에는 상태코드(Status Code)와 값(Value)이 넘어오겠죠?
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                
                // 해당 응답을 가지고 case 분기처리 (200, 400, 500인지 - 200: 성공을 해서 데이터를 잘 받았는지 확인)
                let networkResult = self.judgeLoginStatus(by: statusCode, value)
                completion(networkResult)
            
            // 실패 시에는 바로 networkFail(통신 실패)라는 신호
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    // 상태 코드와 값(value, data)를 가지고 통신의 결과를 핸들링하는 함수
    private func judgeLoginStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        // 성공 시에는 넘겨받은 데이터를 decode(해독)하는 함수를 호출
        // statusCode가 200~400대 일때는 통신에 이상있는것이 아니라 둘다 isValidLoginData함수를 호출
        case 200..<300: return isVaildLoginData(data: data)
        case 400..<500: return isVaildLoginData(data: data)
        case 500..<600: return .serverErr
        default: return .networkFail
        }
    }
    
    // 성공 시 넘겨받은 데이터를 decode하는 함수
    // 이 때 우리가 codable을 채택해서 만들어 놓은 구조체 형식의 데이터 모델을 사용
    private func isVaildLoginData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(LoginResponse.self, from: data)
        else { return .pathErr }
        
        return .success(decodedData as Any)
    }
}


//MARK: - SignUp

extension UserService {
    
    func signUp(name: String,
               email: String,
               password: String,
               completion: @escaping (NetworkResult<Any>) -> Void)
    {
        // completion 클로저를 @escaping closure로 정의
        let url = APIConstants.signUpURL                                     // URL
        let header: HTTPHeaders = ["Content-Type" : "application/json"]     // HTTP Headers
        let body: Parameters = [                                            // HTTP body
            "name": name,
            "email": email,
            "password": password
        ]
        
        // 요청서
        // Request 생성
        let dataRequest = AF.request(url,
                                    method: .post,
                                    parameters: body,
                                    encoding: JSONEncoding.default,
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
                let networkResult = self.judgeSignUpStatus(by: statusCode, value)
                completion(networkResult)
            
            // 실패 시에는 바로 networkFail(통신 실패)라는 신호
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    private func judgeSignUpStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
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
}

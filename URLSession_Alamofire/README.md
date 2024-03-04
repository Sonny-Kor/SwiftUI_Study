# 노트

Network 모듈 제작 및 Alamofire 패키지 사용 리뷰 <br/>
Combine과 Asnyc/Await을 이용한 비동기 처리  <br/><br/>

## URLSession
**iOS 앱에서 서버와 통신하기 위해 Apple 이 제공하는 네트워킹 API** <br/><br/>
URLSession은 URLSessionConfiguration을 이용하여 생성을 하게 된다. <br/>
URLSession 여러개의 URLSessionTask를 만들수 있다. 이 URLSessionTask로 실제 통신을 하게 된다. <br/>
URLSession Delegate을 통해서 네트워크 중간과정을 확인할 수 있다.

### URLSessionConfiguration Type

* Default : 기본 통신
* Ephemeral : 쿠키나 캐시를 저장하지 않게 할 때 ( private모드랑 비슷 )
* Background : 앱이 백그라운드에 있을 때, 컨텐츠 다운로드 등등 할 때

### URLSessionTask

* URLSessionDataTask : 간단한 데이터를 받아올때 ( 백그라운드에서 진행은 안됨)
* URLSessionUploadTask : 파일을 업로드할 때 씀.
* URLSessionDownloadTask : 다운도르 할 때 씀.


## Alamofire
**Alamore은 Swift 기반의 HTTP 네트워킹 라이브러리** <br/><br/>
* 편리한 기능들 자동 JSON 디코딩, 인증, 멀티파트 업로드 등을 쉽게 사용 가능 
* Alamofire를 사용한다면 데이터를 접근하기 위한 노력을 줄일 수 있으며 코드를 더 깔끔하고 가독성 있게 쓰는 것이 가능해짐 

## Combine (ios 13 ⇡)
**Combine은 Swift에서 리액티브 프로그래밍을 위한 프레임워크** <br/><br/>
* 데이터의 생산자와 소비자 간의 데이터 흐름을 자동으로 관리할 수 있습니다.
* 구독을 통한 취소가 가능
  
## Asnyc/Await (ios 15 ⇡)

* 코드의 간결성: 비동기 코드를 마치 동기 코드처럼 직관적으로 작성가능
* Context Switch 최소화

### 해야할일

<br/>

## Resource
~~~
struct Resource<T: Decodable> {
    var base: String
    var path: String
    var params: [String: String]
    var header: [String: String]
    
    var urlRequest: URLRequest? {
        var urlComponents = URLComponents(string: base + path)!
        let queryItems = params.map { (key: String, value : String) in
                URLQueryItem(name: key, value: value)
        }
        urlComponents.queryItems = queryItems
        
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = "GET"
        print(request.url!)
        header.forEach { (key: String , value : String) in
            request.addValue(value, forHTTPHeaderField: key)
        }
        return request
    }
}
~~~
URLComponuents를 이용하여 직접 넣어주기 <br/>
URL 생성을 위한 모듈, Method도 추가할 수 있도록 변경해야할 듯 <br/>

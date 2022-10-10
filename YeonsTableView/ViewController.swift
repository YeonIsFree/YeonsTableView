
import UIKit

/*
 
 [tableView란?]:
 - 여러 row가 모여있는 목록 화면(뷰)
 - 데이터를 깔끔하게 보여줄 수 있다.
 - 작은 박스 형태로 쓰고 싶으면 TableView 추가, 한 화면 가득 채우는 박스 쓰고 싶으면 TableViewController
 
 [tableView를 만들기 위해서는?]
 1. 데이터가 무엇인가.
 2. 데이터가 몇 개인가.
 3. (옵션) 데이터 행을 클릭했을 때 어떤 액션이 일어나는가.
 
 [과정]
 - UITableViewDataSource, UITableViewDelegate 프로토콜 사용
 - http 통신방법 - urlsession
 - JSON 데이터 형태 --> Dictionary로 처리한다.
 - 테이블 뷰의 데이터 매칭

 [Cell을 만드는 법]
  1. 임의의 Cell 생성
     UITableViewCell.init(style: reuseIdentifier:)
  2. 스토리보드 + Id <--- 실무에서는 이 방법을 사용
 
*/
// APIKey: 1f1a3c2dcbd34bd9ba1848ba69e1a8f7
//

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    @IBOutlet weak var tableViewMain: UITableView!
    
    var newsTitle: Array<String>
    
    func getNews(){
        let task = URLSession.shared.dataTask(with: URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2022-09-10&sortBy=publishedAt&apiKey=1f1a3c2dcbd34bd9ba1848ba69e1a8f7")!) { data, response, error in
            
            if let dataJson = data {
                // json parsing
                do {
                    let json = try JSONSerialization.jsonObject(with: dataJson, options: []) as! Dictionary<String, Any>
                    let articles = json["articles"] as! Array<Any>
                    // 배열을 돌려서 article 찾기 (암기)
                    for (idx, value) in articles.enumerated(){
                        if let v = value as? Dictionary<String, Any> {
                            print("\(String(describing: v["title"]))")
                        }
                    }
                }
                catch {}
                
            }
        
        }
        task.resume()
    }
    
    
    // [데이터 몇 개인가]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    // [무슨 데이터인가]
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       
        // 재사용 가능한 셀을 만든다.
        // 타입 캐스팅(친자 확인): cell은 UITableViewCell를 반환하게 된다.
        let cell = tableViewMain.dequeueReusableCell(withIdentifier: "Type1", for: indexPath) as! Type1
    
        cell.labelText.text = "\(indexPath.row)"

        return cell
    }
    // 클릭 감지
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexPath.row
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // [연결]
        tableViewMain.delegate = self
        tableViewMain.dataSource = self
        
        getNews()
    }

}


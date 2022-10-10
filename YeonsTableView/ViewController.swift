
import UIKit

/*
 
 [tableView란? 여러 row가 모여있는 목록 화면(뷰)]:
 - 데이터를 깔끔하게 보여줄 수 있다.
 - 작은 박스 형태로 쓰고 싶으면 TableView 추가, 한 화면 가득 채우는 박스 쓰고 싶으면 TableViewController
 
 [tableView를 만들기 위해서는?]
 1. 데이터가 무엇인가.
 2. 데이터가 몇 개인가.
 3. (옵션) 데이터 행을 클릭했을 때 어떤 액션이 일어나는가.
 
 [과정]
 - UITableViewDataSource, UITableViewDelegate 프로토콜 사용
 
    
*/


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    @IBOutlet weak var tableViewMain: UITableView!
    
    
    
    
    
    // [데이터 몇 개인가]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    // [무슨 데이터인가]
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        /*
         [Cell을 만드는 법]
         1. 임의의 Cell 생성
            UITableViewCell.init(style: reuseIdentifier:)
         
         */
        
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: "TableCelltype1")
        
        cell.textLabel?.text = "\(indexPath.row) 테스트 중"
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // [연결]
        tableViewMain.delegate = self
        tableViewMain.dataSource = self
    }

}


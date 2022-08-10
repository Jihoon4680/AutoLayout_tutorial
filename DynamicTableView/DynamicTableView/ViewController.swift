//
//  ViewController.swift
//  DynamicTableView
//
//  Created by 안지훈 on 8/9/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    
    let contentArray = [
        " Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        "t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to us",
        "'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
        " i can understand this layout",
        "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source",
        "Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance.",
        "The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32."
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //셀 리소스 파일 가져오기
        //        let myCell = UINib(nibName: String(describing: "DynamicTableViewCell"), bundle: nil)
        // 둘다 동일
        let myCell = UINib(nibName: String(describing: DynamicTableViewCell.self), bundle: nil)
        
        // tableView에 셀 등록
        myTableView.register(myCell, forCellReuseIdentifier: "DynamicTableViewCell")
        // tableView높이 설정 ( 자동으로 설정 )
        myTableView.rowHeight = UITableView.automaticDimension
        // 예상 높이 설정
        myTableView.estimatedRowHeight = 120
        
        // *** Delegate 와 DataSource등록
        myTableView.delegate = self
        myTableView.dataSource = self
        
    }
}
// tablewView Delegate
extension ViewController : UITableViewDelegate {
    
}
// tableView DataSource
extension ViewController : UITableViewDataSource {
    
    // 섹션 내의 셀의 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentArray.count
    }
    // 셀의 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // tableView cell 설정 // Identifier 와 해당 indexPath를 설정한다 // 타입을 DynamicTableViewCell로 설정
        let cell = myTableView.dequeueReusableCell(withIdentifier: String(describing: DynamicTableViewCell.self), for: indexPath) as! DynamicTableViewCell
        // 타입을 바꿔줘야 DyanamicTableViewCell.swift 의 content에 접근가능
        cell.content.text = contentArray[indexPath.row]
        return cell
    }
    
}


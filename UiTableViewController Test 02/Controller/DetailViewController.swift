//
//  DetailViewController.swift
//  UiTableViewController Test 02
//
//  Created by D7703_04 on 2018. 5. 28..
//  Copyright © 2018년 lse. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MKMapViewDelegate {

    @IBOutlet weak var detailTableView: UITableView!
    @IBOutlet weak var cellImageView: UIImageView!
    
    var cellImage: String = ""
    var name: String = ""
    var local1: String = ""
    var tel1: String = ""
    var menu: String = ""
    var type: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // delegate connection
        detailTableView.delegate = self
        detailTableView.dataSource = self
        
        cellImageView.image = UIImage(named: cellImage)
        self.title = name
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
            cell.textLabel?.text = "주소 : " + local1
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
            cell.textLabel?.text = "전화번호 : " + tel1
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
            cell.textLabel?.text = "메뉴 : " + menu
            return cell
        default :
            let cell = tableView.dequeueReusableCell(withIdentifier: "mapCell", for: indexPath) as! MapTableViewCell
            cell.configure(location: local1)
            return cell
        }
    }
    //테이블뷰에 액션을 주기위해 쓰인 함수
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow//테이블뷰 선택된 열을 순차적으로 indexPath변수에 넣어준다
        
        let currentCell = tableView.cellForRow(at: indexPath!)! as UITableViewCell
        
        let currentItem = currentCell.textLabel!.text//현재 셀의 라베을 받아온다
        
        let alertController = UIAlertController(title: "", message: "" + currentItem!, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default){(myAction: UIAlertAction) -> Void in
        
        }
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }


    //
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailMapView" {
            if detailTableView.indexPathForSelectedRow != nil {
                let destinationController = segue.destination as! MapViewController
                destinationController.location = local1
                destinationController.name = name
                destinationController.tel = tel1
            }
        }
        
    }

}


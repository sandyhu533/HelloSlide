
import UIKit

protocol CellConsistentDelegate {
    func addCell(index: Int)
    func deleteCell(index: Int)
}

extension OutlineViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //为每一个cell获取textView并赋入
        let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! TextCell
        
        cell.textView.attributedText = models[indexPath.row]
        
        //取消cell被选中的默认效果
//        cell.selectionStyle = .none
        
        //如果cell被选中
        if indexPath.row == selectedCellIndex{
            cell.isPicked = true
        }else{
            cell.isPicked = false
        }
        
        cell.textView.delegate = self
        cell.delegate = self
        
        return cell
    }
    
}

extension OutlineViewController: TextCellDelegate {
    
    func getSelfIndex(cell: TextCell) -> Int {
        return tableView.indexPath(for: cell)!.row
    }
    
    func didSecetedSelf(cell: TextCell) {
        selectedCellIndex = tableView.indexPath(for: cell)?.row
        tableView.reloadData()
    }
    
    func didDeleteCell() {
        //在tableView中删除此行
        print("didDeleteCell")
        tableView.beginUpdates()
        let indexPath:IndexPath = IndexPath(row:(selectedCellIndex!), section:0)
        models.remove(at: selectedCellIndex!)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
        selectedCellIndex! -= 1
        self.cellConsistentDelegate?.deleteCell(index: selectedCellIndex! + 1)
        tableView.reloadData()
    }
    
    func didAddCell() {
        //在tableView中插入新行
        print("didAddCell")
        tableView.beginUpdates()
        let indexPath:IndexPath = IndexPath(row:(selectedCellIndex! + 1), section:0)
        models.insert(NSAttributedString(), at: selectedCellIndex! + 1)
        tableView.insertRows(at: [indexPath], with: .left)
        tableView.endUpdates()
        selectedCellIndex! += 1
        self.cellConsistentDelegate?.addCell(index: selectedCellIndex! - 1)
        tableView.reloadData()

    }

}

extension OutlineViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        
        //刷新高度
        updateCellHeight()
        
        //当内容有变化时，将所有可见范围内的cell的model更新
        for index in 0..<models.count {
            let cell = tableView.cellForRow(at: IndexPath(row: index, section: 0))
            if cell != nil {
                let visibleCell = cell as! TextCell
                models[index] = visibleCell.textView.attributedText
            }
        }
        
        //多screen同步
        renewAll()
    
    }
    
    func updateCellHeight(){
        
        // 刷新高度，解决跳动问题
        let currentOffset = tableView.contentOffset
        UIView.setAnimationsEnabled(false)
        tableView.beginUpdates()
        tableView.endUpdates()
        UIView.setAnimationsEnabled(false)
        tableView.setContentOffset(currentOffset, animated: false)
        
    }
}

extension OutlineViewController: CellConsistentDelegate {
    
    func addCell(index: Int) {
        //在tableView中插入新行
        print("didAddCell")
        tableView.beginUpdates()
        let indexPath:IndexPath = IndexPath(row:(index + 1), section:0)
        models.insert(NSAttributedString(), at: index + 1)
        tableView.insertRows(at: [indexPath], with: .left)
        tableView.endUpdates()
        tableView.reloadData()
        
        //同步slideView
        WordModelManager.shared.slideViewController?.presentationModel?.pages.insert(Page(), at: index + 1)
    }
    
    func deleteCell(index: Int) {
        //在tableView中删除此行
        print("didDeleteCell")
        tableView.beginUpdates()
        let indexPath:IndexPath = IndexPath(row:(index), section:0)
        models.remove(at: index)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
        tableView.reloadData()
        
        //同步slideView
        WordModelManager.shared.slideViewController?.presentationModel?.pages.remove(at: index)
        WordModelManager.shared.slideViewController?.refreshPageCollectionView()
    }
    
}

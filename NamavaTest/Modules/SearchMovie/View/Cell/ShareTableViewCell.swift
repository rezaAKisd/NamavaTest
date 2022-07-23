//
//  EmptyTableViewCell.swift
//  NamavaTest
//
//  Created by reza akbari on 7/23/22.
//

import UIKit
import RxCocoa
import RxSwift

enum ShareTableCellType{
    case loading
    case placeholder
}

class ShareTableViewCell: UITableViewCell {

    @IBOutlet weak var shareImageView: UIImageView!
    @IBOutlet weak var shareLabel: UILabel!
    
    let disposeBag = DisposeBag()
    let cellType: BehaviorRelay<ShareTableCellType> = .init(value: .placeholder)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bindView()
    }
    
    private func bindView(){
        cellType.subscribe(onNext: { [weak self] type in
            switch type{
            case .loading:
                self?.shareLabel.text = "Loading ..."
            case .placeholder:
                self?.shareLabel.text = "لطفا برای نمایش ویدیو عنوانی را جستوجو کنید"
            }
        }).disposed(by: disposeBag)
    }
}

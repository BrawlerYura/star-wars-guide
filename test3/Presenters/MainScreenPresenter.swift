



import Foundation


class MainScreenPresenter {

    weak private var mainScreenInputDelegate: MainScreenInputDelegate?
    var icons = ContentIcons.icons
    
    func setMainScreenIputDelegate(mainScreenInputDlegate: MainScreenInputDelegate) {
        self.mainScreenInputDelegate = mainScreenInputDlegate
    }
    
    private func loadIcons() {
        self.mainScreenInputDelegate?.setupContent(with: self.icons)
    }
    
    
}

extension MainScreenPresenter: MainScreenOutputDelegate {
    func getIcons() {
        self.loadIcons()
    }
}

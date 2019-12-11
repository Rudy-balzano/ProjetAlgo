fileprivate struct Piece {

    var x : Int { 
        get {return self.x}
        set {self.x = newValue}
        }

    var y : Int {
        get {return self.y}
        set {self.y = newValue}
    }

    var isMaster : Bool

    var player : Player 
    
    init(x: Int, y: Int , isMaster : Bool, player : Player){
        self.x = x
        self.y = y
        self.isMaster = isMaster
        self.Player = Player
    }

    var position : (Int,Int) {
        return (self.x,self.y)
    }

    func comparePosition (piece2 : Piece) -> Bool{
        return (self.x == piece2.x && self.y == piece2.y)
    }


    func attack (p : [Piece]) ->Bool {
        var attack = false
        var i = 0 
        while attack == false {
            if self.comparePosition(piece2 : p[i]){
                attack = true
            }
            else {
                i += 1
            }
        }
    }

    func capture (pions : [Piece]) -> [Piece]{
        var capture = false
        var i = 0
        var pion : [Piece] = pions
        while !capture {
            if self.comparePosition(piece2 : pions[i]){
                pion.remove(at:i)
                capture = true
            }
            else {
                i += 1
            }
        }
        return pion
    }

}
fileprivate struct Cards {

	var name : String
	var color : String
	var moves : [(Int,Int)]

    init(name : String, color : String, moves : [(Int, Int)]) {
    	self.name = name
    	self.color = color
    	self.moves = moves
    }

}
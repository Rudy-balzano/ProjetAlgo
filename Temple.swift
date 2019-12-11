fileprivate struct Temple {
	
	var x : Int
	var y : Int 
	var color : String

	init (color : String){
		
		self.color = color
		self.y = 2

		if (color == "Rouge"){
			self.x = 0
		}
		else {
			self.x = 4
		}

	}

	/*func isOpponentKingOnTemple (player : Player) -> {
		let cp = Player.color
		let ct = self.color
	}*/	
}
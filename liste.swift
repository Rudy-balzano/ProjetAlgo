
// fileprivate typealias TNoeud = TListeNV! //Permet d'eviter de verifier que TNoeud n'est pas vide a chaque prec ou suiv

fileprivate class TListeNV {
	var elt : Int
	var prec : TListeNV!
	var suiv : TListeNV!
	init (elt : Int, prec : TListeNV!, suiv : TListeNV!) {
		self.elt = elt
		self.prec = prec
		self.suiv = suiv
	}
	init(){
		self.elt = 0			
		self.prec = nil
		self.suiv = nil
	}
}

public struct TListeEntiers : Sequence{

	fileprivate var head : TListeNV

	fileprivate var prec : TListeNV {
		get { return self.head.prec }
		set { self.head.prec = newValue }
	}

	fileprivate var suiv : TListeNV{
		get { return self.head.suiv }
		set { self.head.suiv = newValue }
	}

	public init (){
		self.head = TListeNV()
		self.prec = head
		self.suiv = head
	}


	var  estVide : Bool {
		return self.prec === self.head
	}

	public mutating func ajoutDebut (x : Int) {
		self.head.elt += 1
		self.suiv = TListeNV(elt : x, prec : self.head, suiv : self.suiv)
		self.suiv.suiv.prec = self.suiv
	}

	func ajoutFin (x : Int) {
		self.head.elt += 1
		self.prec.prec.suiv = self.prec

	}

	public mutating func supprimerDebut () {
		self.head.elt -= 1
		self.suiv.suiv.prec = self.head
		self.suiv = self.suiv.suiv
		}

	fileprivate func nbOccurencesP(x : Int, liste : TListeNV, tete : TListeNV) -> Int{
		if liste === tete {
			return 0
		}
		else if liste.elt == x {
			return nbOccurencesP(x : x, liste : liste.suiv, tete : tete) + 1
		}
		else {
			return nbOccurencesP(x : x, liste : liste.suiv, tete : tete) 
		}
	}

	public func nbOccurences (x : Int) -> Int {
		if self.estVide{
			return 0
		}
		else {
			return nbOccurencesP(x : x, liste : self.suiv, tete : self.head)
		}
	}

	public func makeIterator () -> ItListe{
		return  ItListe(l : self, courant : self.suiv)
	}

	public mutating func changerVal (it : ItListe, x : Int ) {
		if !(self.estVide) && !(it.finParcours) {
			it.courant.elt = x
		}
		else {
			fatalError()
		}
	}

	public mutating func insererApres (it : ItListe, x : Int) {
		var nvListe = TListeNV(x : elt, it.courant : prec, it.courant.suiv : suiv)
		self.
	}

}

public struct ItListe : IteratorProtocol{
	fileprivate var l : TListeEntiers
	fileprivate var courant : TListeNV

	fileprivate init (l : TListeEntiers, courant : TListeNV){
		self.l = l
		self.courant = courant
	}

	public var finParcours : Bool {
		return self.courant === self.l.head 
	}

	public mutating func reinit() -> Bool {
		if self.l.estVide {
			return false
		}
		else {
			self.courant = self.l.suiv
			return true
		}
	}

	public mutating func next() -> Int? {
		guard !self.finParcours else { return nil }
		let val = self.courant.elt
		self.courant = self.courant.suiv
		return val
	}

	public mutating func prec() -> Int? {
		guard !self.finParcours else { return nil }
		let val = self.courant.elt
		self.courant = self.courant.prec
		return val
	}


	public func estDernier() -> Bool{
		if self.finParcours{
			return false
		}
		else {
			return self.courant.suiv === self.l.head
		}
	}

	public func estPremier () -> Bool {
		if self.finParcours {
			return false
		}
		else {
			return self.courant.prec === self.l.head
		}
	}

	public func valeur () -> Int? {
		if self.finParcours {
			return nil
		} 
		else {
			return self.courant.elt
		}
	}





}
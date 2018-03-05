class Node{
	int nodeX;
	int nodeY;
	int uid;
	color nodeColor; 
	int degree;
 	ArrayList<Node> neighbors = new ArrayList<Node>();
	Node(int nodeXTemp, int nodeYTemp, int uidTemp, color nodeColorTemp){
		nodeX = nodeXTemp;
		nodeY = nodeYTemp;
		nodeColor = nodeColorTemp;
		uid = uidTemp;
		degree = 0;
		//neighbors = new ArrayList<Node>();
	}
	Node(int nodeXTemp, int nodeYTemp, int uidTemp){
		nodeX = nodeXTemp;
		nodeY = nodeYTemp;
		nodeColor = color(0, 0, 0);
		uid = uidTemp;
		degree = 0;
	}
	void display(){
		fill(nodeColor);
		ellipse(nodeX, nodeY, 20, 20);
 	}
}

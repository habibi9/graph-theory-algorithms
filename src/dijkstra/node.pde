class Node{
	int nodeX;
	int nodeY;
	int uid;
	color nodeColor; 
	int degree;
	int distance;
 	ArrayList<Node> neighbors = new ArrayList<Node>();
 	Node parent;
	Node(int nodeXTemp, int nodeYTemp, int uidTemp, color nodeColorTemp){
		nodeX = nodeXTemp;
		nodeY = nodeYTemp;
		nodeColor = nodeColorTemp;
		uid = uidTemp;
		degree = 0;
		distance = 1000000000;
		//neighbors = new ArrayList<Node>();
	}
	Node(int nodeXTemp, int nodeYTemp, int uidTemp){
		nodeX = nodeXTemp;
		nodeY = nodeYTemp;
		nodeColor = color(0, 0, 0);
		uid = uidTemp;
		degree = 0;
		distance = 1000000000;
	}
	void display(){
		fill(nodeColor);
		ellipse(nodeX, nodeY, 20, 20);
 	}
}

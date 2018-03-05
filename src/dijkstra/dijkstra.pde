import java.util.Comparator;
import java.util.Collections;
Graph graph;
Graph solution;
int nodeCount = 13;
int edgeCount = 18;

// int fatherCode[][] = {{0, 0, 0, 1, 2, 3, 4},
// 					  {1, 3, 4, 2, 3, 5, 5}};
int fatherCode[][] = {{0, 0, 0, 1, 1, 2, 2, 4, 8, 8, 7, 3, 12, 12, 9, 9, 10, 11}, 
					  {1, 2, 3, 2, 4, 4, 8, 6, 6, 7, 5, 12, 9, 10, 10, 11, 11, 5}};

Node start;
Node end;
void setup(){
	size(2736, 1824);
	fill(255);
	rect(10, 10, width-400, height-20);

	graph = new Graph(nodeCount, edgeCount);
	graph.father_code = fatherCode;
	graph.draw_from_father_code();
	graph.draw_nodes();
	graph.draw_edges();

	solution = new Graph(nodeCount, edgeCount);
	solution.nodes.clear();
	solution.edges.clear();

	start = graph.nodes.get(0);
	end = graph.nodes.get(5);

	start.distance = 0;
	Node current = start;

	while(graph.nodes.size() != 0){
		Collections.sort(graph.nodes, new Comparator<Node>(){
			@Override
			public int compare(Node node1, Node node2){
				return node1.distance - node2.distance;
			}
		});
		current = graph.nodes.get(0);
		for(Node node: current.neighbors){
			if(graph.nodes.contains(node)){
				if(node.distance > (node_dist(current, node)) + current.distance){
					node.distance = node_dist(current, node) + current.distance;
					node.parent = current;
				}
				
			}
		}
		solution.nodes.add(current);
		graph.nodes.remove(0);
	}
	//println(solution.nodes.size());
	for(Node node: solution.nodes){
		println(node.uid + " " + node.distance + " " + (node.parent == null ? "null" : node.parent.uid));
	}

	/*int i = solution.nodes.indexOf(end);
	do{
		solution.nodes.get(i).nodeColor = color(0, 255, 0);
		solution.edges.add(solution.nodes.get(i), solution.nodes.get(i).parent, color(0, 0, 255));
	}
	while(i != solution.nodes.indexOf(start));*/
	Node i = end;
	while(i.parent != null){
		i.nodeColor = color(0, 255, 0);
		solution.edges.add(new Edge(i, i.parent, color(0, 0, 255)));
		i = i.parent;
	}
	//while(i.parent != null);
	start.nodeColor = color(0, 255, 0);
	strokeWeight(5);
	solution.draw_edges();
	noStroke();
	start.nodeColor = color(0, 255, 0);
	solution.draw_nodes();
}

void draw(){

}

int node_dist(Node a, Node b){
	for(Edge edge: graph.edges){
		if((edge.nodes[0] == a && edge.nodes[1] == b) || (edge.nodes[0] == b && edge.nodes[1] ==a)){
			return edge.weight;
		}
	}
	return -1;
}
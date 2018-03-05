class Graph{
  ArrayList<Node> nodes;
  ArrayList<Edge> edges;
  int node_count;
  int edge_count;
  int father_code[][];

  Graph(int node_countTemp, int edge_countTemp){
    node_count = node_countTemp;
    edge_count = edge_countTemp;
    nodes = new ArrayList<Node>();
    edges = new ArrayList<Edge>();
    father_code = new int[2][edge_count];
    for(int a = 0; a < node_count; a++){
      int nodeX = int(random(10, width - 400));
      int nodeY = int(random(10, height - 10));
      nodes.add(new Node(nodeX, nodeY, a));
    }
    for(int a = 0; a < 2; a++){
      for(int b = 0; b < edge_count; b++){
        father_code[a][b] = 0;
      }
    }
  }

  void draw_from_father_code(){
    for(int a = 0; a < edge_count; a++){
      int start = father_code[0][a];
      int end = father_code[1][a];
      edges.add(new Edge(nodes.get(start), nodes.get(end), 0));
    }
    //for(int a = 0; a < node_count; a++){
    initialize_nodes();
    //}

    //draw_edges();
  }

  void draw_nodes(){
    for(Node node: nodes){
      fill(0);
      text(str(node.uid), float(node.nodeX+20), float(node.nodeY), 20.0, 20.0);
      node.display();
    }
  }

  void draw_edges(){
    String s = "";
    for(Edge edge: edges){
      edge.display();
      s += (edge.nodes[0].uid + " " + edge.nodes[1].uid + " " + edge.weight + "\n");
    }
    text(s, width-300, 100, 60, 500);
  }

  void initialize_nodes(){
    int counter = 0;
    for(Edge edge: edges){
      edge.nodes[0].degree++;
      edge.nodes[1].degree++;
      edge.nodes[0].neighbors.add(edge.nodes[1]);
      edge.nodes[1].neighbors.add(edge.nodes[0]);
    }
  }
  int get_degree_from_father_code(int a){
    int degree = 0;
    for(int b = 0; b < 2; b++){
      for(int c = 0; c < edge_count; c++){
        if(father_code[b][c] ==a) degree++;
      }
    }
    return degree;
  }
}



class Tree extends Graph{
  int prufer_code[];

  Tree(int node_countTemp, int edge_countTemp){
    super(node_countTemp, edge_countTemp);
    prufer_code = new int[edge_count-1];
  }

  void draw_from_father_code(){
    super.draw_from_father_code();
  }

  void draw_nodes(){
    super.draw_nodes();
  }

  void draw_edges(){
    String s = "";
    for(Edge edge: edges){
      edge.display();
      s += (edge.nodes[0].uid + " " + edge.nodes[1].uid + " " + edge.weight + "\n");
    }
    text(s, width-240, 100, 60, 500);
  }

  void initialize_nodes(){
    super.initialize_nodes();
  }

  int get_degree_from_father_code(int a){
    return super.get_degree_from_father_code(a);
  }

  void construct_from_prufer_code(){
    for(int a = 0; a < edge_count-1; a++){
      father_code[1][a] = prufer_code[a];
    }
    for(int a = 0; a < edge_count; a++){
      int val = 1;
      while (doesnt_appear(val, father_code[1], a, edge_count) == false || doesnt_appear(val, father_code[0], 0, a) == false){
        val++;
      }
      father_code[0][a] = val;
    }
  }
}


/*class Bipartite extends Tree{
  int spacing;
  int startX;
  int startY;
  int column_distance;

  Bipartite(int node_countTemp, int edge_countTemp){
    super(node_countTemp, edge_countTemp);
    spacing = 20;
    startX = 100;
    startY = 100;
    column_distance = 200;

    for(int a = 0; a < node_count/2; a++){
      int nodeY = startY + a * spacing;
      //int degree = get_degree_from_father_code(a);
      nodes[a] = new Node(startX, nodeY, 0);
    }
    for(int a = node_count/2; a < node_count; a++){
      int nodeY = startY + (a - node_count/2) * spacing;
      //int degree = get_degree_from_father_code(a);
      nodes[a] = new Node(startX + column_distance, nodeY, 0);
    }
    for(int a = 0; a < 2; a++){
      for(int b = 0; b < edge_count; b++){
        father_code[a][b] = 0;
      }
    }
  }

   Bipartite(int node_countTemp, int edge_countTemp, int startXTemp, int startYTemp, int spacingTemp, int column_distanceTemp){
    super(node_countTemp, edge_countTemp);
    spacing = spacingTemp;
    startX = startXTemp;
    startY = startYTemp;
    column_distance = column_distanceTemp;
    for(int a = 0; a < node_count/2; a++){
      int nodeY = startY + a * spacing;
      nodes[a] = new Node(startX, nodeY, 0);
    }
    for(int a = node_count/2; a < node_count; a++){
      int nodeY = startY + (a - node_count/2) * spacing;
      nodes[a] = new Node(startX + column_distance, nodeY, 0);
    }
    for(int a = 0; a < 2; a++){
      for(int b = 0; b < edge_count; b++){
        father_code[a][b] = 0;
      }
    }
  }

  void draw_from_father_code(){
    super.draw_from_father_code();
  }

  void draw_nodes(){
    super.draw_nodes();
  }

  void draw_edges(){
    super.draw_edges();
  }

  void construct_from_prufer_code(){
    super.construct_from_prufer_code();
  }

  void initialize_nodes(int a){
    super.initialize_nodes(a);
  }

  int get_degree_from_father_code(int a){
    return super.get_degree_from_father_code(a);
  }
}*/


boolean doesnt_appear(int val, int array[], int start_pos, int length){
  boolean result = true;
  for(int a = start_pos; a < length; a++){
    if(val == array[a]) result = false;
  }
  return result;
}

int neighbor_row(int a){
  if(a == 1) a = 0;
  else a = 1;
  return a;
}
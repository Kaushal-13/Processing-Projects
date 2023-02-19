class Sorter implements Comparator<Node>{
  public int compare(Node A,Node B){
    float a = A.fitness();
    float b = B.fitness();
    if(a == b){
     return 0; 
    }else if(a  > b){
     return 1; 
    }
    return -1;
  }
}

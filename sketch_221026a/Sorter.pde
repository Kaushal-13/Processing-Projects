class Sorter implements Comparator<Cell>{
  public int compare(Cell A,Cell B){
   int score1 = (n - A.i - 1) + (n - A.j - 1);
   int score2 = (n - B.i - 1) + (n - A.j - 1);
   if(score1 < score2){
    return -1; 
   }
   if(score1 > score2){
     return 1;
   }
   return 0;
  }
}

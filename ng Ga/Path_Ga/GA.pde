class GA{
  String generateRandom(){
    String ans = "";
    for(int i = 0;i<path_length;i++){
      char c = '1';
        float d = random(4);
        if(d < 1){
          c = '1';
        }else if(d < 2){
         c = '2'; 
        }else if(d < 3){
         c = '3'; 
        }else{
         c = '4'; 
        }
      ans = ans + "" + c;
    }
    return ans;
  }
  String crossOver(String s1,String s2){
   int a = int(random(s1.length()));
   String ans = "";
   for(int i = 0;i<s1.length();i++){
     if(i < a){
      ans = ans +"" + s1.charAt(i);
     }else{
       ans = ans +"" + s2.charAt(i);
     }
   }
   return ans;
  }
  
  String upd(String s){
   float d = random(4);
   char c = '1';
    String ans = s;
    if(d < 1){
      c = '1';
    }else if(d < 2){
     c = '2'; 
    }else if(d < 3){
     c = '3'; 
    }else{
     c = '4'; 
    }
      ans = ans + "" + c;
    return ans;
  }
  
  String mutate(String s1){
    String ans= "";
    float a = random(1);
    if(a > mp){
      return s1;
    }
    int b = int(random(s1.length()));
    for(int i = 0;i<s1.length();i++){
      char c = s1.charAt(i);
      if(i == b){
        float d = random(4);
        if(d < 1){
          c = '1';
        }else if(d < 2){
         c = '2'; 
        }else if(d < 3){
         c = '3'; 
        }else{
         c = '4'; 
        }
      }
      ans = ans + "" + c;
    }
    return ans;
  }
  
}

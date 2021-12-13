package goo.page;

public class PageModule2 {

   public static String makePage(
         String pageName, int totalCnt, 
         int listSize, int pageSize, int cp) {
      
      int totalPage=totalCnt/listSize+1;
      if(totalCnt%listSize==0)totalPage--;
      int userGroup=cp/pageSize;
      if(cp%pageSize==0)userGroup--;
      
      StringBuffer sb=new StringBuffer();
      if(userGroup!=0) {
         sb.append("<li class=\"page-item\">");
         sb.append("<a href='");
         sb.append(pageName);
         sb.append("?cp=");
         int temp=(userGroup-1)*pageSize+pageSize;
         sb.append(temp);
         sb.append("' class=\"page-link\">Prev</a></li>");
         sb.append("&nbsp;");
      }
      for(int i=userGroup*pageSize+1;i<=userGroup*pageSize+pageSize;i++){
         if(cp==i) {
            sb.append("<li class=\"page-item active\">");
            sb.append("<a href='");
            sb.append(pageName);
            sb.append("?cp=");
            sb.append(i);
            sb.append("' class=\"page-link\">");
            sb.append(i);
            sb.append("</a></li>");
            sb.append("&nbsp;");
         }else {
            sb.append("<li class=\"page-item\">");
            sb.append("<a href='");
            sb.append(pageName);
            sb.append("?cp=");
            sb.append(i);
            sb.append("' class=\"page-link\">");
            sb.append(i);
            sb.append("</a></li>");
            sb.append("&nbsp;");
         }
         if(i==totalPage){
            break;
         }
      }
      if(userGroup!=(totalPage/pageSize)-(totalPage%pageSize==0?1:0)){
         sb.append("<li class=\"page-item\">");
         sb.append("<a href='");
         sb.append(pageName);
         sb.append("?cp=");
         int temp=(userGroup+1)*pageSize+1;
         sb.append(temp);
         sb.append("' class=\"page-link\">Next</a></li>");
      }
      return sb.toString();
   }

   
}
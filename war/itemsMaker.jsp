<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.google.appengine.api.datastore.Entity" %>


<%Entity i = (Entity)request.getAttribute("item");

String proizvoditel = "";
if (null!=i){
proizvoditel = (String) i.getProperty("proizvoditel");
}
if (null==proizvoditel)proizvoditel="";
%>
<option <%if(proizvoditel.equals("Bcs group Ferrari")){ %>selected="selected"<%} %> >Bcs group Ferrari</option>
<option <%if(proizvoditel.equals("Аббриата")){ %>selected="selected"<%} %> >Аббриата</option>
<option <%if(proizvoditel.equals("Агробар")){ %>selected="selected"<%} %> >Агробар</option>
<option <%if(proizvoditel.equals("Агровин")){ %>selected="selected"<%} %> >Агровин</option>
<option <%if(proizvoditel.equals("Агромеркур")){ %>selected="selected"<%} %> >Агромеркур</option>
<option <%if(proizvoditel.equals("Агрон")){ %>selected="selected"<%} %> >Агрон</option>
<option <%if(proizvoditel.equals("Алплер")){ %>selected="selected"<%} %> >Алплер</option>
<option <%if(proizvoditel.equals("Алтајоглу")){ %>selected="selected"<%} %> >Алтајоглу</option>
<option <%if(proizvoditel.equals("Гаспардо")){ %>selected="selected"<%} %> >Гаспардо</option>
<option <%if(proizvoditel.equals("Гружа аграр")){ %>selected="selected"<%} %> >Гружа аграр</option>
<option <%if(proizvoditel.equals("Занон")){ %>selected="selected"<%} %> >Занон</option>
<option <%if(proizvoditel.equals("Зетор")){ %>selected="selected"<%} %> >Зетор</option>
<option <%if(proizvoditel.equals("Илги")){ %>selected="selected"<%} %> >Илги</option>
<option <%if(proizvoditel.equals("Калдерони")){ %>selected="selected"<%} %> >Калдерони</option>
<option <%if(proizvoditel.equals("Континентал")){ %>selected="selected"<%} %> >Континентал</option>
<option <%if(proizvoditel.equals("Космо")){ %>selected="selected"<%} %> >Космо</option>
<option <%if(proizvoditel.equals("Метал фах")){ %>selected="selected"<%} %> >Метал фах</option>
<option <%if(proizvoditel.equals("Минос агри")){ %>selected="selected"<%} %> >Минос агри</option>
<option <%if(proizvoditel.equals("Паксан")){ %>selected="selected"<%} %> >Паксан</option>
<option <%if(proizvoditel.equals("Палазоглу")){ %>selected="selected"<%} %> >Палазоглу</option>
<option <%if(proizvoditel.equals("Пољострој")){ %>selected="selected"<%} %> >Пољострој</option>
<option <%if(proizvoditel.equals("Соналика ИТЛ")){ %>selected="selected"<%} %> >Соналика ИТЛ</option>
<option <%if(proizvoditel.equals("Тиназ")){ %>selected="selected"<%} %> >Тиназ</option>
<option <%if(proizvoditel.equals("Фпм агромеханика")){ %>selected="selected"<%} %> >Фпм агромеханика</option>
<option <%if(proizvoditel.equals("Фпм дељанин")){ %>selected="selected"<%} %> >Фпм дељанин</option>
<option <%if(proizvoditel.equals("Фимакс")){ %>selected="selected"<%} %> >Фимакс</option>
<option <%if(proizvoditel.equals("Хаттат")){ %>selected="selected"<%} %> >Хаттат</option>
                                       
package api;

import java.io.BufferedReader;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import model.Task;


@WebServlet(name = "TasksServlet", urlPatterns = {"/tasks"})
public class TasksServlet extends HttpServlet {

    private JSONObject getJSONBody(BufferedReader reader) throws IOException{
        StringBuilder buffer = new StringBuilder();
        String line = null;
        while ((line = reader.readLine()) != null) {
            buffer.append(line);
        }
        String jsonString = buffer.toString();
    if (jsonString.isEmpty() || jsonString.charAt(0) != '{') {
        throw new IOException("Invalid JSON input: " + jsonString);
    }
        return new JSONObject(buffer.toString());
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        JSONObject file = new JSONObject();
        try{
            file.put("list", new JSONArray(Task.list));
        }catch(Exception ex){
            response.setStatus(500);
            file.put("error", ex.getLocalizedMessage());
        }
        response.getWriter().print(file.toString());
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        JSONObject file = new JSONObject();
        try{
            JSONObject body = getJSONBody(request.getReader());
            String title = body.getString("title");
             if(title != null){
                Task t = new Task(title);
                Task.list.add(t);
             }
            file.put("list", new JSONArray(Task.list));
        }catch(Exception ex){
            response.setStatus(500);
            file.put("error", ex.getLocalizedMessage());
        }
        response.getWriter().print(file.toString());
    }
    
    /**
     * Handles the HTTP <code>DELETE</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        JSONObject file = new JSONObject();
        try{
            String title = request.getParameter("title");
            int i = -1;
            for (Task t: Task.list){
                if(t.getTitle().equals(title)){
                    i = Task.list.indexOf(t);
                    break;
                }
            }
            if(i>-1) Task.list.remove(i);
            file.put("list", new JSONArray(Task.list));
        }catch(Exception ex){
            response.setStatus(500);
            file.put("error", ex.getLocalizedMessage());
        }
        response.getWriter().print(file.toString());
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

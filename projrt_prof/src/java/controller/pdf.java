/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import beans.Employe;
import beans.Profil;
import com.google.gson.Gson;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chapter;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.GrayColor;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfDocument;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.sun.scenario.effect.ImageData;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.EmployeService;
import service.ProfileService;

/**
 *
 * @author macbookpro
 */
@WebServlet(name = "pdf", urlPatterns = "/pdf")
public class pdf extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            // Creating a PdfWriter             
                  
            
            ProfileService pr=new ProfileService();
            Profil p=pr.findById(Integer.parseInt(request.getParameter("pdf")));
            String libelle=p.getLibelle();

            
        Document document = new Document();
        PdfWriter.getInstance(document, new FileOutputStream("/Users/macbookpro/Downloads/Employes.pdf"));
        document.open();
        
                  
        
        Font chapterFont = FontFactory.getFont(FontFactory.HELVETICA, 20, Font.BOLDITALIC);
        Paragraph paragraph1 = new Paragraph("List Des Employes Par Profil : "+libelle,chapterFont);
        document.add(paragraph1);
        float[] columnWidths = {1, 5, 5,5,5};
        PdfPTable table = new PdfPTable(columnWidths);
        table.setSpacingBefore(20f);
        table.setWidthPercentage(100);
        table.getDefaultCell().setUseAscender(true);
        table.getDefaultCell().setUseDescender(true);
        //Font f = new Font(FontFamily.HELVETICA, 13, Font.NORMAL, GrayColor.GRAYWHITE);
        PdfPCell cell = new PdfPCell();
        cell.setBackgroundColor(GrayColor.GRAYBLACK);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setColspan(5);
        table.addCell(cell);
        table.getDefaultCell().setBackgroundColor(new GrayColor(0.75f));
        for (int i = 0; i < 2; i++) {
            table.addCell("#");
            table.addCell("Nom");
            table.addCell("Prenom");
            table.addCell("Email");
            table.addCell("Date Embauche");
        }
        table.setHeaderRows(3);
        table.setFooterRows(1);
        table.getDefaultCell().setBackgroundColor(GrayColor.GRAYWHITE);
        table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
            EmployeService se=new EmployeService();
            List<Employe> em=null;
            em=se.findByProfil(Integer.parseInt(request.getParameter("pdf")));
        for (int counter = 0; counter < em.size(); counter++) {
            table.addCell(String.valueOf(em.get(counter).getId()));
            table.addCell(em.get(counter).getNom());
            table.addCell(em.get(counter).getPrenom());
            table.addCell(em.get(counter).getEmail());
            table.addCell(em.get(counter).getDateEmbauche().toString());
        }
        document.add(table);
        document.close();
        response.setContentType("application/json");
            Gson g = new Gson();
            g.toJson("Votre PDF est enregistrer dans folder : /Users/macbookpro/Downloads", response.getWriter());
            

        
      
            
           
        } 
catch (DocumentException ex) {
            Logger.getLogger(pdf.class.getName()).log(Level.SEVERE, null, ex);
        }
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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

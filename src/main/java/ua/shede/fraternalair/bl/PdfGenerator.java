package ua.shede.fraternalair.bl;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import ua.shede.fraternalair.entity.FlightTicket;

public class PdfGenerator {

    public static String getBasePath(){
        return "C:\\Users\\Denis\\IdeaProjects\\fraternal-air\\downloads\\files\\";
    }

    public static void generatePdf(FlightTicket flightTicket){
        Document doc = new Document();
        try
        {
            PdfWriter writer = PdfWriter.getInstance(doc, new FileOutputStream(getBasePath() + flightTicket.getTicketCode() + ".pdf"));
            System.out.println(getBasePath());
            System.out.println("PDF created.");
            doc.open();
            doc.add(new Paragraph("Ticket code " + flightTicket.getTicketCode()));
            doc.add(new Paragraph("Flight code " + flightTicket.getFlight().getFlightCode()));
            doc.add(new Paragraph("Route " + flightTicket.getFlight().getStartAirport().getDefaultAirportName()
                    + ", " + flightTicket.getFlight().getStartAirport().getDefaultCountryName() + " - " + flightTicket.getFlight().getEndAirport().getAirportName()
                    + ", " + flightTicket.getFlight().getCountry().getCountryName()));
            doc.add(new Paragraph("Owner " + flightTicket.getAUser().getFirstName() + " " + flightTicket.getAUser().getLastName()));
            doc.close();
            writer.close();
        }
        catch (DocumentException | FileNotFoundException e)
        {
            e.printStackTrace();
        }
    }
}


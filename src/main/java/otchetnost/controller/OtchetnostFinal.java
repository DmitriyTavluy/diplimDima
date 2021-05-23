package otchetnost.controller;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import otchetnost.model.Tovarooborot;
import otchetnost.service.TovarooborotService;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class OtchetnostFinal {

    private XSSFWorkbook xssfWorkbook;
    private XSSFSheet xssfSheet;

    private List<Tovarooborot> tovarooborots;

    public OtchetnostFinal(List<Tovarooborot> tovarooborots) {
        this.tovarooborots = tovarooborots;
        xssfWorkbook = new XSSFWorkbook();
        xssfSheet = xssfWorkbook.createSheet("FinalTovarooborot");
    }

    private void createTable() {
        Row row = xssfSheet.createRow(0);
        Cell cell1 = row.createCell(0);
        cell1.setCellValue("Объем продаж");
        Cell cell2 = row.createCell(1);
        cell2.setCellValue("Структура ассортимента");
        Cell cell3 = row.createCell(2);
        cell3.setCellValue("Скорость товарооборота");
        Cell cell4 = row.createCell(3);
        cell4.setCellValue("Ритмичность продаж");
        Cell cell5 = row.createCell(4);
        cell5.setCellValue("Дата");
        Cell cell6 = row.createCell(5);
        cell6.setCellValue("Город");
    }
    private void setDataToTable() {
        int i = 1;
        for (Tovarooborot tovarooborot : tovarooborots) {
            if (tovarooborot.isCheckOtchet()){
                Row row = xssfSheet.createRow(i);
                Cell cell1 = row.createCell(0);
                cell1.setCellValue(tovarooborot.getVolume());
                Cell cell2 = row.createCell(1);
                cell2.setCellValue(tovarooborot.getAssortment());
                Cell cell3 = row.createCell(2);
                cell3.setCellValue(tovarooborot.getSpeed());
                Cell cell4 = row.createCell(3);
                cell4.setCellValue(tovarooborot.getRhythm());
                Cell cell5 = row.createCell(4);
                cell5.setCellValue(tovarooborot.getDatetime());
                Cell cell6 = row.createCell(5);
                cell6.setCellValue(tovarooborot.getId().getCity());
                i++;

            }
        }
    }

    public void otchetFinal(HttpServletResponse httpServletResponse) throws IOException {
        createTable();
        setDataToTable();
        ServletOutputStream servletOutputStream = httpServletResponse.getOutputStream();
        xssfWorkbook.write(servletOutputStream);
        xssfWorkbook.close();
        servletOutputStream.close();
    }


}

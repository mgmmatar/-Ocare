/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ocare.obook.report;

import ar.com.fdvs.dj.core.DynamicJasperHelper;
import ar.com.fdvs.dj.core.layout.ClassicLayoutManager;
import ar.com.fdvs.dj.domain.DynamicReport;
import ar.com.fdvs.dj.domain.Style;
import ar.com.fdvs.dj.domain.builders.ColumnBuilder;
import ar.com.fdvs.dj.domain.builders.ColumnBuilderException;
import ar.com.fdvs.dj.domain.builders.DynamicReportBuilder;
import ar.com.fdvs.dj.domain.builders.StyleBuilder;
import ar.com.fdvs.dj.domain.constants.Border;
import ar.com.fdvs.dj.domain.constants.Font;
import ar.com.fdvs.dj.domain.constants.HorizontalAlign;
import ar.com.fdvs.dj.domain.constants.Transparency;
import ar.com.fdvs.dj.domain.constants.VerticalAlign;
import ar.com.fdvs.dj.domain.entities.columns.AbstractColumn;
import com.ocare.obook.domain.Patient;
import java.awt.Color;
import java.util.ArrayList;
import java.util.List;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.hibernate.mapping.Collection;

/**
 *
 * @author khaledeng
 */
public class PatientReport {
   
     private final List<Patient> list = new ArrayList<Patient>();
 
    public PatientReport(List<Patient> c) {
        list.addAll(c);
    }
 
    public JasperPrint getReport(List<ReportField> fields,String reportTitle,String reportSubTitle) throws ColumnBuilderException, JRException, ClassNotFoundException {
        Style headerStyle = createHeaderStyle();
        Style detailTextStyle = createDetailTextStyle();        
        Style detailNumberStyle = createDetailNumberStyle();        
       // DynamicReport dynaReport = getReport(headerStyle, detailTextStyle,detailNumberStyle);
        DynamicReport dynaReport = getDynamicReportContent(fields, reportTitle, reportSubTitle,headerStyle, detailTextStyle,detailNumberStyle);
        JasperPrint jp = DynamicJasperHelper.generateJasperPrint(dynaReport, new ClassicLayoutManager(), new JRBeanCollectionDataSource(list));
        return jp;
    }
    
      public JasperPrint getReport() throws ColumnBuilderException, JRException, ClassNotFoundException {
        Style headerStyle = createHeaderStyle();
        Style detailTextStyle = createDetailTextStyle();        
        Style detailNumberStyle = createDetailNumberStyle();        
        DynamicReport dynaReport = getReport(headerStyle, detailTextStyle,detailNumberStyle);
      
        JasperPrint jp = DynamicJasperHelper.generateJasperPrint(dynaReport, new ClassicLayoutManager(), new JRBeanCollectionDataSource(list));
        return jp;
    }
    
    private Style createHeaderStyle() {        
        StyleBuilder sb=new StyleBuilder(true);
        sb.setFont(Font.VERDANA_MEDIUM_BOLD);
        sb.setBorder(Border.THIN);
        sb.setBorderBottom(Border.PEN_2_POINT);
        sb.setBorderColor(Color.BLACK);
        sb.setBackgroundColor(Color.ORANGE);
        sb.setTextColor(Color.BLACK);
        sb.setHorizontalAlign(HorizontalAlign.CENTER);
        sb.setVerticalAlign(VerticalAlign.MIDDLE);
        sb.setTransparency(Transparency.OPAQUE);        
        return sb.build();
    }
    
    private Style createDetailTextStyle(){
        StyleBuilder sb=new StyleBuilder(true);
        sb.setFont(Font.VERDANA_MEDIUM);
        sb.setBorder(Border.DOTTED);        
        sb.setBorderColor(Color.BLACK);        
        sb.setTextColor(Color.BLACK);
        sb.setHorizontalAlign(HorizontalAlign.LEFT);
        sb.setVerticalAlign(VerticalAlign.MIDDLE);
        sb.setPaddingLeft(5);        
        return sb.build();
    }
    
      private Style createDetailNumberStyle(){
        StyleBuilder sb=new StyleBuilder(true);
        sb.setFont(Font.VERDANA_MEDIUM);
        sb.setBorder(Border.DOTTED);        
        sb.setBorderColor(Color.BLACK);        
        sb.setTextColor(Color.BLACK);
        sb.setHorizontalAlign(HorizontalAlign.RIGHT);
        sb.setVerticalAlign(VerticalAlign.MIDDLE);
        sb.setPaddingRight(5);        
        return sb.build();
    }
    
    
 
    private AbstractColumn createColumn(String property, Class type,
            String title, int width, Style headerStyle, Style detailStyle)
            throws ColumnBuilderException {
        AbstractColumn columnState = ColumnBuilder.getNew()
                .setColumnProperty(property, type.getName()).setTitle(
                        title).setWidth(Integer.valueOf(width))
                .setStyle(detailStyle).setHeaderStyle(headerStyle).build();
        return columnState;
    }
 
    private DynamicReport getReport(Style headerStyle, Style detailTextStyle, Style detailNumStyle) throws ColumnBuilderException, ClassNotFoundException {
        
        DynamicReportBuilder report=new DynamicReportBuilder();
        
        AbstractColumn columnEmpNo = createColumn("id", Integer.class,"ID", 30, headerStyle, detailTextStyle);
        AbstractColumn columnName = createColumn("fName", String.class,"Firsrt Name", 30, headerStyle, detailTextStyle);        
        AbstractColumn columnSalary = createColumn("midName", String.class,"midName", 30, headerStyle, detailNumStyle);
        AbstractColumn columnCommission = createColumn("gender", String.class,"gender", 30, headerStyle, detailNumStyle);
        report.addColumn(columnEmpNo)
                .addColumn(columnName).addColumn(columnSalary).addColumn(columnCommission);
                
        StyleBuilder titleStyle=new StyleBuilder(true);
        titleStyle.setHorizontalAlign(HorizontalAlign.CENTER);
        titleStyle.setFont(new Font(20, Font._FONT_GEORGIA, true));
        
        StyleBuilder subTitleStyle=new StyleBuilder(true);
        subTitleStyle.setHorizontalAlign(HorizontalAlign.CENTER);
        subTitleStyle.setFont(new Font(Font.MEDIUM, Font._FONT_GEORGIA, true));
        
        
        
        report.setTitle("Patient Report");
        report.setTitleStyle(titleStyle.build());
        report.setSubtitle("Patient Information");
        report.setSubtitleStyle(subTitleStyle.build());
        report.setUseFullPageWidth(true); 
        return report.build();
    }    
    
    private DynamicReport getDynamicReportContent(List<ReportField> fields,String reportTitle,String reportSubTitle
    ,Style headerStyle, Style detailTextStyle, Style detailNumStyle) throws ColumnBuilderException{
        // Create New DynamicBuilder
        DynamicReportBuilder report=new DynamicReportBuilder();
        // Check the Sent Fields
        if(fields.size()>0){
             // Loop on the Report Fields 
            for(ReportField field:fields){
                // generate the Coloumn Value 
                AbstractColumn currrentColoumn = createColumn(field.getName(),field.getClass(),field.getViewName(),field.getSize().intValue(),headerStyle, detailTextStyle); 
                // Add it to Report
               report.addColumn(currrentColoumn);
            }//end for Loop 
        }else{
               
        }//end if-Else Block 
        
        StyleBuilder titleStyle=new StyleBuilder(true);
        titleStyle.setHorizontalAlign(HorizontalAlign.CENTER);
        titleStyle.setFont(new Font(20, Font._FONT_GEORGIA, true));
        
        StyleBuilder subTitleStyle=new StyleBuilder(true);
        subTitleStyle.setHorizontalAlign(HorizontalAlign.CENTER);
        subTitleStyle.setFont(new Font(Font.MEDIUM, Font._FONT_GEORGIA, true));
        
        
        report.setTitle(reportTitle);
        report.setTitleStyle(titleStyle.build());
        report.setSubtitle(reportSubTitle);
        report.setSubtitleStyle(subTitleStyle.build());
        report.setUseFullPageWidth(true); 
        // return result
        return report.build();

    }//end getDynamicReportContent
    
}
    
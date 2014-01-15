//
// This file was generated by the JavaTM Architecture for XML Binding(JAXB) Reference Implementation, vJAXB 2.1.10 in JDK 6 
// See <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Any modifications to this file will be lost upon recompilation of the source schema. 
// Generated on: 2013.08.28 at 01:34:47 PM BRT 
//


package br.com.centralit.citsmart.rest.schema;

import java.math.BigInteger;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlSeeAlso;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for CtNotification complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="CtNotification">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="Number" type="{http://www.w3.org/2001/XMLSchema}integer"/>
 *         &lt;element name="TaskId" type="{http://www.w3.org/2001/XMLSchema}integer"/>
 *         &lt;element name="Type" type="{http://www.w3.org/2001/XMLSchema}int"/>
 *         &lt;element name="Date" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="EndSLA" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="TimeFlag" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="Task" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="Service" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="Waiting" type="{http://www.w3.org/2001/XMLSchema}int"/>         
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "CtNotification", propOrder = {
    "number",
    "taskId",
    "type",
    "date",
    "endSLA",
    "timeFlag",
    "task",
    "service",
    "waiting"
})
@XmlSeeAlso({
    CtNotificationDetail.class
})
public class CtNotification {

    @XmlElement(name = "Number", required = true)
    protected BigInteger number;
    @XmlElement(name = "TaskId", required = true)
    protected BigInteger taskId;
    @XmlElement(name = "Type")
    protected int type;
    @XmlElement(name = "Date", required = true)
    protected String date;
    @XmlElement(name = "EndSLA")
    protected String endSLA;
    @XmlElement(name = "TimeFlag")
    protected Integer timeFlag;
    @XmlElement(name = "Task", required = true)
    protected String task;
    @XmlElement(name = "Service", required = true)
    protected String service;
    @XmlElement(name = "Waiting")
    protected int waiting;    

    /**
     * Gets the value of the number property.
     * 
     * @return
     *     possible object is
     *     {@link BigInteger }
     *     
     */
    public BigInteger getNumber() {
        return number;
    }

    /**
     * Sets the value of the number property.
     * 
     * @param value
     *     allowed object is
     *     {@link BigInteger }
     *     
     */
    public void setNumber(BigInteger value) {
        this.number = value;
    }

    /**
     * Gets the value of the taskId property.
     * 
     * @return
     *     possible object is
     *     {@link BigInteger }
     *     
     */
    public BigInteger getTaskId() {
        return taskId;
    }

    /**
     * Sets the value of the taskId property.
     * 
     * @param value
     *     allowed object is
     *     {@link BigInteger }
     *     
     */
    public void setTaskId(BigInteger value) {
        this.taskId = value;
    }

    /**
     * Gets the value of the type property.
     * 
     */
    public int getType() {
        return type;
    }

    /**
     * Sets the value of the type property.
     * 
     */
    public void setType(int value) {
        this.type = value;
    }

    /**
     * Gets the value of the date property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDate() {
        return date;
    }

    /**
     * Sets the value of the date property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDate(String value) {
        this.date = value;
    }

    /**
     * Gets the value of the endSLA property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getEndSLA() {
        return endSLA;
    }

    /**
     * Sets the value of the endSLA property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setEndSLA(String value) {
        this.endSLA = value;
    }

    /**
     * Gets the value of the timeFlag property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getTimeFlag() {
        return timeFlag;
    }

    /**
     * Sets the value of the timeFlag property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setTimeFlag(Integer value) {
        this.timeFlag = value;
    }

    /**
     * Gets the value of the task property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getTask() {
        return task;
    }

    /**
     * Sets the value of the task property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setTask(String value) {
        this.task = value;
    }

    /**
     * Gets the value of the service property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getService() {
        return service;
    }

    /**
     * Sets the value of the service property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setService(String value) {
        this.service = value;
    }
    
    /**
     * Gets the value of the waiting property.
     * 
     */
    public int getWaiting() {
        return waiting;
    }

    /**
     * Sets the value of the waiting property.
     * 
     */
    public void setWaiting(int value) {
        this.waiting = value;
    }
    

}

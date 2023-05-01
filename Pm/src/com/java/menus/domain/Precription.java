package com.java.menus.domain;

public class Precription {
	private int prescriptionNo;
	private String patientId;
	private String doctorName;
	private String prescriptionDate;
	private int daysMedication;
	private int drugNumber;

	public Precription() {}

	public Precription(int prescriptionNo, String patientId, String doctorName, String prescriptionDate,
			int daysMedication, int drugNumber) {
		super();
		this.prescriptionNo = prescriptionNo;
		this.patientId = patientId;
		this.doctorName = doctorName;
		this.prescriptionDate = prescriptionDate;
		this.daysMedication = daysMedication;
		this.drugNumber = drugNumber;
	}

	public int getPrescriptionNo() {
		return prescriptionNo;
	}

	public void setPrescriptionNo(int prescriptionNo) {
		this.prescriptionNo = prescriptionNo;
	}

	public String getPatientId() {
		return patientId;
	}

	public void setPatientId(String patientId) {
		this.patientId = patientId;
	}

	public String getDoctorName() {
		return doctorName;
	}

	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}

	public String getPrescriptionDate() {
		return prescriptionDate;
	}

	public void setPrescriptionDate(String prescriptionDate) {
		this.prescriptionDate = prescriptionDate;
	}

	public int getDaysMedication() {
		return daysMedication;
	}

	public void setDaysMedication(int daysMedication) {
		this.daysMedication = daysMedication;
	}

	public int getDrugNumber() {
		return drugNumber;
	}

	public void setDrugNumber(int drugNumber) {
		this.drugNumber = drugNumber;
	}
	
	
	
	
	
}

package com.java.menus.domain;

public class Prescription {
	private int prescriptionNo;
	private String patientId;
	private String doctorName;
	private String prescriptionDate;
	private int daysMedication;
	private int drugNumber;

	public Prescription() {}

	public Prescription(int prescriptionNo, String patientId, String doctorName, String prescriptionDate,
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

	@Override
	public String toString() {
		return "처방전 번호 =" + prescriptionNo + ", 담당 의사 = " + doctorName + ", 처방 일자 = "
				+ prescriptionDate + ", 투약 일수 = " + daysMedication + ", 약 번호 = " + drugNumber + "\n";
	}
	
	
	
	
	
}

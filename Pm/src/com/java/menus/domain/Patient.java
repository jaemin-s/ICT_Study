package com.java.menus.domain;

public class Patient {
	private String patientId;
	private String patientName;
	private String patientAddress;
	private String patientPhone;
	
	public Patient() {}

	public Patient(String patientId, String patientName, String patientAddress, String patientPhone) {
		super();
		this.patientId = patientId;
		this.patientName = patientName;
		this.patientAddress = patientAddress;
		this.patientPhone = patientPhone;
	}

	public String getPatientId() {
		return patientId;
	}

	public void setPatientId(String patientId) {
		this.patientId = patientId;
	}

	public String getPatientName() {
		return patientName;
	}

	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}

	public String getPatientAddress() {
		return patientAddress;
	}

	public void setPatientAddress(String patientAddress) {
		this.patientAddress = patientAddress;
	}

	public String getPatientPhone() {
		return patientPhone;
	}

	public void setPatientPhone(String patientPhone) {
		this.patientPhone = patientPhone;
	}

	@Override
	public String toString() {
		return "주민등록번호 = " + patientId + ", 이름 = " + patientName + ", 주소 = " + patientAddress
				+ ", 연락처 = " + patientPhone + "\n";
	}
	
	
}

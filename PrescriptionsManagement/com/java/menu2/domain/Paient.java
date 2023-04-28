package com.java.menu2.domain;

public class Paient {
	private String patientId;
	private String patientName;
	private String patientAddress;
	private String patientPhone;
	
	public Paient() {}

	public Paient(String patientId, String patientName, String patientAddress, String patientPhone) {
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
	
	
}

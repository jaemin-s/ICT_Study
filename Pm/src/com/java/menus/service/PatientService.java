package com.java.menus.service;

import static com.java.view.AppUI.*;

import com.java.common.AppService;
import com.java.menus.domain.Patient;
import com.java.menus.domain.Prescription;

public class PatientService implements AppService{

	@Override
	public void start() {
		while(true) {
			PatientScreen();
			int selection = inputInteger();
			switch (selection) {
			case 1: // 신규 환자 등록
				addPatient();
				break;
			case 2: // 처방전 작성
				addPrescription();
				break;
			case 3:
				return;
			default:
				System.out.println("잘 못 입력했습니다.");
			}//end switch
			
		}//end while
		
	}//end start()

	//신규 환자 등록
	private void addPatient() {
		System.out.println("\n============= 신규 환자 등록 ==============");
		System.out.println("이름: ");
		String name = inputString();
		
		System.out.println("주민등록번호: ");
		String id = inputString();
		
		System.out.println("주소: ");
		String address = inputString();
		
		System.out.println("전화번호: ");
		String phone = inputString();
		
		Patient patient = new Patient();
		patient.setPatientName(name);
		patient.setPatientId(id);
		patient.setPatientAddress(address);
		patient.setPatientPhone(phone);
		
	}//end addPatient()
	
//	CREATE TABLE prescriptions(
//		    prescription_no NUMBER(6) PRIMARY KEY,
//		    patient_id VARCHAR2(20) REFERENCES patients(patient_id),
//		    doctor_name VARCHAR2(20) NOT NULL,
//		    drug_number NUMBER(10) REFERENCES drugs(drug_number) NOT NULL,
//		    days_medication NUMBER(3) NOT NULL,
//		    prescription_date DATE DEFAULT sysdate NOT NULL
//		);
	//처방전 작성
	private void addPrescription() {
		System.out.println("\n============= 처방전 작성 ==============");
		System.out.println("환자 주민등록번호('-'포함): ");
		String Id = inputString(); 
		
		System.out.println("담당의사 이름: ");
		String docName = inputString();
		
		System.out.println("의약품 번호: ");
		int medNumber = inputInteger();
		
		System.out.println("투약 일수: ");
		int daysMed = inputInteger();
		
		System.out.println("처방일(년/월/일): ");
		String preDate = inputString();
		
		Prescription prescription = new Prescription();
		prescription.setPatientId(Id);
		prescription.setDoctorName(docName);
		prescription.setDrugNumber(medNumber);
		prescription.setDaysMedication(daysMed);
		prescription.setPrescriptionDate(preDate);
		
	}//end addPrescription

}//end class
